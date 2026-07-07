package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotNull;

public record MemberMarketingConsentUpdateRequest(
		@NotNull(message = "마케팅 활용 수집·이용 동의 여부를 입력해주세요.")
		Boolean marketingUtilizationAgreed,

		@NotNull(message = "E-mail 수신 동의 여부를 입력해주세요.")
		Boolean emailAgreed,

		@NotNull(message = "SMS 수신 동의 여부를 입력해주세요.")
		Boolean smsAgreed
) {
}
