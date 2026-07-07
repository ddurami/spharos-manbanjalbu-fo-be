package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.RecommendedKeyword;

import java.util.List;

public record RecommendedKeywordResponse(
		Long id,
		String label,
		String keyword
) {
	public static RecommendedKeywordResponse from(RecommendedKeyword recommendedKeyword) {
		return new RecommendedKeywordResponse(
				recommendedKeyword.getId(),
				recommendedKeyword.getLabel(),
				recommendedKeyword.getKeyword()
		);
	}

	public static List<RecommendedKeywordResponse> fromList(List<RecommendedKeyword> keywords) {
		return keywords.stream()
				.map(RecommendedKeywordResponse::from)
				.toList();
	}
}
