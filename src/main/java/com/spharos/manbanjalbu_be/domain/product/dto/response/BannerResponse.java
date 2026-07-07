package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.Banner;

public record BannerResponse(
		Long id,
		String title,
		String imageUrl,
		String linkUrl,
		int displayOrder
) {

	public static BannerResponse from(Banner banner) {
		return new BannerResponse(
				banner.getId(),
				banner.getTitle(),
				banner.getImageUrl(),
				banner.getLinkUrl(),
				banner.getDisplayOrder()
		);
	}
}
