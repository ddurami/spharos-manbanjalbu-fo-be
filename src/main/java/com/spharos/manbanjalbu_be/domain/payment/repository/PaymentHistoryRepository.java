package com.spharos.manbanjalbu_be.domain.payment.repository;

import com.spharos.manbanjalbu_be.domain.payment.entity.PaymentHistory;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentHistoryStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaymentHistoryRepository extends JpaRepository<PaymentHistory, Long> {

	List<PaymentHistory> findByPayment_PaymentIdOrderByCreatedAtAsc(Long paymentId);

	long countByPayment_PaymentIdAndHistoryStatus(Long paymentId, PaymentHistoryStatus historyStatus);
}
