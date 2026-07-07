package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;

import java.util.List;

public record TermsAgreementRequest(
		@NotBlank(message = "회원가입 세션 토큰이 필요합니다.")
		String verificationToken,

		@NotEmpty(message = "약관 동의 정보가 필요합니다.")
		List<TermAgreementItemRequest> agreements
) {
}
