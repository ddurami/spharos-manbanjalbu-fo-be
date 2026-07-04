package com.spharos.manbanjalbu_be.domain.product.controller;

import com.spharos.manbanjalbu_be.domain.product.dto.response.SeasonResponse;
import com.spharos.manbanjalbu_be.domain.product.service.SeasonService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/seasons")
@Tag(name = "시즌", description = "시즌 관련 API")
public class SeasonController {

	private final SeasonService seasonService;

	public SeasonController(SeasonService seasonService) {
		this.seasonService = seasonService;
	}

	@GetMapping
	@Operation(summary = "시즌 목록 조회", description = "최신순으로 전체 시즌 목록을 반환합니다.")
	public ResponseEntity<ApiResponse<List<SeasonResponse>>> getSeasons() {
		List<SeasonResponse> seasons = seasonService.getAllSeasons();
		return ResponseEntity.ok(ApiResponse.ok(seasons));
	}
}
