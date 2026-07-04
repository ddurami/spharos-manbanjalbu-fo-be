package com.spharos.manbanjalbu_be.domain.cart.dto.response;

import java.util.List;

public record CartListResponse(
		List<CartItemResponse> cartItems,
		int totalCartCount
) {
}
