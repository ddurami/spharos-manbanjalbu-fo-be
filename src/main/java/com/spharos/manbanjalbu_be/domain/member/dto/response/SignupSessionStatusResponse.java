package com.spharos.manbanjalbu_be.domain.member.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.SignupStep;

import java.time.LocalDateTime;

public record SignupSessionStatusResponse(
		String verificationToken,
		SignupStep step,
		AuthMethod authMethod,
		String verifiedValue,
		LocalDateTime expiresAt
) {
}
