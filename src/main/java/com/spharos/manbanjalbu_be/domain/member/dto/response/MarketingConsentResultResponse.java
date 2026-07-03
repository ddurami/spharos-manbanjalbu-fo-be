package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record MarketingConsentResultResponse(
		Long termsId,
		String title,
		boolean agreed,
		String resultMessage
) {
	public static MarketingConsentResultResponse of(Long termsId, String title, boolean agreed) {
		String message = agreed
				? "광고성 정보 수신에 동의하셨습니다."
				: "광고성 정보 수신에 동의하지 않으셨습니다.";
		return new MarketingConsentResultResponse(termsId, title, agreed, message);
	}
}
