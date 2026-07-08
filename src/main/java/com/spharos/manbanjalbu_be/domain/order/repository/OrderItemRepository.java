package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderItemRepository extends JpaRepository<OrderItem, Long> {

	List<OrderItem> findByOrderId(Long orderId);

	@Query("""
			SELECT i FROM OrderItem i
			JOIN FETCH i.product p
			LEFT JOIN FETCH p.mediaList
			WHERE i.order.id IN :orderIds
			ORDER BY i.id ASC
			""")
	List<OrderItem> findAllByOrderIdInWithProduct(@Param("orderIds") List<Long> orderIds);

	@Query("""
			SELECT i FROM OrderItem i
			JOIN FETCH i.product p
			LEFT JOIN FETCH p.mediaList
			WHERE i.order.id = :orderId
			ORDER BY i.id ASC
			""")
	List<OrderItem> findAllByOrderIdWithProductOrderByIdAsc(@Param("orderId") Long orderId);
}
