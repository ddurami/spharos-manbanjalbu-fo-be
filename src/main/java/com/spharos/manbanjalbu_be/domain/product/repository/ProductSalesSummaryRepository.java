package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.ProductSalesSummary;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductSalesSummaryRepository extends JpaRepository<ProductSalesSummary, Long> {
}
