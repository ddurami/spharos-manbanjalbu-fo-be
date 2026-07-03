package com.spharos.manbanjalbu_be.domain.member.dto.response;

import java.util.List;

public record MemberJoinCompleteResponse(
		Long memberId,
		String loginId,
		String name,
		MarketingConsentResultResponse marketingConsent,
		List<TermAgreementResultResponse> agreementResults
) {
}
