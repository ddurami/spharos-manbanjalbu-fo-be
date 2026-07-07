package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record TermsAgreementResponse(
		String verificationToken,
		String message,
		MarketingConsentResultResponse marketingConsent
) {
}
