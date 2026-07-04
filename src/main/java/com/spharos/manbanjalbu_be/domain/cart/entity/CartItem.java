package com.spharos.manbanjalbu_be.domain.cart.entity;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "cart_item",
		uniqueConstraints = @UniqueConstraint(
				name = "uk_cart",
				columnNames = {"member_id", "product_id"}
		),
		indexes = {
				@Index(name = "idx_cart_item_member_id", columnList = "member_id"),
				@Index(name = "idx_cart_item_product_id", columnList = "product_id")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;

	@Column(nullable = false)
	private int quantity;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	public static CartItem create(Member member, Product product, int quantity) {
		CartItem cartItem = new CartItem();
		cartItem.member = member;
		cartItem.product = product;
		cartItem.quantity = quantity;
		return cartItem;
	}

	public void addQuantity(int additionalQuantity) {
		this.quantity += additionalQuantity;
	}

	public void updateQuantity(int newQuantity) {
		this.quantity = newQuantity;
	}
}
