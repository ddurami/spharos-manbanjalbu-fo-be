package com.spharos.manbanjalbu_be.domain.payment.mapper;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardDetailResponse;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardResponse;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.PaymentResponse;

import java.util.List;

/**
 * Entity → Response DTO 변환 전용.
 */
public final class CardMapper {

	private CardMapper() {
	}

	public static List<CardResponse> toResponseList(List<MemberPaymentMethod> cards) {
		return cards.stream().map(CardMapper::toResponse).toList();
	}

	public static CardResponse toResponse(MemberPaymentMethod card) {
		return new CardResponse(
				card.getId(),
				card.getCardName(),
				card.getCardCompany(),
				card.getCardType(),
				card.getMaskedNumber(),
				card.getLast4(),
				card.getCardImageUrl(),
				Boolean.TRUE.equals(card.getIsDefault())
		);
	}

	public static CardDetailResponse toDetailResponse(MemberPaymentMethod card) {
		return new CardDetailResponse(
				card.getId(),
				card.getCardName(),
				card.getCardCompany(),
				card.getCardType(),
				card.getMaskedNumber(),
				card.getLast4(),
				card.getCardImageUrl(),
				Boolean.TRUE.equals(card.getIsDefault()),
				card.getCardStatus()
		);
	}
}
