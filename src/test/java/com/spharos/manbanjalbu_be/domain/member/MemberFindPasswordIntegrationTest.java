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
class MemberFindPasswordIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void resetPasswordByEmailVerification() throws Exception {
		String email = "find-pw-email@test.com";
		String phone = "01033334455";
		String loginId = "findpwuser01";
		String oldPassword = "Abcdef1!";
		String newPassword = "Newpass1!";
		registerMember(email, phone, loginId, oldPassword);

		String verificationToken = verifyEmail(email);

		mockMvc.perform(post("/api/member/find-password/verify")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s"}
								""".formatted(verificationToken)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.authMethod").value("EMAIL"))
				.andExpect(jsonPath("$.data.verifiedValue").value(email));

		mockMvc.perform(post("/api/member/find-password/reset")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s","password":"%s"}
								""".formatted(verificationToken, newPassword)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.message").value("비밀번호가 변경되었습니다."));

		mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"%s","password":"%s"}
								""".formatted(loginId, oldPassword)))
				.andExpect(status().isUnauthorized());

		mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"%s","password":"%s"}
								""".formatted(loginId, newPassword)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.accessToken").exists());
	}

	@Test
	void resetPasswordByPhoneVerification() throws Exception {
		String email = "find-pw-phone@test.com";
		String phone = "01044445566";
		String loginId = "findpwuser02";
		String newPassword = "Newpass2!";
		registerMember(email, phone, loginId, "Abcdef1!");

		String verificationToken = verifyPhone(phone);

		mockMvc.perform(post("/api/member/find-password/verify")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s"}
								""".formatted(verificationToken)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.loginId").value(loginId))
				.andExpect(jsonPath("$.data.authMethod").value("PASS"))
				.andExpect(jsonPath("$.data.verifiedValue").value(phone));

		mockMvc.perform(post("/api/member/find-password/reset")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s","password":"%s"}
								""".formatted(verificationToken, newPassword)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.loginId").value(loginId));
	}

	@Test
	void rejectVerifyWhenMemberNotFound() throws Exception {
		String verificationToken = verifyEmail("not-registered-pw@test.com");

		mockMvc.perform(post("/api/member/find-password/verify")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s"}
								""".formatted(verificationToken)))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void rejectResetWithoutAccountVerification() throws Exception {
		String verificationToken = verifyEmail("skip-verify-pw@test.com");

		mockMvc.perform(post("/api/member/find-password/reset")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"verificationToken":"%s","password":"Newpass1!"}
								""".formatted(verificationToken)))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false));
	}

	private void registerMember(String email, String phone, String loginId, String password) throws Exception {
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
								  "password":"%s",
								  "name":"홍길동",
								  "birthDate":"1990-01-01",
								  "phone":"%s",
								  "email":"%s"
								}
								""".formatted(verificationToken, loginId, password, phone, email)))
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
