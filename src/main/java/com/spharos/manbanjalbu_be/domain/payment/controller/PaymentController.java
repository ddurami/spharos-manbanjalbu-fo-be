package com.spharos.manbanjalbu_be.domain.payment.controller;

import com.spharos.manbanjalbu_be.domain.payment.dto.request.PaymentCreateRequest;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.PaymentResponse;
import com.spharos.manbanjalbu_be.domain.payment.service.PaymentService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "결제", description = "Mock 결제 API")
@RestController
@RequestMapping("/api/payments")
public class PaymentController {

	private static final String BEARER_AUTH = "BearerAuth";

	private final PaymentService paymentService;

	public PaymentController(PaymentService paymentService) {
		this.paymentService = paymentService;
	}

	@PostMapping
	@Operation(
			summary = "Mock 결제",
			description = """
					주문번호와 카드 ID로 Mock 결제를 진행합니다.
					- 금액은 Order.orderAmount 기준 (Request에 금액 없음)
					- 성공 시 Order(PAID), Payment(PAID), payment_history, member_activity_log 생성
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<PaymentResponse>> pay(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody PaymentCreateRequest request
	) {
		PaymentResponse response = paymentService.pay(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(response, "결제가 완료되었습니다."));
	}

	@GetMapping("/{paymentId}")
	@Operation(summary = "결제 상세 조회", security = @SecurityRequirement(name = BEARER_AUTH))
	public ResponseEntity<ApiResponse<PaymentResponse>> getPayment(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long paymentId
	) {
		return ResponseEntity.ok(ApiResponse.ok(paymentService.getPayment(memberId, paymentId)));
	}
}
