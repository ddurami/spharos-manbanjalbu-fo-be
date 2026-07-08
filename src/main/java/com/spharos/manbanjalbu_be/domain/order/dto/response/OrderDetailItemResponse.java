package com.spharos.manbanjalbu_be.domain.order.dto.response;

import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import com.spharos.manbanjalbu_be.domain.order.support.OrderThumbnailResolver;
import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "주문 상세 상품 항목 (주문 당시 스냅샷)")
public record OrderDetailItemResponse(
		@Schema(description = "상품 ID", example = "1")
		Long productId,

		@Schema(description = "주문 당시 상품명", example = "클래식 넛츠 타르트")
		String productName,

		@Schema(description = "수량", example = "1")
		int quantity,

		@Schema(description = "주문 당시 단가 (KRW)", example = "15000")
		int unitPrice,

		@Schema(description = "라인 합계 (KRW)", example = "15000")
		int lineAmount,

		@Schema(description = "상품 썸네일 URL")
		String thumbnailUrl
) {
	public static OrderDetailItemResponse from(OrderItem item) {
		return new OrderDetailItemResponse(
				item.getProduct().getId(),
				item.getProductName(),
				item.getQuantity(),
				item.getFinalPrice(),
				item.getFinalPrice() * item.getQuantity(),
				OrderThumbnailResolver.resolveFromProduct(item.getProduct())
		);
	}
}
