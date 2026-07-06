package com.spharos.manbanjalbu_be.domain.member.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDate;

@Schema(description = "개인정보 관리 화면 조회 응답")
public record MemberPersonalInfoResponse(
		@Schema(description = "아이디", example = "ddurami")
		String loginId,

		@Schema(description = "이름", example = "박우람")
		String name,

		@Schema(description = "생년월일", example = "1993-02-03")
		LocalDate birthDate,

		@Schema(description = "휴대폰 번호", example = "01041034333")
		String phone,

		@Schema(description = "이메일", example = "ddurami9323@gmail.com")
		String email,

		@Schema(description = "마케팅·광고성 정보 수신 동의")
		MarketingConsentResponse marketingConsent
) {
}
