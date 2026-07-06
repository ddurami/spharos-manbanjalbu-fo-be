package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record MypageSummaryResponse(
		String name,
		MypageShoppingInfoResponse shoppingInfo,
		MypagePaymentMethodResponse paymentMethods
) {
}
