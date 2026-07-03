package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotNull;

public record TermAgreementItemRequest(
		@NotNull(message = "약관 ID가 필요합니다.")
		Long termsId,

		@NotNull(message = "약관 동의 여부가 필요합니다.")
		Boolean agreed
) {
}
