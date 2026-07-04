package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.ProductPolicy;

public record ProductPolicyResponse(
		String title,
		String deliveryInfo,
		String exchangeInfo,
		String refundInfo
) {

	public static ProductPolicyResponse from(ProductPolicy policy) {
		return new ProductPolicyResponse(
				policy.getTitle(),
				policy.getDeliveryInfo(),
				policy.getExchangeInfo(),
				policy.getRefundInfo()
		);
	}
}
