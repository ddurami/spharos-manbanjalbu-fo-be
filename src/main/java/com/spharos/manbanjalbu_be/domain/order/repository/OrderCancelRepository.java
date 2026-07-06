package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.OrderCancel;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCancelStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface OrderCancelRepository extends JpaRepository<OrderCancel, Long> {

	List<OrderCancel> findByOrderId(Long orderId);

	@Query("""
			SELECT COUNT(oc)
			FROM OrderCancel oc
			JOIN oc.order o
			WHERE o.member.id = :memberId
			  AND oc.cancelStatus = :cancelStatus
			""")
	long countByMemberIdAndCancelStatus(
			@Param("memberId") Long memberId,
			@Param("cancelStatus") OrderCancelStatus cancelStatus
	);

	Optional<OrderCancel> findFirstByOrder_Member_IdAndCancelStatusOrderByCancelledAtDesc(
			Long memberId,
			OrderCancelStatus cancelStatus
	);
}
