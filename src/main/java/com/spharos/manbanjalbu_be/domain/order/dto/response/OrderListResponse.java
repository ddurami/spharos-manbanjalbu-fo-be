package com.spharos.manbanjalbu_be.domain.order.dto.response;

import java.util.List;

public record OrderListResponse(
		List<OrderSummaryResponse> orders,
		int currentPage,
		int totalPages,
		long totalElements
) {
}
