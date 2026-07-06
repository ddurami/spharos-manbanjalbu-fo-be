package com.spharos.manbanjalbu_be.domain.member.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "마케팅 활용 수집·이용 동의 및 광고성 정보 수신 채널")
public record MarketingConsentResponse(
		@Schema(description = "약관 ID", example = "4")
		Long termsId,

		@Schema(description = "약관명", example = "광고성 정보 수신 동의")
		String termsTitle,

		@Schema(description = "[선택] 마케팅 활용 수집·이용 동의 여부", example = "true")
		boolean marketingUtilizationAgreed,

		@Schema(description = "광고성 정보 E-mail 수신 동의", example = "true")
		boolean emailAgreed,

		@Schema(description = "광고성 정보 SMS 수신 동의", example = "false")
		boolean smsAgreed
) {
}
