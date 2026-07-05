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
class MemberJoinValidationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void rejectJoinWhenMandatoryTermsNotAgreed() throws Exception {
		String verificationToken = createVerifiedSession();

		mockMvc.perform(post("/api/member/join/terms")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "agreements":[
								    {"termsId":1,"agreed":true},
								    {"termsId":2,"agreed":false},
								    {"termsId":3,"agreed":false}
								  ]
								}
								""".formatted(verificationToken)))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void rejectJoinWithInvalidPassword() throws Exception {
		String email = "invalid-password@test.com";
		String verificationToken = createVerifiedSession(email);

		agreeAllMandatoryTerms(verificationToken);

		mockMvc.perform(post("/api/member/join")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "loginId":"invalidpw01",
								  "password":"short1",
								  "name":"홍길동",
								  "birthDate":"1990-01-01",
								  "phone":"01011112222",
								  "email":"%s"
								}
								""".formatted(verificationToken, email)))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void rejectLoginWithWrongPassword() throws Exception {
		mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"not-exists","password":"WrongPass1!"}
								"""))
				.andExpect(status().isUnauthorized())
				.andExpect(jsonPath("$.success").value(false));
	}

	private String createVerifiedSession() throws Exception {
		return createVerifiedSession("validation@test.com");
	}

	private String createVerifiedSession(String email) throws Exception {
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

	private void agreeAllMandatoryTerms(String verificationToken) throws Exception {
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
	}
}
