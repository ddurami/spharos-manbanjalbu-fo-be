package com.spharos.manbanjalbu_be.domain.order.entity;

import com.spharos.manbanjalbu_be.domain.order.enums.OrderCancelStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCancelType;
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

@Entity
@Table(
		name = "orders_cancel",
		indexes = {
				@Index(name = "idx_orders_cancel_order_id", columnList = "order_id"),
				@Index(name = "idx_orders_cancel_status", columnList = "cancel_status")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class OrderCancel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", nullable = false)
	private Order order;

	@Enumerated(EnumType.STRING)
	@Column(name = "cancel_type", nullable = false, length = 20)
	private OrderCancelType cancelType;

	@Enumerated(EnumType.STRING)
	@Column(name = "cancel_status", nullable = false, length = 20)
	private OrderCancelStatus cancelStatus = OrderCancelStatus.REQUESTED;

	@Column(name = "cancel_reason", nullable = false, length = 255)
	private String cancelReason;

	@Column(name = "cancel_by", nullable = false, length = 50)
	private String cancelBy;

	@Column(name = "cancelled_at", nullable = false)
	private LocalDateTime cancelledAt;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	void assignOrder(Order order) {
		this.order = order;
	}
}
