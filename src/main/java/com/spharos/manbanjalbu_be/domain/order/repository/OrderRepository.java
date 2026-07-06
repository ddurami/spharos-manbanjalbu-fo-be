package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

public interface OrderRepository extends JpaRepository<Order, Long> {

	Optional<Order> findByOrderNo(String orderNo);

	List<Order> findByMember_IdOrderByOrderAtDesc(Long memberId);

	long countByMember_IdAndOrderStatusNotIn(Long memberId, Collection<OrderStatus> excludedStatuses);

	long countByMember_IdAndOrderType(Long memberId, OrderType orderType);

	Optional<Order> findFirstByMember_IdAndOrderStatusNotInOrderByOrderAtDesc(
			Long memberId,
			Collection<OrderStatus> excludedStatuses
	);

	Optional<Order> findFirstByMember_IdAndOrderTypeOrderByOrderAtDesc(Long memberId, OrderType orderType);
}
