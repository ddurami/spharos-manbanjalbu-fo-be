package com.spharos.manbanjalbu_be.domain.member.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDateTime;

@Schema(description = "회원 본인인증 수단 요약 (CI 등 민감정보 제외)")
public record MemberAuthInfoResponse(
		@Schema(description = "인증 수단", example = "EMAIL")
		AuthMethod authMethod,

		@Schema(description = "인증된 값 (이메일 또는 휴대폰 번호)", example = "user@example.com")
		String verifiedValue,

		@Schema(description = "인증 완료 일시", example = "2026-07-06T13:51:45")
		LocalDateTime authenticatedAt
) {
}
