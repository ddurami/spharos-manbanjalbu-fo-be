package com.spharos.manbanjalbu_be.domain.member;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class MemberJoinLoginIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void emailSignupAndLoginFlow() throws Exception {
		String email = "member@test.com";
		String loginId = "starbucks01";
		String password = "Abcdef1!";

		MvcResult sendResult = mockMvc.perform(post("/api/member/auth/email/send")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"email":"%s"}
								""".formatted(email)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andReturn();

		String code = com.jayway.jsonpath.JsonPath.read(
				sendResult.getResponse().getContentAsString(),
				"$.data.devCode"
		);

		MvcResult verifyResult = mockMvc.perform(post("/api/member/auth/email/verify")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"email":"%s","code":"%s"}
								""".formatted(email, code)))
				.andExpect(status().isOk())
				.andReturn();

		String verificationToken = com.jayway.jsonpath.JsonPath.read(
				verifyResult.getResponse().getContentAsString(),
				"$.data.verificationToken"
		);

		mockMvc.perform(get("/api/member/terms"))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(4));

		mockMvc.perform(post("/api/member/join/terms")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "agreements":[
								    {"termsId":1,"agreed":true},
								    {"termsId":2,"agreed":true},
								    {"termsId":3,"agreed":true},
								    {"termsId":4,"agreed":false}
								  ]
								}
								""".formatted(verificationToken)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.marketingConsent.agreed").value(false));

		mockMvc.perform(get("/api/member/join/session")
						.param("verificationToken", verificationToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.step").value("TERMS_AGREED"));

		mockMvc.perform(get("/api/member/join/login-id/check")
						.param("loginId", loginId))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.available").value(true));

		mockMvc.perform(post("/api/member/join")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "loginId":"%s",
								  "password":"%s",
								  "name":"홍길동",
								  "birthDate":"1990-01-01",
								  "phone":"01012345678",
								  "email":"%s",
								  "nickname":"스타벅스러버"
								}
								""".formatted(verificationToken, loginId, password, email)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.agreementResults.length()").value(4))
				.andExpect(jsonPath("$.data.marketingConsent.agreed").value(false))
				.andExpect(jsonPath("$.data.marketingConsent.resultMessage").value("광고성 정보 수신에 동의하지 않으셨습니다."));

		mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"%s","password":"%s"}
								""".formatted(loginId, password)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.accessToken").isNotEmpty())
				.andExpect(jsonPath("$.data.loginId").value(loginId));
	}

	@Test
	void phoneOctomoSignupAndLoginFlow() throws Exception {
		String phone = "01098765432";
		String loginId = "starbucks02";
		String password = "Abcdef1!";
		String email = "phone-member@test.com";

		MvcResult sendResult = mockMvc.perform(post("/api/member/auth/phone/send")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"phone":"%s"}
								""".formatted(phone)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andReturn();

		String code = com.jayway.jsonpath.JsonPath.read(
				sendResult.getResponse().getContentAsString(),
				"$.data.devCode"
		);

		MvcResult verifyResult = mockMvc.perform(post("/api/member/auth/phone/verify")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"phone":"%s","code":"%s"}
								""".formatted(phone, code)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.authMethod").value("PASS"))
				.andExpect(jsonPath("$.data.verifiedValue").value(phone))
				.andReturn();

		String verificationToken = com.jayway.jsonpath.JsonPath.read(
				verifyResult.getResponse().getContentAsString(),
				"$.data.verificationToken"
		);

		mockMvc.perform(post("/api/member/join/terms")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "agreements":[
								    {"termsId":1,"agreed":true},
								    {"termsId":2,"agreed":true},
								    {"termsId":3,"agreed":true},
								    {"termsId":4,"agreed":true}
								  ]
								}
								""".formatted(verificationToken)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.marketingConsent.agreed").value(true));

		mockMvc.perform(post("/api/member/join")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "loginId":"%s",
								  "password":"%s",
								  "name":"김스타",
								  "birthDate":"1995-05-05",
								  "phone":"%s",
								  "email":"%s"
								}
								""".formatted(verificationToken, loginId, password, phone, email)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.marketingConsent.agreed").value(true));

		mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"%s","password":"%s"}
								""".formatted(loginId, password)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.accessToken").isNotEmpty());
	}
}
