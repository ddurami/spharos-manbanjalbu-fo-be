package com.spharos.manbanjalbu_be.domain.order.dto.response;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import io.swagger.v3.oas.annotations.media.Schema;

@Schema(description = "주문 시점 배송지 스냅샷")
public record OrderDetailAddressResponse(
		@Schema(description = "수령인", example = "홍길동")
		String recipientName,

		@Schema(description = "배송지 별칭", example = "집")
		String addressName,

		@Schema(description = "우편번호", example = "06236")
		String zipcode,

		@Schema(description = "기본 주소", example = "서울 강남구 테헤란로 152")
		String baseAddress,

		@Schema(description = "상세 주소", example = "101동 1001호")
		String detailAddress,

		@Schema(description = "연락처", example = "01077778888")
		String phone1,

		@Schema(description = "기본 배송지 여부", example = "true")
		boolean isDefault
) {
	public static OrderDetailAddressResponse from(Order order) {
		MemberAddress memberAddress = order.getMemberAddress();
		return new OrderDetailAddressResponse(
				order.getRecipientName(),
				memberAddress != null ? memberAddress.getAddressName() : null,
				order.getRecipientZipcode(),
				order.getRecipientBaseAddress(),
				order.getRecipientDetailAddress(),
				order.getRecipientPhone(),
				memberAddress != null && Boolean.TRUE.equals(memberAddress.getIsDefault())
		);
	}
}
