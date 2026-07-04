package com.spharos.manbanjalbu_be.domain.product.controller;

import com.spharos.manbanjalbu_be.domain.product.dto.response.MainProductGroupResponse;
import com.spharos.manbanjalbu_be.domain.product.dto.response.ProductDetailResponse;
import com.spharos.manbanjalbu_be.domain.product.dto.response.ProductListResponse;
import com.spharos.manbanjalbu_be.domain.product.enums.Capacity;
import com.spharos.manbanjalbu_be.domain.product.service.ProductService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/products")
@Tag(name = "상품", description = "상품 관련 API")
public class ProductController {

	private final ProductService productService;

	public ProductController(ProductService productService) {
		this.productService = productService;
	}

	@GetMapping
	@Operation(summary = "상품 목록 조회", description = "필터, 검색어, 정렬, 페이징을 지원하는 통합 상품 목록 API")
	public ResponseEntity<ApiResponse<ProductListResponse>> getProducts(
			@RequestParam(required = false) List<Long> categoryIds,
			@RequestParam(required = false) Long seasonId,
			@RequestParam(required = false) Integer minPrice,
			@RequestParam(required = false) Integer maxPrice,
			@RequestParam(required = false) List<Capacity> capacities,
			@RequestParam(required = false) String keyword,
			@RequestParam(defaultValue = "newest") String sort,
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "20") int size) {

		Pageable pageable = PageRequest.of(page, size);

		ProductListResponse response = productService.searchProducts(
				categoryIds, seasonId, minPrice, maxPrice,
				capacities, keyword, sort, pageable
		);

		return ResponseEntity.ok(ApiResponse.ok(response));
	}

	@GetMapping("/{productId}")
	@Operation(summary = "상품 상세 조회")
	public ResponseEntity<ApiResponse<ProductDetailResponse>> getProductDetail(
			@PathVariable Long productId) {
		ProductDetailResponse response = productService.getProductDetail(productId);
		return ResponseEntity.ok(ApiResponse.ok(response));
	}

	@GetMapping("/main")
	@Operation(summary = "메인 페이지 상품 조회", description = "최신 시즌 5개, 시즌당 상품 10개를 그룹으로 반환합니다.")
	public ResponseEntity<ApiResponse<List<MainProductGroupResponse>>> getMainPageProducts() {
		List<MainProductGroupResponse> response = productService.getMainPageProducts();
		return ResponseEntity.ok(ApiResponse.ok(response));
	}
}
