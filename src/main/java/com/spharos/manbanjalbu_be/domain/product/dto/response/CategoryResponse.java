package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.Category;

import java.util.List;

public record CategoryResponse(
		Long id,
		String name,
		int displayOrder,
		List<SubCategoryResponse> subcategories
) {

	public static CategoryResponse from(Category category) {
		List<SubCategoryResponse> subs = category.getChildren().stream()
				.map(SubCategoryResponse::from)
				.toList();

		return new CategoryResponse(
				category.getId(),
				category.getName(),
				category.getDisplayOrder(),
				subs
		);
	}
}
