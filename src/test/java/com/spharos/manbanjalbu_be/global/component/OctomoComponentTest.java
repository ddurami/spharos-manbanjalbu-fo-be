package com.spharos.manbanjalbu_be.global.component;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestClient;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.header;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

class OctomoComponentTest {

	@Test
	void existsMessage_parsesExistsField() {
		RestClient.Builder builder = RestClient.builder().baseUrl("https://api.octoverse.kr");
		MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
		RestClient restClient = builder.build();

		server.expect(requestTo("https://api.octoverse.kr/octomo/v1/public/message/exists"))
				.andExpect(method(HttpMethod.POST))
				.andExpect(header("Authorization", "Octomo test-api-key"))
				.andExpect(content().json("""
						{"mobileNum":"01093939116","text":"699121"}
						"""))
				.andRespond(withSuccess("""
						{"exists":true}
						""", MediaType.APPLICATION_JSON));

		OctomoComponent component = new OctomoComponent(restClient, "test-api-key", "16663538", false);

		assertThat(component.existsMessage("01093939116", "699121")).isTrue();
		server.verify();
	}

	@Test
	void existsMessage_usesVerifiedFieldWhenExistsIsAbsent() {
		RestClient.Builder builder = RestClient.builder().baseUrl("https://api.octoverse.kr");
		MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
		RestClient restClient = builder.build();

		server.expect(requestTo("https://api.octoverse.kr/octomo/v1/public/message/exists"))
				.andExpect(method(HttpMethod.POST))
				.andExpect(content().json("""
						{"mobileNum":"01093939116","text":"699121"}
						"""))
				.andRespond(withSuccess("""
						{"verified":true}
						""", MediaType.APPLICATION_JSON));

		OctomoComponent component = new OctomoComponent(restClient, "test-api-key", "16663538", false);

		assertThat(component.existsMessage("01093939116", "699121")).isTrue();
		server.verify();
	}
}
