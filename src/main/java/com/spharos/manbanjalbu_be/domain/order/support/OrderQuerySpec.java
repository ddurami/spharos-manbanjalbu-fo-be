package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;

import java.time.LocalDateTime;
import java.util.Set;

public final class OrderQuerySpec {

	public static final Set<OrderStatus> EXCLUDED_ORDER_HISTORY_STATUSES = Set.of(
			OrderStatus.CANCELLED,
			OrderStatus.REFUNDED
	);

	private static final LocalDateTime ALL_PERIOD_FROM_DATE = LocalDateTime.of(1970, 1, 1, 0, 0);

	private OrderQuerySpec() {
	}

	public static LocalDateTime resolveFromDate(String period) {
		if (period == null || period.isBlank()) {
			return LocalDateTime.now().minusMonths(1);
		}

		return switch (period.toUpperCase()) {
			case "1M" -> LocalDateTime.now().minusMonths(1);
			case "3M" -> LocalDateTime.now().minusMonths(3);
			case "6M" -> LocalDateTime.now().minusMonths(6);
			case "1Y" -> LocalDateTime.now().minusYears(1);
			case "ALL" -> ALL_PERIOD_FROM_DATE;
			default -> throw new BusinessException(ErrorCode.INVALID_INPUT);
		};
	}
}
