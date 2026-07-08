package com.spharos.manbanjalbu_be.domain.order.controller;

import com.spharos.manbanjalbu_be.domain.order.dto.request.OrderCreateRequest;
import com.spharos.manbanjalbu_be.domain.order.dto.request.OrderListFilter;
import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderCreateResponse;
import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderDetailResponse;
import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderListResponse;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.service.OrderService;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.PaymentResponse;
import com.spharos.manbanjalbu_be.domain.payment.service.PaymentService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/orders")
@Tag(name = "주문", description = "주문 생성·목록·조회 API")
public class OrderController {

	private static final String BEARER_AUTH = "BearerAuth";

	private final OrderService orderService;
	private final PaymentService paymentService;

	public OrderController(OrderService orderService, PaymentService paymentService) {
		this.orderService = orderService;
		this.paymentService = paymentService;
	}

	@GetMapping
	@Operation(
			summary = "주문 목록 조회",
			description = """
					로그인 회원의 주문 목록을 페이징·기간 필터로 조회합니다.
					- 기본: CANCELLED, REFUNDED 상태 제외
					- period: 1M, 3M, 6M, 1Y, ALL
					- orderType: DELIVERY, RESERVATION (선택)
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@ApiResponses({
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "200",
					description = "주문 목록 조회 성공"
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
	public ResponseEntity<ApiResponse<OrderListResponse>> getOrders(
			@AuthenticationPrincipal Long memberId,
			@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "20") int size,
			@RequestParam(defaultValue = "1M") String period,
			@RequestParam(required = false) OrderType orderType
	) {
		Pageable pageable = PageRequest.of(page, size);
		OrderListResponse response = orderService.getOrders(
				memberId,
				new OrderListFilter(period, orderType),
				pageable
		);
		return ResponseEntity.ok(ApiResponse.ok(response));
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

	@GetMapping("/{orderNo}")
	@Operation(
			summary = "주문 상세 조회",
			description = """
					로그인 회원의 주문 상세를 orderNo 기준으로 조회합니다.
					- 본인 주문만 조회 가능 (타인 주문 → 403)
					- 상품명·가격·썸네일·배송지·결제금액은 주문 당시 스냅샷
					- cancelable / changeableAddress는 OrderActionPolicy 기준
					- policy(refundInfo, exchangeInfo, deliveryInfo)는 사이트 공통 정책
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@ApiResponses({
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "200",
					description = "주문 상세 조회 성공"
			),
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "401",
					description = "미인증"
			),
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "403",
					description = "타인 주문 조회"
			),
			@io.swagger.v3.oas.annotations.responses.ApiResponse(
					responseCode = "404",
					description = "존재하지 않는 주문번호"
			)
	})
	public ResponseEntity<ApiResponse<OrderDetailResponse>> getOrderDetail(
			@AuthenticationPrincipal Long memberId,
			@PathVariable String orderNo
	) {
		return ResponseEntity.ok(ApiResponse.ok(orderService.getOrderDetail(memberId, orderNo)));
	}

	@GetMapping("/{orderId}/payment")
	@Operation(
			summary = "주문 결제 정보 조회",
			description = "주문 ID로 연결된 Payment 정보를 조회합니다.",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<PaymentResponse>> getOrderPayment(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long orderId
	) {
		return ResponseEntity.ok(ApiResponse.ok(paymentService.getPaymentByOrderId(memberId, orderId)));
	}

}
