package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.response.MypageInfoItemResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MypagePaymentMethodResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MypageShoppingInfoResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MypageSummaryResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberProfile;
import com.spharos.manbanjalbu_be.domain.member.enums.MemberStatus;
import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberAddressRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberCouponRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCancelStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderCancelRepository;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Set;

@Service
@Transactional(readOnly = true)
public class MemberMypageService {

	private static final Set<OrderStatus> EXCLUDED_ORDER_STATUSES = Set.of(
			OrderStatus.CANCELLED,
			OrderStatus.REFUNDED
	);
	private static final DateTimeFormatter DATE_FORMAT = DateTimeFormatter.ofPattern("yyyy.MM.dd");

	private final MemberRepository memberRepository;
	private final OrderRepository orderRepository;
	private final OrderCancelRepository orderCancelRepository;
	private final MemberAddressRepository memberAddressRepository;
	private final MemberPaymentMethodRepository memberPaymentMethodRepository;
	private final MemberCouponRepository memberCouponRepository;

	public MemberMypageService(
			MemberRepository memberRepository,
			OrderRepository orderRepository,
			OrderCancelRepository orderCancelRepository,
			MemberAddressRepository memberAddressRepository,
			MemberPaymentMethodRepository memberPaymentMethodRepository,
			MemberCouponRepository memberCouponRepository
	) {
		this.memberRepository = memberRepository;
		this.orderRepository = orderRepository;
		this.orderCancelRepository = orderCancelRepository;
		this.memberAddressRepository = memberAddressRepository;
		this.memberPaymentMethodRepository = memberPaymentMethodRepository;
		this.memberCouponRepository = memberCouponRepository;
	}

	public MypageSummaryResponse getSummary(Long memberId) {
		Member member = getActiveMember(memberId);
		MemberProfile profile = member.getProfile();
		if (profile == null) {
			throw new BusinessException(ErrorCode.MEMBER_NOT_FOUND);
		}

		return new MypageSummaryResponse(
				profile.getName(),
				buildShoppingInfo(memberId),
				buildPaymentMethods(memberId)
		);
	}

	private MypageShoppingInfoResponse buildShoppingInfo(Long memberId) {
		return new MypageShoppingInfoResponse(
				buildOrderHistoryItem(memberId),
				buildOrderCancellationItem(memberId),
				buildDeliveryReservationItem(memberId),
				buildDeliveryAddressItem(memberId)
		);
	}

	private MypagePaymentMethodResponse buildPaymentMethods(Long memberId) {
		return new MypagePaymentMethodResponse(
				buildCreditCardItem(memberId),
				buildBankAccountItem(memberId),
				buildCouponItem(memberId)
		);
	}

	private MypageInfoItemResponse buildOrderHistoryItem(Long memberId) {
		long count = orderRepository.countByMember_IdAndOrderStatusNotIn(memberId, EXCLUDED_ORDER_STATUSES);
		String summary = orderRepository
				.findFirstByMember_IdAndOrderStatusNotInOrderByOrderAtDesc(memberId, EXCLUDED_ORDER_STATUSES)
				.map(order -> "최근 주문 " + order.getOrderAt().toLocalDate().format(DATE_FORMAT))
				.orElse(null);
		return toInfoItem(count, summary);
	}

	private MypageInfoItemResponse buildOrderCancellationItem(Long memberId) {
		long count = orderCancelRepository.countByMemberIdAndCancelStatus(
				memberId,
				OrderCancelStatus.COMPLETED
		);
		String summary = orderCancelRepository
				.findFirstByOrder_Member_IdAndCancelStatusOrderByCancelledAtDesc(
						memberId,
						OrderCancelStatus.COMPLETED
				)
				.map(cancel -> "최근 취소 " + cancel.getCancelledAt().toLocalDate().format(DATE_FORMAT))
				.orElse(null);
		return toInfoItem(count, summary);
	}

	private MypageInfoItemResponse buildDeliveryReservationItem(Long memberId) {
		long count = orderRepository.countByMember_IdAndOrderType(memberId, OrderType.RESERVATION);
		String summary = orderRepository
				.findFirstByMember_IdAndOrderTypeOrderByOrderAtDesc(memberId, OrderType.RESERVATION)
				.map(this::formatReservationSummary)
				.orElse(null);
		return toInfoItem(count, summary);
	}

	private MypageInfoItemResponse buildDeliveryAddressItem(Long memberId) {
		long count = memberAddressRepository.countByMember_Id(memberId);
		String summary = memberAddressRepository.findFirstByMember_IdAndIsDefaultTrue(memberId)
				.or(() -> memberAddressRepository.findByMember_IdOrderByIsDefaultDescCreatedAtDesc(memberId)
						.stream()
						.findFirst())
				.map(address -> "기본 배송지: " + address.getBaseAddress())
				.orElse(null);
		return toInfoItem(count, summary);
	}

	private MypageInfoItemResponse buildCreditCardItem(Long memberId) {
		List<MemberPaymentMethod> cards = memberPaymentMethodRepository
				.findByMember_IdAndMethodTypeOrderByIsDefaultDescCreatedAtDesc(memberId, PaymentMethodType.CARD);
		long count = cards.size();
		String summary = null;
		if (!cards.isEmpty()) {
			MemberPaymentMethod first = cards.get(0);
			summary = count > 1
					? first.getCardName() + " 외 " + (count - 1) + "건"
					: first.getDisplayLabel();
		}
		return toInfoItem(count, summary);
	}

	private MypageInfoItemResponse buildBankAccountItem(Long memberId) {
		List<MemberPaymentMethod> accounts = memberPaymentMethodRepository
				.findByMember_IdAndMethodTypeOrderByIsDefaultDescCreatedAtDesc(
						memberId,
						PaymentMethodType.BANK_ACCOUNT
				);
		long count = accounts.size();
		String summary = accounts.isEmpty()
				? null
				: accounts.get(0).getDisplayLabel();
		return toInfoItem(count, summary);
	}

	private MypageInfoItemResponse buildCouponItem(Long memberId) {
		long count = memberCouponRepository.countByMember_IdAndIsUsedFalse(memberId);
		String summary = count > 0 ? "사용 가능 " + count + "장" : null;
		return toInfoItem(count, summary);
	}

	private String formatReservationSummary(Order order) {
		if (order.getReservationDeliveryDate() != null) {
			return "다음 배송 " + order.getReservationDeliveryDate().format(DATE_FORMAT);
		}
		return order.getOrderName();
	}

	private MypageInfoItemResponse toInfoItem(long count, String summary) {
		return new MypageInfoItemResponse((int) count, count > 0 ? summary : null);
	}

	private Member getActiveMember(Long memberId) {
		Member member = memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));

		if (member.getStatus() == MemberStatus.WITHDRAWN) {
			throw new BusinessException(ErrorCode.MEMBER_ALREADY_WITHDRAWN);
		}
		if (member.getStatus() != MemberStatus.ACTIVE) {
			throw new BusinessException(ErrorCode.MEMBER_INACTIVE);
		}
		return member;
	}
}
