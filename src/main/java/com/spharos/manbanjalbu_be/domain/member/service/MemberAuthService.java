package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.EmailVerificationConfirmRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.EmailVerificationSendRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.PhoneVerificationConfirmRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.PhoneVerificationSendRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.VerificationConfirmResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.VerificationSendResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import com.spharos.manbanjalbu_be.domain.member.entity.VerificationCode;
import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import com.spharos.manbanjalbu_be.domain.member.repository.SignupSessionRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.VerificationCodeRepository;
import com.spharos.manbanjalbu_be.global.component.EmailComponent;
import com.spharos.manbanjalbu_be.global.component.OctomoComponent;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;

@Service
@Transactional
public class MemberAuthService {

	private static final Logger log = LoggerFactory.getLogger(MemberAuthService.class);

	private final VerificationCodeRepository verificationCodeRepository;
	private final SignupSessionRepository signupSessionRepository;
	private final EmailComponent emailComponent;
	private final OctomoComponent octomoComponent;
	private final long verificationExpireMinutes;
	private final long signupSessionExpireMinutes;
	private final boolean exposeDevCode;

	public MemberAuthService(
			VerificationCodeRepository verificationCodeRepository,
			SignupSessionRepository signupSessionRepository,
			EmailComponent emailComponent,
			OctomoComponent octomoComponent,
			@Value("${member.verification.expire-minutes:5}") long verificationExpireMinutes,
			@Value("${member.signup-session.expire-minutes:30}") long signupSessionExpireMinutes,
			@Value("${member.verification.expose-dev-code:true}") boolean exposeDevCode
	) {
		this.verificationCodeRepository = verificationCodeRepository;
		this.signupSessionRepository = signupSessionRepository;
		this.emailComponent = emailComponent;
		this.octomoComponent = octomoComponent;
		this.verificationExpireMinutes = verificationExpireMinutes;
		this.signupSessionExpireMinutes = signupSessionExpireMinutes;
		this.exposeDevCode = exposeDevCode;
	}

	public VerificationSendResponse sendEmailVerification(EmailVerificationSendRequest request) {
		String code = emailComponent.generateVerificationCode();
		LocalDateTime expiresAt = LocalDateTime.now().plusMinutes(verificationExpireMinutes);

		verificationCodeRepository.save(VerificationCode.create(AuthMethod.EMAIL, request.email(), code, expiresAt));
		emailComponent.sendVerificationEmail(request.email(), code);

		return new VerificationSendResponse(
				"이메일로 인증번호를 발송했습니다.",
				exposeDevCode ? code : null,
				null,
				null
		);
	}

	public VerificationConfirmResponse confirmEmailVerification(EmailVerificationConfirmRequest request) {
		return confirmLocalVerification(AuthMethod.EMAIL, request.email(), request.code(), null);
	}

	public VerificationSendResponse sendPhoneVerification(PhoneVerificationSendRequest request) {
		String phone = normalizePhone(request.phone());
		String authCode = generateCode();

		if (octomoComponent.isMockEnabled()) {
			LocalDateTime expiresAt = LocalDateTime.now().plusMinutes(verificationExpireMinutes);
			verificationCodeRepository.save(VerificationCode.create(AuthMethod.PASS, phone, authCode, expiresAt));
			log.info("[MOCK OCTOMO] 휴대폰 인증번호 생성 - phone: {}, authCode: {}", phone, authCode);

			return new VerificationSendResponse(
					"휴대폰 인증번호가 발송되었습니다. (Octomo mock)",
					exposeDevCode ? authCode : null,
					authCode,
					null
			);
		}

		String receivePhoneNumber = octomoComponent.getReceivePhoneNumber();
		log.info(
				"[OCTOMO] 휴대폰 인증번호 생성 - phone: {}, authCode: {}, receivePhoneNumber: {}",
				phone,
				authCode,
				receivePhoneNumber
		);

		return new VerificationSendResponse(
				"""
						본인 휴대폰에서 아래 수신번호로 인증코드만 문자 발송한 뒤 [다음]을 눌러주세요.
						(서버에서 문자를 보내지 않습니다. MO 인증 방식)
						""".trim(),
				null,
				authCode,
				receivePhoneNumber
		);
	}

