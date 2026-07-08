package com.spharos.manbanjalbu_be.domain.order.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "주문 상세 하단 정책 안내 (사이트 공통)")
public record OrderDetailPolicyResponse(
		@Schema(description = "취소/환불 안내")
		String refundInfo,

		@Schema(description = "교환/반품 안내")
		String exchangeInfo,

		@Schema(description = "이용조건 및 배송 안내")
		String deliveryInfo
) {
}
