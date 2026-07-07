package com.spharos.manbanjalbu_be.domain.payment.dto.response;

import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentGatewayName;

import java.time.LocalDateTime;

/**
 * 결제 조회/승인 응답.
 */
public record PaymentResponse(
		Long paymentId,
		Long orderId,
		String orderNo,
		String paymentStatus,
		String approvedNumber,
		Integer paidAmount,
		LocalDateTime paidAt,
		PaymentGatewayName pgName
) {
}