	public VerificationConfirmResponse confirmPhoneVerification(PhoneVerificationConfirmRequest request) {
		String phone = normalizePhone(request.phone());
		String code = request.code().trim();

		log.info("[OCTOMO] 휴대폰 인증 확인 요청 - phone: {}, code: {}", phone, code);

		if (octomoComponent.isMockEnabled()) {
			return confirmLocalVerification(AuthMethod.PASS, phone, code, "MOCK-CI-" + phone);
		}

		boolean verified = verifyOctomoMessageWithRetry(phone, code);
		if (!verified) {
			throw new BusinessException(
					ErrorCode.OCTOMO_VERIFICATION_FAILED,
					"""
							인증 문자를 확인하지 못했습니다.
							1) 본인 휴대폰(%s)에서 1666-3538로 인증코드만 발송했는지
							2) 문자 전송 후 10~30초 뒤 [다음]을 눌렀는지 확인해주세요.
							""".formatted(phone).trim()
			);
		}

		return createIdentityVerifiedSession(AuthMethod.PASS, phone, "OCTOMO-CI-" + phone);
	}

	private boolean verifyOctomoMessageWithRetry(String phone, String code) {
		int maxAttempts = 3;
		long waitMillis = 2_000L;

		for (int attempt = 1; attempt <= maxAttempts; attempt++) {
			if (octomoComponent.existsMessage(phone, code)) {
				return true;
			}

			if (attempt < maxAttempts) {
				log.info("Octomo 인증 재시도 대기 - phone: {}, attempt: {}/{}", phone, attempt, maxAttempts);
				try {
					Thread.sleep(waitMillis);
				} catch (InterruptedException exception) {
					Thread.currentThread().interrupt();
					break;
				}
			}
		}

		return false;
	}

	private VerificationConfirmResponse confirmLocalVerification(
			AuthMethod authMethod,
			String target,
			String code,
			String ci
	) {
		VerificationCode verificationCode = verificationCodeRepository
				.findFirstByAuthMethodAndTargetValueAndIsUsedFalseOrderByIdDesc(authMethod, target)
				.orElseThrow(() -> new BusinessException(ErrorCode.VERIFICATION_CODE_NOT_FOUND));

		if (verificationCode.getIsUsed()) {
			throw new BusinessException(ErrorCode.VERIFICATION_ALREADY_USED);
		}
		if (verificationCode.isExpired()) {
			throw new BusinessException(ErrorCode.VERIFICATION_CODE_EXPIRED);
		}
		if (!verificationCode.getCode().equals(code)) {
			throw new BusinessException(ErrorCode.VERIFICATION_CODE_MISMATCH);
		}

		verificationCode.markUsed();
		return createIdentityVerifiedSession(authMethod, target, ci);
	}

	private VerificationConfirmResponse createIdentityVerifiedSession(
			AuthMethod authMethod,
			String verifiedValue,
			String ci
	) {
		String token = UUID.randomUUID().toString();
		SignupSession session = SignupSession.createIdentityVerified(
				token,
				authMethod,
				verifiedValue,
				ci,
				LocalDateTime.now().plusMinutes(signupSessionExpireMinutes)
		);
		signupSessionRepository.save(session);

		return new VerificationConfirmResponse(token, authMethod, verifiedValue);
	}

	private String generateCode() {
		int value = ThreadLocalRandom.current().nextInt(100000, 1000000);
		return String.valueOf(value);
	}

	private String normalizePhone(String phone) {
		return phone.replaceAll("[^0-9]", "");
	}
}
