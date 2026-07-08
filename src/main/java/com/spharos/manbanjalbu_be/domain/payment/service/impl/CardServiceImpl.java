package com.spharos.manbanjalbu_be.domain.payment.service.impl;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.CardStatus;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardDetailResponse;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardResponse;
import com.spharos.manbanjalbu_be.domain.payment.mapper.CardMapper;
import com.spharos.manbanjalbu_be.domain.payment.service.CardService;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class CardServiceImpl implements CardService {

	private final MemberPaymentMethodRepository memberPaymentMethodRepository;

	public CardServiceImpl(MemberPaymentMethodRepository memberPaymentMethodRepository) {
		this.memberPaymentMethodRepository = memberPaymentMethodRepository;
	}

	@Override
	public List<CardResponse> getActiveCards(Long memberId) {
		requireMemberId(memberId);
		List<MemberPaymentMethod> cards = memberPaymentMethodRepository.findActiveCardsByMemberId(memberId);
		return CardMapper.toResponseList(cards);
	}

	@Override
	public CardDetailResponse getCard(Long memberId, Long cardId) {
		requireMemberId(memberId);
		MemberPaymentMethod card = memberPaymentMethodRepository
				.findVisibleCardByIdAndMemberId(cardId, memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.CARD_NOT_FOUND));
		return CardMapper.toDetailResponse(card);
	}

	private void requireMemberId(Long memberId) {
		if (memberId == null) {
			throw new BusinessException(ErrorCode.UNAUTHORIZED);
		}
	}
}
