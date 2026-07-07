package com.spharos.manbanjalbu_be.domain.order.entity;

import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
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
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

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

	@Column(name = "approved_at")
	private LocalDateTime approvedAt;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	static Payment create(Order order, String paymentNo, PaymentMethod method, int amount) {
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
}
