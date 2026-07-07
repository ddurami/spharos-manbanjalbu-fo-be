package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotBlank;

public record FindLoginIdRequest(
		@NotBlank(message = "인증 토큰이 필요합니다.")
		String verificationToken
) {
}
