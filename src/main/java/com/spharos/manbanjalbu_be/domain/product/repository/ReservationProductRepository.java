package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.ReservationProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.List;

public interface ReservationProductRepository extends JpaRepository<ReservationProduct, Long> {

	@Query("""
			SELECT rp
			FROM ReservationProduct rp
			JOIN FETCH rp.product
			WHERE rp.product.id IN :productIds
			""")
	List<ReservationProduct> findByProduct_IdIn(@Param("productIds") Collection<Long> productIds);
}
