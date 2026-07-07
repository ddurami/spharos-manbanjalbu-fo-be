package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.FindLoginIdRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.FindLoginIdResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import com.spharos.manbanjalbu_be.domain.member.repository.SignupSessionRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberFindIdService {

	private final SignupSessionRepository signupSessionRepository;
	private final MemberVerifiedSessionService memberVerifiedSessionService;

	public MemberFindIdService(
			SignupSessionRepository signupSessionRepository,
			MemberVerifiedSessionService memberVerifiedSessionService
	) {
		this.signupSessionRepository = signupSessionRepository;
		this.memberVerifiedSessionService = memberVerifiedSessionService;
	}

	public FindLoginIdResponse findLoginId(FindLoginIdRequest request) {
		SignupSession session = memberVerifiedSessionService.getIdentityVerifiedSession(request.verificationToken());
		Member member = memberVerifiedSessionService.findActiveMember(session);
		signupSessionRepository.delete(session);

		return new FindLoginIdResponse(
				member.getLoginId(),
				session.getAuthMethod(),
				session.getVerifiedValue()
		);
	}
}
