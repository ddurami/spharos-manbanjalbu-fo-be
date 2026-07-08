package com.spharos.manbanjalbu_be.domain.payment.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

/**
 * Mock 결제 요청 (금액은 서버에서 Order 기준으로 계산).
 */
public record PaymentCreateRequest(
		@NotBlank(message = "주문번호는 필수입니다.")
		String orderNo,

		@NotNull(message = "카드 ID는 필수입니다.")
		Long cardId
) {
}
