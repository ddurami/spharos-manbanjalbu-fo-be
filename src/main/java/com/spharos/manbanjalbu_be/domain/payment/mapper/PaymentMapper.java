package com.spharos.manbanjalbu_be.domain.payment.mapper;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.PaymentResponse;

/**
 * Payment Entity → Response DTO 변환 전용.
 */
public final class PaymentMapper {

	private PaymentMapper() {
	}

	public static PaymentResponse toResponse(Payment payment, Order order) {
		return new PaymentResponse(
				payment.getPaymentId(),
				order.getId(),
				order.getOrderNo(),
				toApiPaymentStatus(payment.getStatus()),
				payment.getApprovedNo(),
				payment.getPaidAmount(),
				payment.getApprovedAt(),
				payment.getPgName()
		);
	}

	static String toApiPaymentStatus(PaymentStatus status) {
		if (status == PaymentStatus.PAID) {
			return "SUCCESS";
		}
		if (status == PaymentStatus.CANCELLED) {
			return "CANCEL";
		}
		return status.name();
	}
}
