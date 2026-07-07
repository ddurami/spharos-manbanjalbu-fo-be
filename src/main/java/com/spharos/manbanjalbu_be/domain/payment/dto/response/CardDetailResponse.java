package com.spharos.manbanjalbu_be.domain.payment.dto.response;

import com.spharos.manbanjalbu_be.domain.member.enums.CardStatus;
import com.spharos.manbanjalbu_be.domain.member.enums.CardType;

/**
 * 카드 상세 응답 (DELETED 제외, EXPIRED/BLOCKED 포함 가능).
 */
public record CardDetailResponse(
		Long cardId,
		String cardName,
		String cardCompany,
		CardType cardType,
		String maskedNumber,
		String last4,
		String cardImageUrl,
		boolean isDefault,
		CardStatus cardStatus
) {
}
