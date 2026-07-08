package com.spharos.manbanjalbu_be.domain.order.dto.response;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.support.OrderActionPolicy;
import com.spharos.manbanjalbu_be.domain.order.support.OrderDetailPolicySpec;
import com.spharos.manbanjalbu_be.domain.order.support.OrderThumbnailResolver;
import io.swagger.v3.oas.annotations.media.Schema;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Schema(description = "주문 상세 조회 응답. 상품·배송지·결제금액은 주문 당시 스냅샷을 사용한다.")
public record OrderDetailResponse(
		@Schema(description = "주문 ID", example = "1")
		Long orderId,

		@Schema(description = "주문번호", example = "1234567890")
		String orderNo,

		@Schema(description = "주문명", example = "클래식 넛츠 타르트 외 1개")
		String orderName,

		@Schema(description = "주문 상태", example = "PAID")
		OrderStatus orderStatus,

		@Schema(description = "주문 유형", example = "DELIVERY")
		OrderType orderType,

		@Schema(description = "최종 결제 금액 (KRW)", example = "30000")
		int orderAmount,

		@Schema(description = "주문 일시 (ISO 8601)", example = "2026-07-10T16:00:00")
		LocalDateTime orderedAt,

		@Schema(description = "첫 번째 주문상품 대표 썸네일 URL")
		String thumbnailUrl,

		@Schema(description = "예약 배송일. RESERVATION 주문일 때만 반환", example = "2026-07-15")
		LocalDate reservationDeliveryDate,

		@Schema(description = "주문 취소 가능 여부", example = "true")
		boolean cancelable,

		@Schema(description = "배송지 변경 가능 여부", example = "true")
		boolean changeableAddress,

		@Schema(description = "주문 상품 목록 (OrderItem.id ASC)")
		List<OrderDetailItemResponse> items,

		@Schema(description = "결제 정보")
		OrderDetailPaymentResponse payment,

		@Schema(description = "배송지 스냅샷")
		OrderDetailAddressResponse deliveryAddress,

		@Schema(description = "사이트 공통 정책 안내")
		OrderDetailPolicyResponse policy
) {
	public static OrderDetailResponse from(Order order, List<OrderItem> items) {
		String thumbnailUrl = items.isEmpty()
				? null
				: OrderThumbnailResolver.resolveFromProduct(items.get(0).getProduct());

		return new OrderDetailResponse(
				order.getId(),
				order.getOrderNo(),
				order.getOrderName(),
				order.getOrderStatus(),
				order.getOrderType(),
				order.getOrderAmount(),
				order.getOrderAt(),
				thumbnailUrl,
				resolveReservationDeliveryDate(order),
				OrderActionPolicy.isCancelable(order),
				OrderActionPolicy.isChangeableAddress(order),
				items.stream().map(OrderDetailItemResponse::from).toList(),
				OrderDetailPaymentResponse.from(order),
				OrderDetailAddressResponse.from(order),
				OrderDetailPolicySpec.toResponse()
		);
	}

	private static LocalDate resolveReservationDeliveryDate(Order order) {
		if (order.getOrderType() != OrderType.RESERVATION) {
			return null;
		}
		return order.getReservationDeliveryDate();
	}
}
