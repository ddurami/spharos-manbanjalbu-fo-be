package com.spharos.manbanjalbu_be.domain.order.support;

import java.util.List;

public final class OrderNameGenerator {

	private OrderNameGenerator() {
	}

	public static String generate(List<String> productNames) {
		if (productNames == null || productNames.isEmpty()) {
			throw new IllegalArgumentException("주문명을 만들 상품명이 필요합니다.");
		}

		String firstName = productNames.get(0);
		if (productNames.size() == 1) {
			return firstName;
		}

		return firstName + " 외 " + (productNames.size() - 1) + "건";
	}

}
