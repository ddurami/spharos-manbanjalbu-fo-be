package com.spharos.manbanjalbu_be.domain.order.dto.request;

import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

@Schema(description = "주문 생성 요청")
public record OrderCreateRequest(
		@Schema(description = "주문할 장바구니 아이템 ID 목록", example = "[1, 2]")
		@NotEmpty(message = "주문할 장바구니 상품을 선택해 주세요.")
		List<Long> cartItemIds,

		@Schema(description = "배송지 ID (member_address)", example = "3")
		@NotNull(message = "배송지를 선택해 주세요.")
		Long memberAddressId,

		@Schema(
				description = "결제수단 (payment 테이블 method). FE 매핑: credit-card→CARD, ssgpay→MOBILE, simple-pay/starbucks-card→EASY_PAY",
				example = "CARD"
		)
		@NotNull(message = "결제수단을 선택해 주세요.")
		PaymentMethod paymentMethod,

		@Schema(description = "배송 메모 (미입력 시 배송지 기본값 사용)", example = "문 앞에 놓아주세요")
		@Size(max = 255, message = "배송 메모는 255자 이하여야 합니다.")
		String deliveryMemo,

		@Schema(description = "적용 쿠폰 ID (선택, MVP 이후)", example = "null")
		Long memberCouponId,

		@Schema(description = "주문 유형 (기본 DELIVERY)", example = "DELIVERY")
		OrderType orderType,

		@Schema(description = "주문 카테고리 (기본 GENERAL)", example = "GENERAL")
		OrderCategory orderCategory
) {
}
