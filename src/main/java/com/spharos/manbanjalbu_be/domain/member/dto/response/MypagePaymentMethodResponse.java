package com.spharos.manbanjalbu_be.domain.member.dto.response;

public record MypagePaymentMethodResponse(
		MypageInfoItemResponse creditCard,
		MypageInfoItemResponse bankAccount,
		MypageInfoItemResponse coupon
) {
}
