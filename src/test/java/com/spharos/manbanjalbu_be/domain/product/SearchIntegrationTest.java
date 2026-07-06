package com.spharos.manbanjalbu_be.domain.product;

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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class SearchIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void getRecommendedKeywordsWithoutAuth() throws Exception {
		mockMvc.perform(get("/api/search/recommended-keywords"))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.length()").value(6))
				.andExpect(jsonPath("$.data[0].label").value("스탠리"))
				.andExpect(jsonPath("$.data[0].keyword").value("스테인리스"))
				.andExpect(jsonPath("$.data[2].label").value("키체인"))
				.andExpect(jsonPath("$.data[2].keyword").value("키링"));
	}

	@Test
	void rejectSearchHistoryWithoutAuth() throws Exception {
		mockMvc.perform(get("/api/search/history"))
				.andExpect(status().isForbidden());
	}

	@Test
	void searchHistoryCrudFlow() throws Exception {
		String accessToken = registerAndLogin("searchuser01", "search@test.com");

		mockMvc.perform(post("/api/search/history")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"keyword":"텀블러"}
								"""))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.keyword").value("텀블러"));

		mockMvc.perform(post("/api/search/history")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"keyword":"머그"}
								"""))
				.andExpect(status().isOk());

		mockMvc.perform(post("/api/search/history")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"keyword":"텀블러"}
								"""))
				.andExpect(status().isOk());

		MvcResult listResult = mockMvc.perform(get("/api/search/history")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(2))
				.andExpect(jsonPath("$.data[0].keyword").value("텀블러"))
				.andExpect(jsonPath("$.data[1].keyword").value("머그"))
				.andReturn();

		Number firstHistoryId = com.jayway.jsonpath.JsonPath.read(
				listResult.getResponse().getContentAsString(),
				"$.data[0].id"
		);

		mockMvc.perform(delete("/api/search/history/" + firstHistoryId.longValue())
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk());

		mockMvc.perform(get("/api/search/history")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(1))
				.andExpect(jsonPath("$.data[0].keyword").value("머그"));

		mockMvc.perform(delete("/api/search/history")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk());

		mockMvc.perform(get("/api/search/history")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(0));
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
