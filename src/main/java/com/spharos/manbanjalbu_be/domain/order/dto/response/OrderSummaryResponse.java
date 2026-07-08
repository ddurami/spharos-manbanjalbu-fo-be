package com.spharos.manbanjalbu_be.domain.order.dto.response;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.DeliveryStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.support.OrderActionPolicy;
import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Schema(description = "주문 목록 항목")
public record OrderSummaryResponse(
		@Schema(description = "주문 ID", example = "10")
		Long orderId,

		@Schema(description = "주문번호", example = "ORD20260710001")
		String orderNo,

		@Schema(description = "주문명", example = "클래식 넛츠 타르트 외 1건")
		String orderName,

		@Schema(description = "주문 상태", example = "PAID")
		OrderStatus orderStatus,

		@Schema(description = "주문 유형", example = "DELIVERY")
		OrderType orderType,

		@Schema(description = "최종 결제 금액", example = "30000")
		int orderAmount,

		@Schema(description = "주문 일시", example = "2026-07-10T14:30:00")
		LocalDateTime orderedAt,

		@Schema(description = "결제 상태", example = "READY")
		PaymentStatus paymentStatus,

		@Schema(description = "배송 상태", example = "READY")
		DeliveryStatus deliveryStatus,

		@Schema(description = "예약 배송일 (YYYY-MM-DD). 예약 주문일 때만 반환", example = "2026-07-15")
		LocalDate reservationDeliveryDate,

		@Schema(description = "대표 상품 썸네일 URL")
		String thumbnailUrl,

		@Schema(description = "주문 취소 가능 여부", example = "false")
		boolean cancelable
) {
	public static OrderSummaryResponse from(Order order, String thumbnailUrl) {
		return new OrderSummaryResponse(
				order.getId(),
				order.getOrderNo(),
				order.getOrderName(),
				order.getOrderStatus(),
				order.getOrderType(),
				order.getOrderAmount(),
				order.getOrderAt(),
				order.getPayment().getStatus(),
				order.getDelivery().getDeliveryStatus(),
				order.getReservationDeliveryDate(),
				thumbnailUrl,
				OrderActionPolicy.isCancelable(order)
		);
	}
}
