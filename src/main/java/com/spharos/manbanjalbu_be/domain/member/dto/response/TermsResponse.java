package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record TermsResponse(
		Long id,
		String title,
		String content,
		boolean mandatory
) {
}
