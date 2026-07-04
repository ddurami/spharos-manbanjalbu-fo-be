package com.spharos.manbanjalbu_be.domain.cart.dto.response;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartItem;

import java.time.LocalDateTime;

public record CartItemResponse(
		Long cartItemId,
		Long productId,
		int quantity,
		LocalDateTime createdAt
) {

	public static CartItemResponse from(CartItem cartItem) {
		return new CartItemResponse(
				cartItem.getId(),
				cartItem.getProductId(),
				cartItem.getQuantity(),
				cartItem.getCreatedAt()
		);
	}
}
