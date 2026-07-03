package com.spharos.manbanjalbu_be.domain.member.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.MemberGrade;

public record MemberLoginResponse(
		String accessToken,
		Long memberId,
		String loginId,
		String name,
		MemberGrade grade
) {
}
