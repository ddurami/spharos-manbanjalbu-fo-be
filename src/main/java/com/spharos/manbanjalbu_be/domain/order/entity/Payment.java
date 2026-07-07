package com.spharos.manbanjalbu_be.domain.order.entity;

import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentGatewayName;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
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
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Version;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

/**
 * 주문 결제 정보.
 * member_payment_method(등록 카드)와 별개이며, 주문 단위 결제 이력을 관리한다.
 */
@Entity
@Table(
		name = "payment",
		indexes = {
				@Index(name = "idx_payment_order_id", columnList = "order_id"),
				@Index(name = "idx_payment_status", columnList = "status")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "payment_id")
	private Long paymentId;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", nullable = false, unique = true)
	private Order order;

	@Column(name = "member_payment_method_id")
	private Long memberPaymentMethodId;

	@Column(name = "payment_no", nullable = false, unique = true, length = 100)
	private String paymentNo;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 20)
	private PaymentMethod method;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 20)
	private PaymentStatus status = PaymentStatus.READY;

	@Column(nullable = false)
	private int amount;

	@Column(name = "paid_amount")
	private Integer paidAmount;

	@Column(name = "approved_no", length = 50)
	private String approvedNo;

	@Column(name = "approved_at")
	private LocalDateTime approvedAt;

	@Column(name = "fail_code", length = 50)
	private String failCode;

	@Column(name = "fail_reason", length = 255)
	private String failReason;

	@Column(name = "pg_transaction_id", length = 100)
	private String pgTransactionId;

	@Enumerated(EnumType.STRING)
	@Column(name = "pg_name", length = 30)
	private PaymentGatewayName pgName;

	@Version
	@Column(nullable = false)
	private Long version = 0L;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	public static Payment create(Order order, String paymentNo, PaymentMethod method, int amount) {
		Payment payment = new Payment();
		payment.order = order;
		payment.paymentNo = paymentNo;
		payment.method = method;
		payment.status = OrderCreateFieldSpec.INITIAL_PAYMENT_STATUS;
		payment.amount = amount;
		return payment;
	}

	void assignOrder(Order order) {
		this.order = order;
	}

	/** READY 상태인지 확인한다. */
	public boolean isReady() {
		return status == PaymentStatus.READY;
	}

	/** 결제 완료 여부. */
	public boolean isPaid() {
		return status == PaymentStatus.PAID;
	}

	public void validateReadyForPayment(int expectedAmount) {
		if (isPaid()) {
			throw new BusinessException(ErrorCode.ALREADY_PAID);
		}
		if (status != PaymentStatus.READY) {
			throw new BusinessException(ErrorCode.INVALID_PAYMENT_STATUS);
		}
		if (amount != expectedAmount) {
			throw new BusinessException(ErrorCode.PAYMENT_AMOUNT_MISMATCH);
		}
	}

	/**
	 * Mock/PG 승인 성공 시 결제 완료 처리.
	 */
	public void markPaid(
			String approvedNo,
			LocalDateTime approvedAt,
			int paidAmount,
			PaymentGatewayName pgName,
			String pgTransactionId,
			Long memberPaymentMethodId
	) {
		validateReadyForPayment(paidAmount);
		this.status = PaymentStatus.PAID;
		this.paidAmount = paidAmount;
		this.approvedNo = approvedNo;
		this.approvedAt = approvedAt;
		this.pgName = pgName;
		this.pgTransactionId = pgTransactionId;
		this.memberPaymentMethodId = memberPaymentMethodId;
		this.failCode = null;
		this.failReason = null;
	}

	/** 결제 실패 처리. */
	public void markFailed(String failCode, String failReason) {
		this.status = PaymentStatus.FAILED;
		this.failCode = failCode;
		this.failReason = failReason;
	}
}
