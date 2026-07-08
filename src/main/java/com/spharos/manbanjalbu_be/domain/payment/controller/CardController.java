package com.spharos.manbanjalbu_be.domain.payment.controller;

import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardDetailResponse;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.CardResponse;
import com.spharos.manbanjalbu_be.domain.payment.service.CardService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "결제수단", description = "Mock 카드 조회 API")
@RestController
@RequestMapping("/api/cards")
public class CardController {

	private static final String BEARER_AUTH = "BearerAuth";

	private final CardService cardService;

	public CardController(CardService cardService) {
		this.cardService = cardService;
	}

	@GetMapping
	@Operation(
			summary = "등록 카드 목록 조회",
			description = "ACTIVE 상태의 카드만 반환합니다 (DELETED/BLOCKED/EXPIRED 제외).",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<List<CardResponse>>> getCards(
			@AuthenticationPrincipal Long memberId
	) {
		return ResponseEntity.ok(ApiResponse.ok(cardService.getActiveCards(memberId)));
	}

	@GetMapping("/{cardId}")
	@Operation(
			summary = "카드 상세 조회",
			description = "DELETED 카드는 조회할 수 없습니다.",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<CardDetailResponse>> getCard(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long cardId
	) {
		return ResponseEntity.ok(ApiResponse.ok(cardService.getCard(memberId, cardId)));
	}
}
