package com.spharos.manbanjalbu_be.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {

	@Bean
	public RestClient octomoRestClient(
			@Value("${octomo.api-base-url:https://api.octoverse.kr}") String baseUrl
	) {
		return RestClient.builder()
				.baseUrl(baseUrl)
				.build();
	}
}
