package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Long> {

	Optional<Order> findByOrderNo(String orderNo);

	Optional<Order> findByOrderNoAndMember_Id(String orderNo, Long memberId);

	Optional<Order> findByIdAndMember_Id(Long id, Long memberId);

	long countByMember_IdAndOrderStatus(Long memberId, OrderStatus orderStatus);

	List<Order> findByMember_IdOrderByOrderAtDesc(Long memberId);

	long countByMember_IdAndOrderStatusNotIn(Long memberId, Collection<OrderStatus> excludedStatuses);

	long countByMember_IdAndOrderType(Long memberId, OrderType orderType);

	Optional<Order> findFirstByMember_IdAndOrderStatusNotInOrderByOrderAtDesc(
			Long memberId,
			Collection<OrderStatus> excludedStatuses
	);

	Optional<Order> findFirstByMember_IdAndOrderTypeOrderByOrderAtDesc(Long memberId, OrderType orderType);

	Page<Order> findByMember_IdAndOrderStatusNotInAndOrderAtGreaterThanEqualOrderByOrderAtDesc(
			Long memberId,
			Collection<OrderStatus> excludedStatuses,
			LocalDateTime fromDate,
			Pageable pageable
	);

	Page<Order> findByMember_IdAndOrderTypeAndOrderAtGreaterThanEqualOrderByOrderAtDesc(
			Long memberId,
			OrderType orderType,
			LocalDateTime fromDate,
			Pageable pageable
	);

	@Query("""
			SELECT o FROM Order o
			LEFT JOIN FETCH o.payment
			LEFT JOIN FETCH o.delivery
			WHERE o.id IN :orderIds
			""")
	List<Order> findAllByIdInWithPaymentAndDelivery(@Param("orderIds") List<Long> orderIds);

	@Query("""
			SELECT o FROM Order o
			LEFT JOIN FETCH o.payment
			LEFT JOIN FETCH o.delivery
			LEFT JOIN FETCH o.memberAddress
			JOIN FETCH o.member
			WHERE o.orderNo = :orderNo
			""")
	Optional<Order> findByOrderNoWithDetails(@Param("orderNo") String orderNo);
}
