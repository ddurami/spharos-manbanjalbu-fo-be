package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record VerificationSendResponse(
		String message,
		String devCode,
		String authCode,
		String receivePhoneNumber
) {
}
