package com.spharos.manbanjalbu_be.domain.payment.entity;

import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentGatewayName;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentHistoryStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

/**
 * 결제 상태 변경 이력.
 * READY, SUCCESS, FAILED, CANCEL, PARTIAL_CANCEL 등 모든 이벤트를 기록한다.
 */
@Entity
@Table(
		name = "payment_history",
		indexes = {
				@Index(name = "idx_payment_history_payment_id", columnList = "payment_id"),
				@Index(name = "idx_payment_history_order_id", columnList = "order_id"),
				@Index(name = "idx_payment_history_member_id", columnList = "member_id")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PaymentHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "payment_id", nullable = false)
	private Payment payment;

	@Column(name = "order_id", nullable = false)
	private Long orderId;

	@Column(name = "member_id", nullable = false)
	private Long memberId;

	@Column(name = "member_payment_method_id")
	private Long memberPaymentMethodId;

	@Enumerated(EnumType.STRING)
	@Column(name = "history_status", nullable = false, length = 20)
	private PaymentHistoryStatus historyStatus;

	@Column(nullable = false)
	private int amount;

	@Column(name = "approved_no", length = 50)
	private String approvedNo;

	@Enumerated(EnumType.STRING)
	@Column(name = "pg_name", length = 30)
	private PaymentGatewayName pgName;

	@Column(name = "pg_transaction_id", length = 100)
	private String pgTransactionId;

	@Column(name = "fail_code", length = 50)
	private String failCode;

	@Column(name = "fail_reason", length = 255)
	private String failReason;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	public static PaymentHistory record(
			Payment payment,
			Long memberId,
			PaymentHistoryStatus historyStatus,
			int amount,
			Long memberPaymentMethodId,
			String approvedNo,
			PaymentGatewayName pgName,
			String pgTransactionId,
			String failCode,
			String failReason
	) {
		PaymentHistory history = new PaymentHistory();
		history.payment = payment;
		history.orderId = payment.getOrder().getId();
		history.memberId = memberId;
		history.historyStatus = historyStatus;
		history.amount = amount;
		history.memberPaymentMethodId = memberPaymentMethodId;
		history.approvedNo = approvedNo;
		history.pgName = pgName;
		history.pgTransactionId = pgTransactionId;
		history.failCode = failCode;
		history.failReason = failReason;
		return history;
	}

	public static PaymentHistory recordReady(Payment payment, Long memberId) {
		return record(
				payment,
				memberId,
				PaymentHistoryStatus.READY,
				payment.getAmount(),
				null,
				null,
				null,
				null,
				null,
				null
		);
	}

	public static PaymentHistory recordSuccess(
			Payment payment,
			Long memberId,
			Long memberPaymentMethodId,
			String approvedNo,
			PaymentGatewayName pgName,
			String pgTransactionId
	) {
		return record(
				payment,
				memberId,
				PaymentHistoryStatus.SUCCESS,
				payment.getPaidAmount(),
				memberPaymentMethodId,
				approvedNo,
				pgName,
				pgTransactionId,
				null,
				null
		);
	}

	public static PaymentHistory recordFailed(
			Payment payment,
			Long memberId,
			String failCode,
			String failReason
	) {
		return record(
				payment,
				memberId,
				PaymentHistoryStatus.FAILED,
				payment.getAmount(),
				null,
				null,
				null,
				null,
				failCode,
				failReason
		);
	}
}
