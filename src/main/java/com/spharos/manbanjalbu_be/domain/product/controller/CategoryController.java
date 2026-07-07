package com.spharos.manbanjalbu_be.domain.product.controller;

import com.spharos.manbanjalbu_be.domain.product.dto.response.CategoryResponse;
import com.spharos.manbanjalbu_be.domain.product.service.CategoryService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/categories")
@Tag(name = "카테고리", description = "카테고리 관련 API")
public class CategoryController {

	private final CategoryService categoryService;

	public CategoryController(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	@GetMapping
	@Operation(summary = "카테고리 목록 조회", description = "1차 카테고리와 하위 2차 카테고리를 함께 반환합니다.")
	public ResponseEntity<ApiResponse<List<CategoryResponse>>> getCategories() {
		List<CategoryResponse> categories = categoryService.getAllCategories();
		return ResponseEntity.ok(ApiResponse.ok(categories));
	}
}
