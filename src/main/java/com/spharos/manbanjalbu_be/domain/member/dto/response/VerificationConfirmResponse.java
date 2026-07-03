package com.spharos.manbanjalbu_be.domain.member.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;

public record VerificationConfirmResponse(
		String verificationToken,
		AuthMethod authMethod,
		String verifiedValue
) {
}
