package com.spharos.manbanjalbu_be.domain.payment.service.impl;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.CardStatus;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.repository.PaymentRepository;
import com.spharos.manbanjalbu_be.domain.payment.dto.request.PaymentCreateRequest;
import com.spharos.manbanjalbu_be.domain.payment.dto.response.PaymentResponse;
import com.spharos.manbanjalbu_be.domain.payment.entity.MemberActivityLog;
import com.spharos.manbanjalbu_be.domain.payment.entity.PaymentHistory;
import com.spharos.manbanjalbu_be.domain.payment.gateway.PaymentGateway;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentApproveCommand;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentGatewayResult;
import com.spharos.manbanjalbu_be.domain.payment.mapper.PaymentMapper;
import com.spharos.manbanjalbu_be.domain.payment.repository.MemberActivityLogRepository;
import com.spharos.manbanjalbu_be.domain.payment.repository.PaymentHistoryRepository;
import com.spharos.manbanjalbu_be.domain.payment.service.PaymentService;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PaymentServiceImpl implements PaymentService {

	private final OrderRepository orderRepository;
	private final PaymentRepository paymentRepository;
	private final MemberPaymentMethodRepository memberPaymentMethodRepository;
	private final PaymentHistoryRepository paymentHistoryRepository;
	private final MemberActivityLogRepository memberActivityLogRepository;
	private final PaymentGateway paymentGateway;

	public PaymentServiceImpl(
			OrderRepository orderRepository,
			PaymentRepository paymentRepository,
			MemberPaymentMethodRepository memberPaymentMethodRepository,
			PaymentHistoryRepository paymentHistoryRepository,
			MemberActivityLogRepository memberActivityLogRepository,
			PaymentGateway paymentGateway
	) {
		this.orderRepository = orderRepository;
		this.paymentRepository = paymentRepository;
		this.memberPaymentMethodRepository = memberPaymentMethodRepository;
		this.paymentHistoryRepository = paymentHistoryRepository;
		this.memberActivityLogRepository = memberActivityLogRepository;
		this.paymentGateway = paymentGateway;
	}

	@Override
	@Transactional
	public PaymentResponse pay(Long memberId, PaymentCreateRequest request) {
		requireMemberId(memberId);

		// 1. Order
		Order order = orderRepository.findByOrderNoAndMember_Id(request.orderNo(), memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.ORDER_NOT_FOUND));

		// 2. Payment (Lock)
		Payment payment = paymentRepository.findByOrderNoForUpdate(request.orderNo())
				.orElseThrow(() -> new BusinessException(ErrorCode.PAYMENT_NOT_FOUND));

		// 3. Card
		MemberPaymentMethod card = memberPaymentMethodRepository.findByIdAndMember_Id(request.cardId(), memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.CARD_NOT_FOUND));

		// 4. Validation
		validatePayment(order, payment, card);

		int payAmount = order.getOrderAmount();

		// 5. Gateway (한 번만 호출, 재시도 없음)
		PaymentApproveCommand command = new PaymentApproveCommand(
				order.getOrderNo(),
				payment.getPaymentId(),
				memberId,
				card.getId(),
				card.getCardToken(),
				payAmount,
				payment.getMethod()
		);
		PaymentGatewayResult gatewayResult = paymentGateway.approve(command);

		// Gateway 실패: 전체 Rollback (실패 이력·상태 변경 없음)
		if (!gatewayResult.success()) {
			throw new BusinessException(ErrorCode.PAYMENT_GATEWAY_ERROR);
		}

		// 6. 상태 변경
		payment.markPaid(
				gatewayResult.approvedNo(),
				gatewayResult.approvedAt(),
				payAmount,
				gatewayResult.pgName(),
				gatewayResult.pgTransactionId(),
				card.getId()
		);
		order.markPaid();

		// 7. History
		paymentHistoryRepository.save(PaymentHistory.recordSuccess(
				payment,
				memberId,
				card.getId(),
				gatewayResult.approvedNo(),
				gatewayResult.pgName(),
				gatewayResult.pgTransactionId()
		));

		// 8. ActivityLog
		memberActivityLogRepository.save(MemberActivityLog.createPaymentCompleted(
				order.getMember(),
				order.getId(),
				order.getOrderNo()
		));

		// 9. Response (모든 변경 완료 후)
		return PaymentMapper.toResponse(payment, order);
	}

	@Override
	@Transactional(readOnly = true)
	public PaymentResponse getPayment(Long memberId, Long paymentId) {
		requireMemberId(memberId);
		Payment payment = paymentRepository.findByPaymentIdAndMemberId(paymentId, memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.PAYMENT_NOT_FOUND));
		return PaymentMapper.toResponse(payment, payment.getOrder());
	}

	@Override
	@Transactional(readOnly = true)
	public PaymentResponse getPaymentByOrderId(Long memberId, Long orderId) {
		requireMemberId(memberId);
		orderRepository.findByIdAndMember_Id(orderId, memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.ORDER_NOT_FOUND));
		Payment payment = paymentRepository.findByOrderIdAndMemberId(orderId, memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.PAYMENT_NOT_FOUND));
		return PaymentMapper.toResponse(payment, payment.getOrder());
	}

	private void validatePayment(Order order, Payment payment, MemberPaymentMethod card) {
		if (order.getOrderStatus() == OrderStatus.PAID) {
			throw new BusinessException(ErrorCode.ALREADY_PAID);
		}
		if (order.getOrderStatus() != OrderStatus.PENDING) {
			throw new BusinessException(ErrorCode.INVALID_PAYMENT_STATUS);
		}
		if (payment.isPaid()) {
			throw new BusinessException(ErrorCode.ALREADY_PAID);
		}
		if (payment.getStatus() != PaymentStatus.READY) {
			throw new BusinessException(ErrorCode.INVALID_PAYMENT_STATUS);
		}
		if (payment.getAmount() != order.getOrderAmount()) {
			throw new BusinessException(ErrorCode.PAYMENT_AMOUNT_MISMATCH);
		}
		validateCardStatus(card);
	}

	private void validateCardStatus(MemberPaymentMethod card) {
		if (card.getCardStatus() == CardStatus.EXPIRED) {
			throw new BusinessException(ErrorCode.CARD_EXPIRED);
		}
		if (card.getCardStatus() == CardStatus.BLOCKED) {
			throw new BusinessException(ErrorCode.CARD_BLOCKED);
		}
		if (card.getCardStatus() != CardStatus.ACTIVE) {
			throw new BusinessException(ErrorCode.CARD_NOT_FOUND);
		}
	}

	private void requireMemberId(Long memberId) {
		if (memberId == null) {
			throw new BusinessException(ErrorCode.UNAUTHORIZED);
		}
	}
}
