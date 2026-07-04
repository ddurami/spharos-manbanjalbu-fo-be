package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long>, ProductRepositoryCustom {

	Optional<Product> findByIdAndStatus(Long id, ProductStatus status);

	List<Product> findBySeasonIdAndStatusOrderByCreatedAtDesc(Long seasonId, ProductStatus status, Pageable pageable);
}
