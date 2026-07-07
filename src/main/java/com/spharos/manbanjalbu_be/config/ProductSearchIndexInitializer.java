package com.spharos.manbanjalbu_be.config;

import jakarta.persistence.EntityManager;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@Profile("!test")
public class ProductSearchIndexInitializer {

	@Bean
	CommandLineRunner initProductSearchIndex(EntityManager entityManager) {
		return args -> {
			try {
				entityManager.createNativeQuery(
						"ALTER TABLE product ADD FULLTEXT INDEX ft_product_search (name, short_description) WITH PARSER ngram"
				).executeUpdate();
			} catch (Exception ignored) {
				// index already exists or database does not support ngram parser
			}
		};
	}
}
