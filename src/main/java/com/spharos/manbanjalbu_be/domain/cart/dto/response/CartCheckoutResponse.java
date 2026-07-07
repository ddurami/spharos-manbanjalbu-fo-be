package com.spharos.manbanjalbu_be.domain.cart.dto.response;

import java.util.List;

public record CartCheckoutResponse(
		List<CartItemResponse> cartItems,
		int productAmount,
		int discountAmount,
		int shippingFee,
		int totalAmount
) {
}
