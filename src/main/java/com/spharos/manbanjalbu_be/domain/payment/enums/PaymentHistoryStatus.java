package com.spharos.manbanjalbu_be.domain.payment.enums;

/**
 * payment_history 이벤트 상태.
 * Payment 엔티티의 현재 status와 별도로 모든 상태 변경 이력을 기록한다.
 */
public enum PaymentHistoryStatus {
	READY,
	SUCCESS,
	FAILED,
	CANCEL,
	PARTIAL_CANCEL
}
