package com.spharos.manbanjalbu_be.domain.cart.entity;

import com.spharos.manbanjalbu_be.domain.cart.enums.CartActionType;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
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
		name = "cart_history",
		indexes = {
				@Index(name = "idx_cart_history_member_id", columnList = "member_id"),
				@Index(name = "idx_cart_history_product_id", columnList = "product_id"),
				@Index(name = "idx_cart_history_created_at", columnList = "created_at"),
				@Index(name = "idx_cart_history_action_type", columnList = "action_type"),
				@Index(name = "idx_cart_history_member_created", columnList = "member_id, created_at"),
				@Index(name = "idx_cart_history_cart_item_id", columnList = "cart_item_id")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CartHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@Column(name = "cart_item_id", nullable = false)
	private Long cartItemId;

	@Column(name = "product_id", nullable = false)
	private Long productId;

	@Enumerated(EnumType.STRING)
	@Column(name = "action_type", nullable = false, length = 30)
	private CartActionType actionType;

	@Column(nullable = false)
	private int quantity;

	@Column(name = "before_quantity")
	private Integer beforeQuantity;

	@Column(name = "after_quantity")
	private Integer afterQuantity;

	@Column(length = 255)
	private String memo;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	public static CartHistory create(Member member, Long cartItemId, Long productId,
			CartActionType actionType, int quantity,
			Integer beforeQuantity, Integer afterQuantity, String memo) {
		CartHistory history = new CartHistory();
		history.member = member;
		history.cartItemId = cartItemId;
		history.productId = productId;
		history.actionType = actionType;
		history.quantity = quantity;
		history.beforeQuantity = beforeQuantity;
		history.afterQuantity = afterQuantity;
		history.memo = memo;
		return history;
	}
}
