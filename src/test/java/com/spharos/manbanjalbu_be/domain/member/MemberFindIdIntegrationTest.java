package com.spharos.manbanjalbu_be.domain.member;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class MemberFindIdIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void findLoginIdByEmailVerification() throws Exception {
		String email = "find-id-email@test.com";
		String loginId = "findiduser01";
		registerMember(email, "01011112233", loginId);

		String verificationToken = verifyEmail(email);

		mockMvc.perform(post("/api/member/find-id")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s"}
								""".formatted(verificationToken)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.authMethod").value("EMAIL"))
				.andExpect(jsonPath("$.data.verifiedValue").value(email));
	}

	@Test
	void findLoginIdByPhoneVerification() throws Exception {
		String email = "find-id-phone@test.com";
		String phone = "01022223344";
		String loginId = "findiduser02";
		registerMember(email, phone, loginId);

		String verificationToken = verifyPhone(phone);

		mockMvc.perform(post("/api/member/find-id")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s"}
								""".formatted(verificationToken)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.authMethod").value("PASS"))
				.andExpect(jsonPath("$.data.verifiedValue").value(phone));
	}

	@Test
	void rejectFindLoginIdWhenMemberNotFound() throws Exception {
		String verificationToken = verifyEmail("not-registered@test.com");

		mockMvc.perform(post("/api/member/find-id")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s"}
								""".formatted(verificationToken)))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false));
	}

	private void registerMember(String email, String phone, String loginId) throws Exception {
		String verificationToken = verifyEmail(email);

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
				.andExpect(status().isOk());

		mockMvc.perform(post("/api/member/join")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "loginId":"%s",
								  "password":"Abcdef1!",
								  "name":"홍길동",
								  "birthDate":"1990-01-01",
								  "phone":"%s",
								  "email":"%s"
								}
								""".formatted(verificationToken, loginId, phone, email)))
				.andExpect(status().isOk());
	}

	private String verifyEmail(String email) throws Exception {
		MvcResult sendResult = mockMvc.perform(post("/api/member/auth/email/send")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"email":"%s"}
								""".formatted(email)))
				.andExpect(status().isOk())
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

		return com.jayway.jsonpath.JsonPath.read(
				verifyResult.getResponse().getContentAsString(),
				"$.data.verificationToken"
		);
	}

	private String verifyPhone(String phone) throws Exception {
		MvcResult sendResult = mockMvc.perform(post("/api/member/auth/phone/send")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"phone":"%s"}
								""".formatted(phone)))
				.andExpect(status().isOk())
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
				.andReturn();

		return com.jayway.jsonpath.JsonPath.read(
				verifyResult.getResponse().getContentAsString(),
				"$.data.verificationToken"
		);
	}
}
