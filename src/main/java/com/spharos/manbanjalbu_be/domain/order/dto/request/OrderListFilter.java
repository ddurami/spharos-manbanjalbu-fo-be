package com.spharos.manbanjalbu_be.domain.order.dto.request;

import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;

public record OrderListFilter(
		String period,
		OrderType orderType
) {
}
