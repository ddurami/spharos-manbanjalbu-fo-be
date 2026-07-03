package com.spharos.manbanjalbu_be.config;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SwaggerConfig {

	@Bean
	public OpenAPI openAPI() {
		final String bearerScheme = "BearerAuth";

		return new OpenAPI()
				.info(new Info()
						.title("스타벅스 온라인 스토어 API")
						.description("""
								회원가입 전체 순서
								1~2. 이메일 또는 휴대폰 인증 (send → verify → verificationToken)
								3. GET /api/member/terms
								4. POST /api/member/join/terms (필수 약관 동의)
								5. POST /api/member/join (회원 정보 입력, marketingConsent 확인)
								6. POST /api/member/login

								보조: GET /api/member/join/session?verificationToken=...
								""")
						.version("v1.0.0"))
				.addSecurityItem(new SecurityRequirement().addList(bearerScheme))
				.components(new Components()
						.addSecuritySchemes(bearerScheme, new SecurityScheme()
								.name(bearerScheme)
								.type(SecurityScheme.Type.HTTP)
								.scheme("bearer")
								.bearerFormat("JWT")
								.description("로그인 API 응답의 accessToken 값을 입력하세요.")));
	}
}
