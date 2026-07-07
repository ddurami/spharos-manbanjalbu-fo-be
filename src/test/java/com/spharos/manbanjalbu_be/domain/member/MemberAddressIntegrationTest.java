package com.spharos.manbanjalbu_be.domain.member;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class MemberAddressIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void memberAddressCrudFlow() throws Exception {
		String accessToken = registerAndLogin("addressuser01", "address@test.com");

		mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"집",
								  "recipientName":"홍길동",
								  "zipcode":"06236",
								  "baseAddress":"서울 강남구 테헤란로 152",
								  "detailAddress":"101동 1001호",
								  "phone1":"01077778888",
								  "deliveryMemo":"문 앞"
								}
								"""))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.addressName").value("집"))
				.andExpect(jsonPath("$.data.isDefault").value(true));

		MvcResult createSecondResult = mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"회사",
								  "recipientName":"홍길동",
								  "zipcode":"04524",
								  "baseAddress":"서울 중구 세종대로 110",
								  "detailAddress":"20층",
								  "phone1":"01077778888"
								}
								"""))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.isDefault").value(false))
				.andReturn();

		Number secondAddressId = com.jayway.jsonpath.JsonPath.read(
				createSecondResult.getResponse().getContentAsString(),
				"$.data.id"
		);

		mockMvc.perform(get("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(2));

		mockMvc.perform(patch("/api/member/addresses/" + secondAddressId.longValue() + "/default")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.isDefault").value(true));

		mockMvc.perform(put("/api/member/addresses/" + secondAddressId.longValue())
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"본사",
								  "recipientName":"홍길동",
								  "zipcode":"04524",
								  "baseAddress":"서울 중구 세종대로 110",
								  "detailAddress":"21층",
								  "phone1":"01077778888",
								  "isDefault": true
								}
								"""))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.addressName").value("본사"))
				.andExpect(jsonPath("$.data.detailAddress").value("21층"));

		mockMvc.perform(delete("/api/member/addresses/" + secondAddressId.longValue())
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk());

		mockMvc.perform(get("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(1))
				.andExpect(jsonPath("$.data[0].addressName").value("집"));
	}

	private String registerAndLogin(String loginId, String email) throws Exception {
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
								  "phone":"01077778888",
								  "email":"%s"
								}
								""".formatted(verificationToken, loginId, email)))
				.andExpect(status().isOk());

		MvcResult loginResult = mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"%s","password":"Abcdef1!"}
								""".formatted(loginId)))
				.andExpect(status().isOk())
				.andReturn();

		return com.jayway.jsonpath.JsonPath.read(
				loginResult.getResponse().getContentAsString(),
				"$.data.accessToken"
		);
	}
}
