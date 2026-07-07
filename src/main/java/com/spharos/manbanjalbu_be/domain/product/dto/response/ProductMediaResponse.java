package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.ProductMedia;

public record ProductMediaResponse(
		Long id,
		String mediaType,
		String mediaUrl,
		int displayOrder,
		boolean isMain
) {

	public static ProductMediaResponse from(ProductMedia media) {
		return new ProductMediaResponse(
				media.getId(),
				media.getMediaType().name(),
				media.getMediaUrl(),
				media.getDisplayOrder(),
				media.isMain()
		);
	}
}
