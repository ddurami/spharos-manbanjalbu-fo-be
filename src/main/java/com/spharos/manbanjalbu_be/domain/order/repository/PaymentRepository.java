package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

	Optional<Payment> findByOrderId(Long orderId);

	Optional<Payment> findByPaymentNo(String paymentNo);

	@Query("""
			SELECT COUNT(p)
			FROM Payment p
			JOIN p.order o
			WHERE o.member.id = :memberId
			  AND p.method = :method
			  AND p.status = :status
			""")
	long countByMemberIdAndMethodAndStatus(
			@Param("memberId") Long memberId,
			@Param("method") PaymentMethod method,
			@Param("status") PaymentStatus status
	);
}
