package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;

/**
 * 주문 상세 결제 금액 계산.
 * paidAmount = productAmount + deliveryFee - discountAmount
 */
public final class OrderDetailAmountCalculator {

	private OrderDetailAmountCalculator() {
	}

	public record PaymentAmounts(
			int productAmount,
			int deliveryFee,
			int discountAmount,
			int paidAmount
	) {
	}

	public static PaymentAmounts calculate(Order order) {
		int productAmount = order.getAmount();
		int deliveryFee = order.getDeliveryFee();
		int paidAmount = order.getOrderAmount();
		int discountAmount = productAmount + deliveryFee - paidAmount;
		return new PaymentAmounts(productAmount, deliveryFee, discountAmount, paidAmount);
	}
}
