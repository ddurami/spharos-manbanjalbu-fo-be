package com.spharos.manbanjalbu_be.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	private final JwtAuthenticationFilter jwtAuthenticationFilter;
	private final String allowedOriginPatterns;

	public SecurityConfig(
			JwtAuthenticationFilter jwtAuthenticationFilter,
			@Value("${app.cors.allowed-origin-patterns}") String allowedOriginPatterns
	) {
		this.jwtAuthenticationFilter = jwtAuthenticationFilter;
		this.allowedOriginPatterns = allowedOriginPatterns;
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
				.csrf(csrf -> csrf.disable())
				.cors(cors -> cors.configurationSource(corsConfigurationSource()))
				.sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
				.authorizeHttpRequests(auth -> auth
						.requestMatchers("/api/health").permitAll()
						.requestMatchers("/error").permitAll()
						.requestMatchers("/api/member/auth/**").permitAll()
						.requestMatchers("/api/member/terms").permitAll()
						.requestMatchers("/api/member/join/**").permitAll()
						.requestMatchers("/api/member/join").permitAll()
						.requestMatchers("/api/member/login").permitAll()
						.requestMatchers("/api/member/find-id").permitAll()
						.requestMatchers("/api/member/find-password/**").permitAll()
						.requestMatchers("/api/search/recommended-keywords").permitAll()
						.requestMatchers("/api/products/**", "/api/products", "/api/categories/**", "/api/categories", "/api/seasons/**", "/api/seasons").permitAll()
						.requestMatchers(
								"/swagger-ui.html",
								"/swagger-ui/**",
								"/v3/api-docs/**"
						).permitAll()
						.anyRequest().authenticated()
				)
				.addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

		return http.build();
	}

	@Bean
	public CorsConfigurationSource corsConfigurationSource() {
		CorsConfiguration configuration = new CorsConfiguration();
		configuration.setAllowedOriginPatterns(
				List.of(allowedOriginPatterns.split(","))
						.stream()
						.map(String::trim)
						.filter(origin -> !origin.isEmpty())
						.toList()
		);
		configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));
		configuration.setAllowedHeaders(List.of("*"));
		configuration.setAllowCredentials(true);

		UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		source.registerCorsConfiguration("/**", configuration);
		return source;
	}
}
