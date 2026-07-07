package com.spharos.manbanjalbu_be.domain.payment;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.CardStatus;
import com.spharos.manbanjalbu_be.domain.member.enums.CardType;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberAddressRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.repository.PaymentRepository;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateCommand;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
import com.spharos.manbanjalbu_be.domain.payment.entity.MemberActivityLog;
import com.spharos.manbanjalbu_be.domain.payment.entity.PaymentHistory;
import com.spharos.manbanjalbu_be.domain.payment.enums.MemberActivityType;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentHistoryStatus;
import com.spharos.manbanjalbu_be.domain.payment.repository.MemberActivityLogRepository;
import com.spharos.manbanjalbu_be.domain.payment.repository.PaymentHistoryRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;
import jakarta.persistence.EntityManager;

import java.time.LocalDateTime;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class PaymentRepositoryIntegrationTest {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private MemberAddressRepository memberAddressRepository;

	@Autowired
	private EntityManager entityManager;

	@Autowired
	private MemberPaymentMethodRepository memberPaymentMethodRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private PaymentRepository paymentRepository;

	@Autowired
	private PaymentHistoryRepository paymentHistoryRepository;

	@Autowired
	private MemberActivityLogRepository memberActivityLogRepository;

	private Member member;
	private Member otherMember;

	@BeforeEach
	void setUp() {
		member = memberRepository.save(Member.create("payrepo1", "encoded"));
		otherMember = memberRepository.save(Member.create("payrepo2", "encoded"));
	}

	@Test
	void findActiveCardsByMemberIdReturnsOnlyActiveCards() {
		memberPaymentMethodRepository.save(MemberPaymentMethod.createMockCard(
				member, "스타벅스 카드", "스타벅스", CardType.VISA,
				"**** **** **** 1234", "1234", null, true
		));
		MemberPaymentMethod blocked = MemberPaymentMethod.createMockCard(
				member, "신한 VISA", "신한", CardType.VISA,
				"**** **** **** 5678", "5678", null, false
		);
		blocked.markBlocked();
		memberPaymentMethodRepository.save(blocked);
		MemberPaymentMethod deleted = MemberPaymentMethod.createMockCard(
				member, "삭제 카드", "삼성", CardType.MASTER,
				"**** **** **** 9999", "9999", null, false
		);
		deleted.markDeleted();
		memberPaymentMethodRepository.save(deleted);

		List<MemberPaymentMethod> activeCards = memberPaymentMethodRepository.findActiveCardsByMemberId(member.getId());

		assertThat(activeCards).hasSize(1);
		assertThat(activeCards.get(0).getCardName()).isEqualTo("스타벅스 카드");
	}

	@Test
	void findVisibleCardByIdAndMemberIdExcludesDeletedCard() {
		MemberPaymentMethod expired = memberPaymentMethodRepository.save(MemberPaymentMethod.createMockCard(
				member, "만료 카드", "현대", CardType.MASTER,
				"**** **** **** 1111", "1111", null, false
		));
		expired.markExpired();
		memberPaymentMethodRepository.save(expired);

		assertThat(memberPaymentMethodRepository.findVisibleCardByIdAndMemberId(expired.getId(), member.getId()))
				.isPresent();

		MemberPaymentMethod deleted = memberPaymentMethodRepository.save(MemberPaymentMethod.createMockCard(
				member, "삭제 카드", "삼성", CardType.MASTER,
				"**** **** **** 2222", "2222", null, false
		));
		deleted.markDeleted();
		memberPaymentMethodRepository.save(deleted);

		assertThat(memberPaymentMethodRepository.findVisibleCardByIdAndMemberId(deleted.getId(), member.getId()))
				.isEmpty();
	}

	@Test
	void findByOrderNoForUpdateAndMemberScopedPaymentQueries() {
		Order order = savePendingOrder(member, "ORD20260707120000001", 15_800);
		Payment payment = order.getPayment();

		assertThat(paymentRepository.findByOrderNoForUpdate(order.getOrderNo()))
				.isPresent()
				.get()
				.extracting(Payment::getPaymentId)
				.isEqualTo(payment.getPaymentId());

		assertThat(paymentRepository.findByOrderNoAndMemberId(order.getOrderNo(), member.getId()))
				.isPresent();
		assertThat(paymentRepository.findByOrderNoAndMemberId(order.getOrderNo(), otherMember.getId()))
				.isEmpty();

		assertThat(paymentRepository.findByPaymentIdAndMemberId(payment.getPaymentId(), member.getId()))
				.isPresent();
		assertThat(paymentRepository.findByOrderIdAndMemberId(order.getId(), member.getId()))
				.isPresent();

		assertThat(orderRepository.findByOrderNoAndMember_Id(order.getOrderNo(), member.getId()))
				.isPresent();
		assertThat(orderRepository.findByIdAndMember_Id(order.getId(), member.getId()))
				.isPresent();
	}

	@Test
	void paymentHistoryAndActivityLogRepositoriesPersistRecords() {
		Order order = savePendingOrder(member, "ORD20260707120000002", 20_000);
		Payment payment = order.getPayment();

		PaymentHistory history = paymentHistoryRepository.save(
				PaymentHistory.recordReady(payment, member.getId())
		);
		MemberActivityLog activityLog = memberActivityLogRepository.save(
				MemberActivityLog.createPaymentCompleted(member, order.getId(), order.getOrderNo())
		);

		assertThat(paymentHistoryRepository.findByPayment_PaymentIdOrderByCreatedAtAsc(payment.getPaymentId()))
				.hasSize(1)
				.first()
				.extracting(PaymentHistory::getHistoryStatus)
				.isEqualTo(PaymentHistoryStatus.READY);

		assertThat(paymentHistoryRepository.countByPayment_PaymentIdAndHistoryStatus(
				payment.getPaymentId(), PaymentHistoryStatus.READY)).isEqualTo(1);

		assertThat(memberActivityLogRepository.findByMember_IdAndActivityTypeOrderByCreatedAtDesc(
				member.getId(), MemberActivityType.PAYMENT_COMPLETED))
				.hasSize(1)
				.first()
				.extracting(MemberActivityLog::getReferenceId)
				.isEqualTo(order.getId());

		assertThat(history.getOrderId()).isEqualTo(order.getId());
		assertThat(activityLog.getMessage()).contains(order.getOrderNo());
	}

	private Order savePendingOrder(Member orderMember, String orderNo, int amount) {
		MemberAddress address = memberAddressRepository.save(MemberAddress.create(
				orderMember,
				"집",
				"홍길동",
				"06236",
				"서울 강남구",
				"101호",
				"01012345678",
				null,
				null,
				true
		));

		Order order = Order.create(new OrderCreateCommand(
				orderMember,
				address,
				orderNo,
				"테스트 주문",
				OrderType.DELIVERY,
				OrderCategory.GENERAL,
				null,
				OrderCreateFieldSpec.toRecipientSnapshot(address),
				OrderCreateFieldSpec.calculateMvpAmounts(amount),
				LocalDateTime.now()
		));
		order.registerPayment("PAY" + orderNo.substring(3), PaymentMethod.CARD, amount);
		order.registerDelivery();
		Order saved = orderRepository.save(order);
		entityManager.flush();
		return saved;
	}
}
