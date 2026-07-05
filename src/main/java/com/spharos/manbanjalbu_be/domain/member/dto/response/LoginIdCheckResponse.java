package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record LoginIdCheckResponse(
		boolean available,
		String message
) {
}
