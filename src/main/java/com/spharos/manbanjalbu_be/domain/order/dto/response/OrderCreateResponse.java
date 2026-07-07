package com.spharos.manbanjalbu_be.domain.order.dto.response;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "주문 생성 응답")
public record OrderCreateResponse(
		@Schema(description = "주문 ID", example = "10")
		Long orderId,

		@Schema(description = "주문번호", example = "ORD20260707103000001")
		String orderNo,

		@Schema(description = "주문명", example = "클래식 넛츠 타르트 외 1건")
		String orderName,

		@Schema(description = "주문 상태", example = "PENDING")
		OrderStatus orderStatus,

		@Schema(description = "상품 금액 합계", example = "55000")
		int amount,

		@Schema(description = "배송비", example = "0")
		int deliveryFee,

		@Schema(description = "최종 결제 금액", example = "55000")
		int orderAmount,

		@Schema(description = "결제 상태", example = "READY")
		PaymentStatus paymentStatus,

		@Schema(description = "결제번호", example = "PAY20260707103000001")
		String paymentNo
) {
	public static OrderCreateResponse from(Order order) {
		return new OrderCreateResponse(
				order.getId(),
				order.getOrderNo(),
				order.getOrderName(),
				order.getOrderStatus(),
				order.getAmount(),
				order.getDeliveryFee(),
				order.getOrderAmount(),
				order.getPayment().getStatus(),
				order.getPayment().getPaymentNo()
		);
	}
}
