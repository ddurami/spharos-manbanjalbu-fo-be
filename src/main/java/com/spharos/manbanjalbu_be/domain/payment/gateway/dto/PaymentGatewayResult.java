package com.spharos.manbanjalbu_be.domain.payment.gateway.dto;

import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentGatewayName;

import java.time.LocalDateTime;

/**
 * PaymentGateway 승인 처리 결과 (immutable).
 * DB 저장·상태 변경은 PaymentService 책임이다.
 */
public record PaymentGatewayResult(
		boolean success,
		String approvedNo,
		LocalDateTime approvedAt,
		PaymentGatewayName pgName,
		String pgTransactionId,
		String failCode,
		String failReason
) {

	public static PaymentGatewayResult success(
			String approvedNo,
			LocalDateTime approvedAt,
			PaymentGatewayName pgName,
			String pgTransactionId
	) {
		return new PaymentGatewayResult(
				true,
				approvedNo,
				approvedAt,
				pgName,
				pgTransactionId,
				null,
				null
		);
	}

	public static PaymentGatewayResult failure(
			PaymentGatewayName pgName,
			String failCode,
			String failReason
	) {
		return new PaymentGatewayResult(
				false,
				null,
				null,
				pgName,
				null,
				failCode,
				failReason
		);
	}
}
