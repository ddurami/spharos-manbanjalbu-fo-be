package com.spharos.manbanjalbu_be.domain.member.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;

public record FindLoginIdResponse(
		String loginId,
		AuthMethod authMethod,
		String verifiedValue
) {
}
