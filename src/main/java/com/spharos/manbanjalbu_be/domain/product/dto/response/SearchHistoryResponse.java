package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.RecommendedKeyword;
import com.spharos.manbanjalbu_be.domain.product.entity.SearchHistory;

import java.time.LocalDateTime;
import java.util.List;

public record SearchHistoryResponse(
		Long id,
		String keyword,
		LocalDateTime searchedAt
) {
	public static SearchHistoryResponse from(SearchHistory history) {
		return new SearchHistoryResponse(
				history.getId(),
				history.getKeyword(),
				history.getCreatedAt()
		);
	}

	public static List<SearchHistoryResponse> fromList(List<SearchHistory> histories) {
		return histories.stream()
				.map(SearchHistoryResponse::from)
				.toList();
	}
}
