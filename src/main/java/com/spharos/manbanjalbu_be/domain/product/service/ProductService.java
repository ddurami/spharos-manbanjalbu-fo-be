package com.spharos.manbanjalbu_be.domain.product.service;

import com.spharos.manbanjalbu_be.domain.product.dto.response.MainProductGroupResponse;
import com.spharos.manbanjalbu_be.domain.product.dto.response.ProductDetailResponse;
import com.spharos.manbanjalbu_be.domain.product.dto.response.ProductListResponse;
import com.spharos.manbanjalbu_be.domain.product.dto.response.ProductSummaryResponse;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.Season;
import com.spharos.manbanjalbu_be.domain.product.enums.Capacity;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.SeasonRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class ProductService {

	private static final int MAIN_SEASON_COUNT = 5;
	private static final int MAIN_PRODUCT_PER_SEASON = 10;

	private final ProductRepository productRepository;
	private final SeasonRepository seasonRepository;
	private final CategoryService categoryService;

	public ProductService(ProductRepository productRepository,
			SeasonRepository seasonRepository,
			CategoryService categoryService) {
		this.productRepository = productRepository;
		this.seasonRepository = seasonRepository;
		this.categoryService = categoryService;
	}

	public ProductListResponse searchProducts(
			List<Long> categoryIds,
			Long seasonId,
			Integer minPrice,
			Integer maxPrice,
			List<Capacity> capacities,
			String keyword,
			String sort,
			Pageable pageable) {

		List<Long> expandedCategoryIds = categoryService.expandCategoryIds(categoryIds);

		Page<Product> productPage = productRepository.searchProducts(
				keyword,
				expandedCategoryIds.isEmpty() ? null : expandedCategoryIds,
				seasonId,
				minPrice,
				maxPrice,
				capacities,
				sort,
				pageable
		);

		List<ProductSummaryResponse> products = productPage.getContent().stream()
				.map(ProductSummaryResponse::from)
				.toList();

		List<Long> availableCategoryIds = null;
		if (keyword != null && !keyword.isBlank()) {
			availableCategoryIds = productRepository.findCategoryIdsByKeyword(keyword);
		}

		return new ProductListResponse(
				products,
				productPage.getNumber(),
				productPage.getTotalPages(),
				productPage.getTotalElements(),
				availableCategoryIds
		);
	}

	public ProductDetailResponse getProductDetail(Long productId) {
		Product product = productRepository.findByIdAndStatus(productId, ProductStatus.ON_SALE)
				.orElseThrow(() -> new BusinessException(ErrorCode.PRODUCT_NOT_FOUND));

		return ProductDetailResponse.from(product);
	}

	public List<MainProductGroupResponse> getMainPageProducts() {
		List<Season> recentSeasons = seasonRepository.findTop5ByOrderByCreatedAtDesc();
		if (recentSeasons.isEmpty()) {
			return List.of();
		}

		List<Long> seasonIds = recentSeasons.stream().map(Season::getId).toList();
		List<Product> allProducts = productRepository.findBySeasonIdsAndStatus(seasonIds, ProductStatus.ON_SALE);

		List<MainProductGroupResponse> groups = new ArrayList<>();
		for (Season season : recentSeasons) {
			List<ProductSummaryResponse> summaries = allProducts.stream()
					.filter(p -> p.getSeason().getId().equals(season.getId()))
					.limit(MAIN_PRODUCT_PER_SEASON)
					.map(ProductSummaryResponse::from)
					.toList();

			if (!summaries.isEmpty()) {
				groups.add(new MainProductGroupResponse(
						season.getId(),
						season.getName(),
						summaries
				));
			}
		}

		return groups;
	}
}
