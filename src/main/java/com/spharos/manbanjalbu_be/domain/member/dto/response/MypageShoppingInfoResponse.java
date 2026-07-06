package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record MypageShoppingInfoResponse(
		MypageInfoItemResponse orderHistory,
		MypageInfoItemResponse orderCancellation,
		MypageInfoItemResponse deliveryReservation,
		MypageInfoItemResponse deliveryAddress
) {
}
