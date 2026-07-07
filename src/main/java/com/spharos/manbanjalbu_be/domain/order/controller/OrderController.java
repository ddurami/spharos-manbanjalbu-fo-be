package com.spharos.manbanjalbu_be.domain.order.controller;

import com.spharos.manbanjalbu_be.domain.order.dto.request.OrderCreateRequest;
import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderCreateResponse;
import com.spharos.manbanjalbu_be.domain.order.service.OrderService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/orders")
@Tag(name = "주문", description = "주문 생성·조회 API")
public class OrderController {

	private final OrderService orderService;

	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}

	@PostMapping
	@Operation(
			summary = "주문 생성",
			description = """
					선택한 장바구니 상품으로 주문을 생성합니다.
					- 주문 상태: PENDING
					- 결제 상태: READY (payment 테이블)
					- 배송 상태: READY (delivery 테이블)
					- 배송지는 member_address 스냅샷으로 orders.recipient_*에 저장
					- payment ≠ member_payment_method (마이페이지 등록 결제수단)
					"""
	)
	@ApiResponses({
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "200",
					description = "주문 생성 성공"
			),
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "400",
					description = "요청 값 오류"
			),
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "403",
					description = "인증 필요 또는 권한 없음"
			)
	})
	public ResponseEntity<ApiResponse<OrderCreateResponse>> createOrder(
			@AuthenticationPrincipal Long memberId,
			@io.swagger.v3.oas.annotations.parameters.RequestBody(
					content = @Content(
							examples = @ExampleObject(
									name = "기본 주문",
									value = """
											{
											  "cartItemIds": [1, 2],
											  "memberAddressId": 3,
											  "paymentMethod": "CARD",
											  "deliveryMemo": "문 앞에 놓아주세요"
											}
											"""
							)
					)
			)
			@Valid @RequestBody OrderCreateRequest request) {
		OrderCreateResponse response = orderService.createOrder(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(response, "주문이 생성되었습니다."));
	}

}
