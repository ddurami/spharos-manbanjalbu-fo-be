package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.FindLoginIdRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.ResetPasswordRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.FindLoginIdResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.ResetPasswordResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import com.spharos.manbanjalbu_be.domain.member.repository.SignupSessionRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberFindPasswordService {

	private final SignupSessionRepository signupSessionRepository;
	private final MemberVerifiedSessionService memberVerifiedSessionService;
	private final PasswordEncoder passwordEncoder;

	public MemberFindPasswordService(
			SignupSessionRepository signupSessionRepository,
			MemberVerifiedSessionService memberVerifiedSessionService,
			PasswordEncoder passwordEncoder
	) {
		this.signupSessionRepository = signupSessionRepository;
		this.memberVerifiedSessionService = memberVerifiedSessionService;
		this.passwordEncoder = passwordEncoder;
	}

	public FindLoginIdResponse verifyAccount(FindLoginIdRequest request) {
		SignupSession session = memberVerifiedSessionService.getIdentityVerifiedSession(request.verificationToken());
		Member member = memberVerifiedSessionService.findActiveMember(session);
		session.markPasswordResetVerified();

		return new FindLoginIdResponse(
				member.getLoginId(),
				session.getAuthMethod(),
				session.getVerifiedValue()
		);
	}

	public ResetPasswordResponse resetPassword(ResetPasswordRequest request) {
		SignupSession session = memberVerifiedSessionService.getPasswordResetVerifiedSession(request.verificationToken());
		Member member = memberVerifiedSessionService.findActiveMember(session);
		member.changePassword(passwordEncoder.encode(request.password()));
		signupSessionRepository.delete(session);

		return new ResetPasswordResponse(
				member.getLoginId(),
				"비밀번호가 변경되었습니다."
		);
	}
}
