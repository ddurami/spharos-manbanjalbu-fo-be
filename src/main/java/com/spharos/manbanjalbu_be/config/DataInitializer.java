package com.spharos.manbanjalbu_be.config;

import com.spharos.manbanjalbu_be.domain.member.entity.Terms;
import com.spharos.manbanjalbu_be.domain.member.repository.TermsRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataInitializer {

	@Bean
	CommandLineRunner initTerms(TermsRepository termsRepository) {
		return args -> {
			if (termsRepository.count() > 0) {
				return;
			}

			termsRepository.save(Terms.create(
					"스타벅스 온라인 스토어 이용약관",
					"스타벅스 온라인 스토어 서비스 이용에 관한 필수 약관입니다.",
					true
			));
			termsRepository.save(Terms.create(
					"개인정보 수집 및 이용 동의",
					"회원 가입 및 서비스 제공을 위한 개인정보 수집·이용에 대한 필수 동의입니다.",
					true
			));
			termsRepository.save(Terms.create(
					"광고성 정보 수신 동의",
					"이벤트, 혜택 등 광고성 정보 수신에 대한 선택 동의입니다.",
					false
			));
		};
	}
}
