package com.spharos.manbanjalbu_be.domain.product.controller;

import com.spharos.manbanjalbu_be.domain.product.dto.response.BannerResponse;
import com.spharos.manbanjalbu_be.domain.product.enums.BannerPosition;
import com.spharos.manbanjalbu_be.domain.product.service.BannerService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/banners")
@Tag(name = "배너", description = "배너/캐러셀 관련 API")
public class BannerController {

	private final BannerService bannerService;

	public BannerController(BannerService bannerService) {
		this.bannerService = bannerService;
	}

	@GetMapping("/main-carousel")
	@Operation(summary = "메인 캐러셀 배너 조회", description = "메인 페이지 상단 캐러셀에 노출되는 활성 배너 목록을 반환합니다.")
	public ResponseEntity<ApiResponse<List<BannerResponse>>> getMainCarouselBanners() {
		List<BannerResponse> banners = bannerService.getMainCarouselBanners();
		return ResponseEntity.ok(ApiResponse.ok(banners));
	}

	@GetMapping
	@Operation(summary = "배너 목록 조회", description = "위치(position)별 활성 배너 목록을 반환합니다.")
	public ResponseEntity<ApiResponse<List<BannerResponse>>> getBanners(
			@RequestParam(defaultValue = "MAIN_CAROUSEL") BannerPosition position) {
		List<BannerResponse> banners = bannerService.getBannersByPosition(position);
		return ResponseEntity.ok(ApiResponse.ok(banners));
	}
}
