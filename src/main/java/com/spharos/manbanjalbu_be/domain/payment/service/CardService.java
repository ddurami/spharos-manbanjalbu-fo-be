package com.spharos.manbanjalbu_be.domain.payment.service;

import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardDetailResponse;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardResponse;

import java.util.List;

public interface CardService {

	List<CardResponse> getActiveCards(Long memberId);

	CardDetailResponse getCard(Long memberId, Long cardId);
}
