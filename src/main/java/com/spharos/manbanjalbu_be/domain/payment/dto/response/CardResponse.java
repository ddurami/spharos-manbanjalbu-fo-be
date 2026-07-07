package com.spharos.manbanjalbu_be.domain.payment.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.CardType;

/**
 * 결제 화면 카드 목록 응답.
 */
public record CardResponse(
		Long cardId,
		String cardName,
		String cardCompany,
		CardType cardType,
		String maskedNumber,
		String last4,
		String cardImageUrl,
		boolean isDefault
) {
}
