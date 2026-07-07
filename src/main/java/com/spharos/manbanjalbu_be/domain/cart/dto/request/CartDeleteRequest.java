package com.spharos.manbanjalbu_be.domain.cart.dto.request;

import jakarta.validation.constraints.NotEmpty;

import java.util.List;

public record CartDeleteRequest(
		@NotEmpty(message = "삭제할 장바구니 아이템 ID 목록은 필수입니다.")
		List<Long> cartItemIds
) {
}
