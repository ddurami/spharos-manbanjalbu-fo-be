package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberJoinRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.LoginIdCheckResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MarketingConsentResultResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberJoinCompleteResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.TermAgreementResultResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAuth;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberProfile;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberTermsAgreement;
import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import com.spharos.manbanjalbu_be.domain.member.entity.Terms;
import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.SignupStep;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberProfileRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.SignupSessionRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class MemberJoinService {

	private final MemberRepository memberRepository;
	private final MemberProfileRepository memberProfileRepository;
	private final SignupSessionRepository signupSessionRepository;
	private final MemberTermsService memberTermsService;
	private final PasswordEncoder passwordEncoder;

	public MemberJoinService(
			MemberRepository memberRepository,
			MemberProfileRepository memberProfileRepository,
			SignupSessionRepository signupSessionRepository,
			MemberTermsService memberTermsService,
			PasswordEncoder passwordEncoder
	) {
		this.memberRepository = memberRepository;
		this.memberProfileRepository = memberProfileRepository;
		this.signupSessionRepository = signupSessionRepository;
		this.memberTermsService = memberTermsService;
		this.passwordEncoder = passwordEncoder;
	}

	@Transactional(readOnly = true)
	public LoginIdCheckResponse checkLoginIdAvailability(String loginId) {
		String trimmedLoginId = loginId == null ? "" : loginId.trim();

		if (!StringUtils.hasText(trimmedLoginId)) {
			throw new BusinessException(ErrorCode.INVALID_INPUT, "아이디를 입력해주세요.");
		}

		if (trimmedLoginId.length() < 4 || trimmedLoginId.length() > 50) {
			return new LoginIdCheckResponse(false, "아이디는 4~50자리여야 합니다.");
		}

		boolean available = !memberRepository.existsByLoginId(trimmedLoginId);
		return new LoginIdCheckResponse(
				available,
				available ? "사용 가능한 아이디입니다." : "이미 사용 중인 아이디입니다."
		);
	}

	public MemberJoinCompleteResponse join(MemberJoinRequest request) {
		SignupSession session = memberTermsService.getValidSession(request.verificationToken());

		if (session.getStep() != SignupStep.TERMS_AGREED) {
			throw new BusinessException(ErrorCode.SIGNUP_STEP_INVALID);
		}

		validateVerifiedIdentity(session, request);
		validateDuplicateMember(request);

		Member member = Member.create(request.loginId(), passwordEncoder.encode(request.password()));
		MemberProfile profile = MemberProfile.create(
				member,
				request.name(),
				StringUtils.hasText(request.nickname()) ? request.nickname() : null,
				request.email(),
				normalizePhone(request.phone()),
				request.birthDate()
		);
		member.attachProfile(profile);
		member.addAuth(MemberAuth.create(
				member,
				session.getAuthMethod(),
				session.getVerifiedValue(),
				session.getCi()
		));

		Map<Long, Terms> termsMap = memberTermsService.getTermsMap();
		List<TermAgreementResultResponse> agreementResults = new ArrayList<>();

		for (Map.Entry<Long, Boolean> entry : session.getTermAgreements().entrySet()) {
			Terms terms = termsMap.get(entry.getKey());
			if (terms == null) {
				continue;
			}
			boolean agreed = Boolean.TRUE.equals(entry.getValue());
			member.addTermsAgreement(MemberTermsAgreement.create(member, terms, agreed));
			agreementResults.add(new TermAgreementResultResponse(
					terms.getId(),
					terms.getTitle(),
					agreed,
					terms.getIsMandatory()
			));
		}

		MarketingConsentResultResponse marketingConsent = memberTermsService.buildMarketingConsentResult(
				new ArrayList<>(termsMap.values()),
				session.getTermAgreements()
		);

		if (marketingConsent.agreed()) {
			profile.updateMarketingConsent(true, true);
		}

		Member savedMember = memberRepository.save(member);
		signupSessionRepository.delete(session);

		return new MemberJoinCompleteResponse(
				savedMember.getId(),
				savedMember.getLoginId(),
				profile.getName(),
				marketingConsent,
				agreementResults
		);
	}

	private void validateVerifiedIdentity(SignupSession session, MemberJoinRequest request) {
		if (session.getAuthMethod() == AuthMethod.EMAIL && !session.getVerifiedValue().equals(request.email())) {
			throw new BusinessException(ErrorCode.INVALID_INPUT, "인증된 이메일과 입력 이메일이 일치하지 않습니다.");
		}
		if (session.getAuthMethod() == AuthMethod.PASS
				&& !session.getVerifiedValue().equals(normalizePhone(request.phone()))) {
			throw new BusinessException(ErrorCode.INVALID_INPUT, "인증된 휴대전화번호와 입력 번호가 일치하지 않습니다.");
		}
	}

	private void validateDuplicateMember(MemberJoinRequest request) {
		if (memberRepository.existsByLoginId(request.loginId())) {
			throw new BusinessException(ErrorCode.DUPLICATE_LOGIN_ID);
		}
		if (memberProfileRepository.existsByEmail(request.email())) {
			throw new BusinessException(ErrorCode.DUPLICATE_EMAIL);
		}
		if (memberProfileRepository.existsByPhone(normalizePhone(request.phone()))) {
			throw new BusinessException(ErrorCode.DUPLICATE_PHONE);
		}
		if (StringUtils.hasText(request.nickname()) && memberProfileRepository.existsByNickname(request.nickname())) {
			throw new BusinessException(ErrorCode.DUPLICATE_NICKNAME);
		}
	}

	private String normalizePhone(String phone) {
		return phone.replaceAll("[^0-9]", "");
	}
}
