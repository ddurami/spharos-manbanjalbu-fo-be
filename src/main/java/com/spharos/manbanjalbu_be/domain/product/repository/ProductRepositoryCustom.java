package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.Capacity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ProductRepositoryCustom {

	Page<Product> searchProducts(
			String keyword,
			List<Long> categoryIds,
			Long seasonId,
			Integer minPrice,
			Integer maxPrice,
			List<Capacity> capacities,
			String sort,
			Pageable pageable
	);

	List<Long> findCategoryIdsByKeyword(String keyword);
}
