package com.spharos.manbanjalbu_be.domain.order.dto.response;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.support.OrderDetailAmountCalculator;
import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "주문 상세 결제 정보")
public record OrderDetailPaymentResponse(
		@Schema(description = "주문금액 (KRW)", example = "30000")
		int orderAmount,

		@Schema(description = "상품금액 (KRW)", example = "30000")
		int productAmount,

		@Schema(description = "배송비 (KRW)", example = "3000")
		int deliveryFee,

		@Schema(description = "할인금액 (KRW)", example = "0")
		int discountAmount,

		@Schema(description = "결제금액 (KRW). productAmount + deliveryFee - discountAmount", example = "30000")
		int paidAmount,

		@Schema(description = "결제수단", example = "CARD")
		PaymentMethod paymentMethod,

		@Schema(description = "결제 상태", example = "PAID")
		PaymentStatus paymentStatus
) {
	public static OrderDetailPaymentResponse from(Order order) {
		OrderDetailAmountCalculator.PaymentAmounts amounts = OrderDetailAmountCalculator.calculate(order);
		return new OrderDetailPaymentResponse(
				order.getOrderAmount(),
				amounts.productAmount(),
				amounts.deliveryFee(),
				amounts.discountAmount(),
				amounts.paidAmount(),
				order.getPayment().getMethod(),
				order.getPayment().getStatus()
		);
	}
}
