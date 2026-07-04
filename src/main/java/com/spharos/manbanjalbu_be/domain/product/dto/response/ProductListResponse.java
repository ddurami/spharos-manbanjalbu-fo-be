package com.spharos.manbanjalbu_be.domain.product.dto.response;

import java.util.List;

public record ProductListResponse(
		List<ProductSummaryResponse> products,
		int currentPage,
		int totalPages,
		long totalElements,
		List<Long> availableCategoryIds
) {
}
