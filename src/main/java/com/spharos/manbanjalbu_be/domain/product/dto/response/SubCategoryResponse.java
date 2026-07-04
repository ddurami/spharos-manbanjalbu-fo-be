package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.Category;

public record SubCategoryResponse(
		Long id,
		String name,
		int displayOrder
) {

	public static SubCategoryResponse from(Category category) {
		return new SubCategoryResponse(
				category.getId(),
				category.getName(),
				category.getDisplayOrder()
		);
	}
}
