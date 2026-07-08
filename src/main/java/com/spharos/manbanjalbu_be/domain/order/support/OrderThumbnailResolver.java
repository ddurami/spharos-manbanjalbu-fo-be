package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductMedia;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductMediaType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class OrderThumbnailResolver {

	private OrderThumbnailResolver() {
	}

	public static String resolveFromProduct(Product product) {
		if (product == null) {
			return null;
		}

		return product.getMediaList().stream()
				.filter(media -> media.getMediaType() == ProductMediaType.THUMBNAIL && media.isMain())
				.findFirst()
				.map(ProductMedia::getMediaUrl)
				.orElse(null);
	}

	public static Map<Long, String> resolveByOrderId(List<OrderItem> orderItems) {
		Map<Long, String> thumbnailsByOrderId = new HashMap<>();

		for (OrderItem orderItem : orderItems) {
			Long orderId = orderItem.getOrder().getId();
			thumbnailsByOrderId.putIfAbsent(orderId, resolveFromProduct(orderItem.getProduct()));
		}

		return thumbnailsByOrderId;
	}
}
