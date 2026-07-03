package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record TermAgreementResultResponse(
		Long termsId,
		String title,
		boolean agreed,
		boolean mandatory
) {
}
