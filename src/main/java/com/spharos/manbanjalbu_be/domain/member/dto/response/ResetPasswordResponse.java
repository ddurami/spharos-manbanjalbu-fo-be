package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record ResetPasswordResponse(
		String loginId,
		String message
) {
}
