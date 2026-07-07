package com.spharos.manbanjalbu_be.domain.product.service;

import com.spharos.manbanjalbu_be.domain.product.dto.response.RecommendedKeywordResponse;
import com.spharos.manbanjalbu_be.domain.product.repository.RecommendedKeywordRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class RecommendedKeywordService {

	private final RecommendedKeywordRepository recommendedKeywordRepository;

	public RecommendedKeywordService(RecommendedKeywordRepository recommendedKeywordRepository) {
		this.recommendedKeywordRepository = recommendedKeywordRepository;
	}

	public List<RecommendedKeywordResponse> getRecommendedKeywords() {
		return RecommendedKeywordResponse.fromList(
				recommendedKeywordRepository.findByIsActiveTrueOrderByDisplayOrderAsc()
		);
	}
}
