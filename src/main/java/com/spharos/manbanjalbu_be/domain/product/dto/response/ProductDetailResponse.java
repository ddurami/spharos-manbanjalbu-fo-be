package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;

import java.util.List;

public record ProductDetailResponse(
		Long id,
		String name,
		String shortDescription,
		int price,
		String saleType,
		String capacity,
		boolean isBest,
		boolean isNew,
		String categoryName,
		String seasonName,
		List<ProductMediaResponse> mediaList,
		ProductPolicyResponse policy
) {

	public static ProductDetailResponse from(Product product) {
		List<ProductMediaResponse> mediaResponses = product.getMediaList().stream()
				.map(ProductMediaResponse::from)
				.toList();

		String categoryName = product.getCategory().getName();
		String seasonName = product.getSeason() != null ? product.getSeason().getName() : null;
		String capacityStr = product.getCapacity() != null ? product.getCapacity().name() : null;

		return new ProductDetailResponse(
				product.getId(),
				product.getName(),
				product.getShortDescription(),
				product.getPrice(),
				product.getSaleType().name(),
				capacityStr,
				product.isBest(),
				product.isNew(),
				categoryName,
				seasonName,
				mediaResponses,
				ProductPolicyResponse.from(product.getPolicy())
		);
	}
}
