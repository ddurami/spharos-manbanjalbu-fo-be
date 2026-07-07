package com.spharos.manbanjalbu_be.domain.order.entity;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateCommand;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
import jakarta.persistence.CascadeType;
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
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(
		name = "orders",
		indexes = {
				@Index(name = "idx_orders_member_id", columnList = "member_id"),
				@Index(name = "idx_orders_order_status", columnList = "order_status"),
				@Index(name = "idx_orders_order_at", columnList = "order_at"),
				@Index(name = "idx_orders_member_status", columnList = "member_id, order_status"),
				@Index(name = "idx_orders_order_type", columnList = "order_type")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_address_id")
	private MemberAddress memberAddress;

	@Column(name = "order_no", nullable = false, unique = true, length = 50)
	private String orderNo;

	@Column(name = "order_name", nullable = false, length = 200)
	private String orderName;

	@Enumerated(EnumType.STRING)
	@Column(name = "order_status", nullable = false, length = 20)
	private OrderStatus orderStatus = OrderStatus.PENDING;

	@Enumerated(EnumType.STRING)
	@Column(name = "order_type", nullable = false, length = 20)
	private OrderType orderType = OrderType.DELIVERY;

	@Enumerated(EnumType.STRING)
	@Column(name = "order_category", length = 20)
	private OrderCategory orderCategory = OrderCategory.GENERAL;

	@Column(name = "delivery_memo", length = 255)
	private String deliveryMemo;

	@Column(nullable = false)
	private int amount;

	@Column(name = "delivery_fee", nullable = false)
	private int deliveryFee;

	@Column(name = "order_amount", nullable = false)
	private int orderAmount;

	@Column(name = "reservation_delivery_date")
	private LocalDate reservationDeliveryDate;

	@Column(name = "recipient_name", nullable = false, length = 50)
	private String recipientName;

	@Column(name = "recipient_phone", nullable = false, length = 20)
	private String recipientPhone;

	@Column(name = "recipient_zipcode", nullable = false, length = 10)
	private String recipientZipcode;

	@Column(name = "recipient_base_address", nullable = false, length = 255)
	private String recipientBaseAddress;

	@Column(name = "recipient_detail_address", nullable = false, length = 255)
	private String recipientDetailAddress;

	@Column(name = "order_at", nullable = false)
	private LocalDateTime orderAt;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<OrderItem> items = new ArrayList<>();

	@OneToOne(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	private Payment payment;

	@OneToOne(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
	private Delivery delivery;

	@OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<OrderCancel> cancellations = new ArrayList<>();

	public static Order create(OrderCreateCommand command) {
		Order order = new Order();
		order.member = command.member();
		order.memberAddress = command.memberAddress();
		order.orderNo = command.orderNo();
		order.orderName = command.orderName();
		order.orderStatus = OrderCreateFieldSpec.INITIAL_ORDER_STATUS;
		order.orderType = command.orderType();
		order.orderCategory = command.orderCategory();
		order.deliveryMemo = command.deliveryMemo();

		OrderCreateFieldSpec.OrderAmounts amounts = command.amounts();
		order.amount = amounts.amount();
		order.deliveryFee = amounts.deliveryFee();
		order.orderAmount = amounts.orderAmount();

		OrderCreateFieldSpec.RecipientSnapshot recipient = command.recipient();
		order.recipientName = recipient.recipientName();
		order.recipientPhone = recipient.recipientPhone();
		order.recipientZipcode = recipient.recipientZipcode();
		order.recipientBaseAddress = recipient.recipientBaseAddress();
		order.recipientDetailAddress = recipient.recipientDetailAddress();

		order.orderAt = command.orderAt();
		return order;
	}

	public void addItem(OrderItem item) {
		items.add(item);
		item.assignOrder(this);
	}

	public void registerPayment(String paymentNo, PaymentMethod method, int amount) {
		this.payment = Payment.create(this, paymentNo, method, amount);
	}

	public void registerDelivery() {
		this.delivery = Delivery.create(this);
	}

	/** 결제 완료 시 주문 상태를 PAID로 변경한다. */
	public void markPaid() {
		if (orderStatus == OrderStatus.PAID) {
			throw new BusinessException(ErrorCode.ALREADY_PAID);
		}
		if (orderStatus != OrderStatus.PENDING) {
			throw new BusinessException(ErrorCode.INVALID_PAYMENT_STATUS);
		}
		this.orderStatus = OrderStatus.PAID;
	}
}
