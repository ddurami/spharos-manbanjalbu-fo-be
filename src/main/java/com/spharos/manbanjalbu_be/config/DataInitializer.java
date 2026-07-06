package com.spharos.manbanjalbu_be.config;

import com.spharos.manbanjalbu_be.domain.member.entity.Terms;
import com.spharos.manbanjalbu_be.domain.member.repository.TermsRepository;
import com.spharos.manbanjalbu_be.domain.product.entity.RecommendedKeyword;
import com.spharos.manbanjalbu_be.domain.product.repository.RecommendedKeywordRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataInitializer {

	@Bean
	CommandLineRunner initTerms(TermsRepository termsRepository) {
		return args -> {
			saveIfAbsent(
					termsRepository,
					"스타벅스 온라인 스토어 이용약관",
					"스타벅스 온라인 스토어 서비스 이용에 관한 필수 약관입니다.",
					true
			);
			saveIfAbsent(
					termsRepository,
					"개인정보 수집 및 이용 동의",
					"회원 가입 및 서비스 제공을 위한 개인정보 수집·이용에 대한 필수 동의입니다.",
					true
			);
			saveIfAbsent(
					termsRepository,
					"스타벅스 카드 이용약관",
					"스타벅스 카드 발급 및 이용에 관한 필수 약관입니다.",
					true
			);
			saveIfAbsent(
					termsRepository,
					"광고성 정보 수신 동의",
					"이벤트, 혜택 등 광고성 정보 수신에 대한 선택 동의입니다.",
					false
			);
		};
	}

	@Bean
	CommandLineRunner initRecommendedKeywords(RecommendedKeywordRepository recommendedKeywordRepository) {
		return args -> {
			saveKeywordIfAbsent(recommendedKeywordRepository, "스탠리", "스테인리스", 1);
			saveKeywordIfAbsent(recommendedKeywordRepository, "양우산", "우산", 2);
			saveKeywordIfAbsent(recommendedKeywordRepository, "키체인", "키링", 3);
			saveKeywordIfAbsent(recommendedKeywordRepository, "베어리스타", "사이렌", 4);
			saveKeywordIfAbsent(recommendedKeywordRepository, "BEST 선물", "선물", 5);
			saveKeywordIfAbsent(recommendedKeywordRepository, "디저트 세트", "세트", 6);
		};
	}

	private void saveIfAbsent(TermsRepository termsRepository, String title, String content, boolean mandatory) {
		if (!termsRepository.existsByTitle(title)) {
			termsRepository.save(Terms.create(title, content, mandatory));
		}
	}

	private void saveKeywordIfAbsent(
			RecommendedKeywordRepository recommendedKeywordRepository,
			String label,
			String keyword,
			int displayOrder
	) {
		if (!recommendedKeywordRepository.existsByLabel(label)) {
			recommendedKeywordRepository.save(RecommendedKeyword.create(label, keyword, displayOrder));
		}
	}
}
