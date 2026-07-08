package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long>, ProductRepositoryCustom {

	Optional<Product> findByIdAndStatus(Long id, ProductStatus status);

	Optional<Product> findFirstByStatusOrderByIdAsc(ProductStatus status);

	List<Product> findBySeasonIdAndStatusOrderByCreatedAtDesc(Long seasonId, ProductStatus status, Pageable pageable);

	@Query("SELECT p FROM Product p " +
			"WHERE p.season.id IN :seasonIds " +
			"AND p.status = :status " +
			"ORDER BY p.season.id ASC, p.createdAt DESC")
	List<Product> findBySeasonIdsAndStatus(
			@Param("seasonIds") List<Long> seasonIds,
			@Param("status") ProductStatus status
	);
}
