package com.spharos.manbanjalbu_be.domain.product.controller;

import com.spharos.manbanjalbu_be.domain.product.dto.request.SearchHistorySaveRequest;
import com.spharos.manbanjalbu_be.domain.product.dto.response.RecommendedKeywordResponse;
import com.spharos.manbanjalbu_be.domain.product.dto.response.SearchHistoryResponse;
import com.spharos.manbanjalbu_be.domain.product.service.RecommendedKeywordService;
import com.spharos.manbanjalbu_be.domain.product.service.SearchHistoryService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/search")
@Tag(name = "상품 검색", description = "추천 검색어 / 최근 검색어 API")
public class SearchController {

	private final RecommendedKeywordService recommendedKeywordService;
	private final SearchHistoryService searchHistoryService;

	public SearchController(
			RecommendedKeywordService recommendedKeywordService,
			SearchHistoryService searchHistoryService
	) {
		this.recommendedKeywordService = recommendedKeywordService;
		this.searchHistoryService = searchHistoryService;
	}

	@GetMapping("/recommended-keywords")
	@Operation(summary = "추천 검색어 조회", description = "검색 화면에 노출할 추천 검색어 태그 목록")
	public ResponseEntity<ApiResponse<List<RecommendedKeywordResponse>>> getRecommendedKeywords() {
		return ResponseEntity.ok(ApiResponse.ok(recommendedKeywordService.getRecommendedKeywords()));
	}

	@GetMapping("/history")
	@Operation(summary = "최근 검색어 조회", description = "로그인 회원의 최근 검색어 최대 10개")
	public ResponseEntity<ApiResponse<List<SearchHistoryResponse>>> getSearchHistories(
			@AuthenticationPrincipal Long memberId
	) {
		return ResponseEntity.ok(ApiResponse.ok(searchHistoryService.getSearchHistories(memberId)));
	}

	@PostMapping("/history")
	@Operation(summary = "최근 검색어 저장", description = "검색 실행 시 호출. 동일 검색어는 최상단으로 갱신")
	public ResponseEntity<ApiResponse<SearchHistoryResponse>> saveSearchHistory(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody SearchHistorySaveRequest request
	) {
		SearchHistoryResponse response = searchHistoryService.saveSearchHistory(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(response));
	}

	@DeleteMapping("/history/{historyId}")
	@Operation(summary = "최근 검색어 개별 삭제")
	public ResponseEntity<ApiResponse<Void>> deleteSearchHistory(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long historyId
	) {
		searchHistoryService.deleteSearchHistory(memberId, historyId);
		return ResponseEntity.ok(ApiResponse.ok(null, "검색어가 삭제되었습니다."));
	}

	@DeleteMapping("/history")
	@Operation(summary = "최근 검색어 전체 삭제")
	public ResponseEntity<ApiResponse<Void>> deleteAllSearchHistories(
			@AuthenticationPrincipal Long memberId
	) {
		searchHistoryService.deleteAllSearchHistories(memberId);
		return ResponseEntity.ok(ApiResponse.ok(null, "최근 검색어가 모두 삭제되었습니다."));
	}
}
