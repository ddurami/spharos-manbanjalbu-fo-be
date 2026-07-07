package com.spharos.manbanjalbu_be.domain.payment.service;

import com.spharos.manbanjalbu_be.domain.payment.dto.request.PaymentCreateRequest;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.PaymentResponse;

public interface PaymentService {

	PaymentResponse pay(Long memberId, PaymentCreateRequest request);

	PaymentResponse getPayment(Long memberId, Long paymentId);

	PaymentResponse getPaymentByOrderId(Long memberId, Long orderId);
}
