package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductMedia;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductMediaType;

public record ProductSummaryResponse(
		Long id,
		String name,
		int price,
		String thumbnailUrl,
		boolean isBest,
		boolean isNew
) {

	public static ProductSummaryResponse from(Product product) {
		String thumbnail = product.getMediaList().stream()
				.filter(m -> m.getMediaType() == ProductMediaType.THUMBNAIL && m.isMain())
				.findFirst()
				.map(ProductMedia::getMediaUrl)
				.orElse(null);

		return new ProductSummaryResponse(
				product.getId(),
				product.getName(),
				product.getPrice(),
				thumbnail,
				product.isBest(),
				product.isNew()
		);
	}
}
