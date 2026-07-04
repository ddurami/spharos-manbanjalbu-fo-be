package com.spharos.manbanjalbu_be.domain.product.dto.response;

import java.util.List;

public record MainProductGroupResponse(
		Long seasonId,
		String seasonName,
		List<ProductSummaryResponse> products
) {
}
