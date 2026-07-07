package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.config.JwtTokenProvider;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberLoginRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberLoginResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.enums.MemberStatus;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberLoginService {

	private final MemberRepository memberRepository;
	private final PasswordEncoder passwordEncoder;
	private final JwtTokenProvider jwtTokenProvider;

	public MemberLoginService(
			MemberRepository memberRepository,
			PasswordEncoder passwordEncoder,
			JwtTokenProvider jwtTokenProvider
	) {
		this.memberRepository = memberRepository;
		this.passwordEncoder = passwordEncoder;
		this.jwtTokenProvider = jwtTokenProvider;
	}

	public MemberLoginResponse login(MemberLoginRequest request) {
		Member member = memberRepository.findByLoginId(request.loginId())
				.orElseThrow(() -> new BusinessException(ErrorCode.INVALID_CREDENTIALS));

		if (member.getStatus() == MemberStatus.WITHDRAWN) {
			throw new BusinessException(ErrorCode.MEMBER_ALREADY_WITHDRAWN);
		}
		if (member.getStatus() != MemberStatus.ACTIVE) {
			throw new BusinessException(ErrorCode.MEMBER_INACTIVE);
		}
		if (!passwordEncoder.matches(request.password(), member.getPassword())) {
			throw new BusinessException(ErrorCode.INVALID_CREDENTIALS);
		}

		member.recordLogin();

		String accessToken = jwtTokenProvider.createToken(member.getId(), member.getLoginId());
		String name = member.getProfile() != null ? member.getProfile().getName() : member.getLoginId();

		return new MemberLoginResponse(
				accessToken,
				member.getId(),
				member.getLoginId(),
				name,
				member.getGrade()
		);
	}
}
