package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberProfile;
import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.MemberStatus;
import com.spharos.manbanjalbu_be.domain.member.enums.SignupStep;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberProfileRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.SignupSessionRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class MemberVerifiedSessionService {

	private final SignupSessionRepository signupSessionRepository;
	private final MemberProfileRepository memberProfileRepository;

	public MemberVerifiedSessionService(
			SignupSessionRepository signupSessionRepository,
			MemberProfileRepository memberProfileRepository
	) {
		this.signupSessionRepository = signupSessionRepository;
		this.memberProfileRepository = memberProfileRepository;
	}

	public SignupSession getIdentityVerifiedSession(String verificationToken) {
		SignupSession session = signupSessionRepository.findById(verificationToken)
				.orElseThrow(() -> new BusinessException(ErrorCode.SIGNUP_SESSION_NOT_FOUND));

		if (session.isExpired()) {
			throw new BusinessException(ErrorCode.SIGNUP_SESSION_EXPIRED);
		}

		if (session.getStep() != SignupStep.IDENTITY_VERIFIED) {
			throw new BusinessException(
					ErrorCode.SIGNUP_STEP_INVALID,
					"이메일 또는 휴대폰 인증을 먼저 완료해주세요."
			);
		}

		return session;
	}

	public SignupSession getPasswordResetVerifiedSession(String verificationToken) {
		SignupSession session = signupSessionRepository.findById(verificationToken)
				.orElseThrow(() -> new BusinessException(ErrorCode.SIGNUP_SESSION_NOT_FOUND));

		if (session.isExpired()) {
			throw new BusinessException(ErrorCode.SIGNUP_SESSION_EXPIRED);
		}

		if (session.getStep() != SignupStep.PASSWORD_RESET_VERIFIED) {
			throw new BusinessException(
					ErrorCode.SIGNUP_STEP_INVALID,
					"계정 확인을 먼저 완료해주세요."
			);
		}

		return session;
	}

	public Member findActiveMember(SignupSession session) {
		MemberProfile profile = switch (session.getAuthMethod()) {
			case EMAIL -> memberProfileRepository.findByEmail(session.getVerifiedValue())
					.orElseThrow(() -> new BusinessException(
							ErrorCode.MEMBER_NOT_FOUND,
							"입력하신 정보와 일치하는 회원을 찾을 수 없습니다."
					));
			case PASS -> memberProfileRepository.findByPhone(normalizePhone(session.getVerifiedValue()))
					.orElseThrow(() -> new BusinessException(
							ErrorCode.MEMBER_NOT_FOUND,
							"입력하신 정보와 일치하는 회원을 찾을 수 없습니다."
					));
		};

		Member member = profile.getMember();
		if (member.getStatus() != MemberStatus.ACTIVE) {
			throw new BusinessException(ErrorCode.MEMBER_INACTIVE);
		}

		return member;
	}

	public void validateSessionMatchesMember(SignupSession session, Member member) {
		MemberProfile profile = member.getProfile();
		if (profile == null) {
			throw new BusinessException(ErrorCode.MEMBER_NOT_FOUND);
		}

		boolean matched = switch (session.getAuthMethod()) {
			case EMAIL -> session.getVerifiedValue().equals(profile.getEmail());
			case PASS -> normalizePhone(session.getVerifiedValue()).equals(profile.getPhone());
		};

		if (!matched) {
			throw new BusinessException(
					ErrorCode.INVALID_INPUT,
					"인증한 이메일 또는 휴대폰번호가 로그인 회원 정보와 일치하지 않습니다."
			);
		}
	}

	private String normalizePhone(String phone) {
		return phone.replaceAll("[^0-9]", "");
	}
}
