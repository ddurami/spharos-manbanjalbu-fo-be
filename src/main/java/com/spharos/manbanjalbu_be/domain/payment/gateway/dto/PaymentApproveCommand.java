package com.spharos.manbanjalbu_be.domain.payment.gateway.dto;

import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;

/**
 * PaymentGateway 승인 요청 DTO.
 * Entity 대신 Command만 사용하며, 금액은 Service에서 Order 기준으로 설정한다.
 */
public record PaymentApproveCommand(
		String orderNo,
		Long paymentId,
		Long memberId,
		Long cardId,
		String cardToken,
		int amount,
		PaymentMethod paymentMethod
) {
}
