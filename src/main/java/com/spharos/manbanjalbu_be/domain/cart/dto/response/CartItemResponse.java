package com.spharos.manbanjalbu_be.domain.cart.dto.response;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartItem;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductMedia;

import java.time.LocalDateTime;

public record CartItemResponse(
		Long cartItemId,
		Long productId,
		String productName,
		int price,
		String thumbnailUrl,
		boolean isBest,
		boolean isNew,
		int quantity,
		LocalDateTime createdAt,
		boolean reservationAvailable
) {

	public static CartItemResponse from(CartItem cartItem, boolean reservationAvailable) {
		Product product = cartItem.getProduct();

		String thumbnailUrl = product.getMediaList().stream()
				.filter(ProductMedia::isMain)
				.findFirst()
				.map(ProductMedia::getMediaUrl)
				.orElse(null);

		return new CartItemResponse(
				cartItem.getId(),
				product.getId(),
				product.getName(),
				product.getPrice(),
				thumbnailUrl,
				product.isBest(),
				product.isNew(),
				cartItem.getQuantity(),
				cartItem.getCreatedAt(),
				reservationAvailable
		);
	}
}
