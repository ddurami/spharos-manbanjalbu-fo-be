package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

	Optional<Payment> findByOrderId(Long orderId);

	Optional<Payment> findByPaymentNo(String paymentNo);

	@Lock(LockModeType.PESSIMISTIC_WRITE)
	@Query("""
			SELECT p
			FROM Payment p
			JOIN FETCH p.order o
			WHERE o.orderNo = :orderNo
			""")
	Optional<Payment> findByOrderNoForUpdate(@Param("orderNo") String orderNo);

	@Query("""
			SELECT p
			FROM Payment p
			JOIN p.order o
			WHERE o.orderNo = :orderNo
			  AND o.member.id = :memberId
			""")
	Optional<Payment> findByOrderNoAndMemberId(
			@Param("orderNo") String orderNo,
			@Param("memberId") Long memberId
	);

	@Query("""
			SELECT p
			FROM Payment p
			JOIN p.order o
			WHERE p.paymentId = :paymentId
			  AND o.member.id = :memberId
			""")
	Optional<Payment> findByPaymentIdAndMemberId(
			@Param("paymentId") Long paymentId,
			@Param("memberId") Long memberId
	);

	@Query("""
			SELECT p
			FROM Payment p
			JOIN p.order o
			WHERE o.id = :orderId
			  AND o.member.id = :memberId
			""")
	Optional<Payment> findByOrderIdAndMemberId(
			@Param("orderId") Long orderId,
			@Param("memberId") Long memberId
	);

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
