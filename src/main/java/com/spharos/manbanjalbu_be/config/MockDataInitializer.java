package com.spharos.manbanjalbu_be.config;

import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartAddRequest;
import com.spharos.manbanjalbu_be.domain.cart.repository.CartItemRepository;
import com.spharos.manbanjalbu_be.domain.cart.service.CartService;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberProfile;
import com.spharos.manbanjalbu_be.domain.member.enums.CardType;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberAddressRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.order.dto.request.OrderCreateRequest;
import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderCreateResponse;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.repository.PaymentRepository;
import com.spharos.manbanjalbu_be.domain.order.service.OrderService;
import com.spharos.manbanjalbu_be.domain.payment.dto.request.PaymentCreateRequest;
import com.spharos.manbanjalbu_be.domain.payment.service.PaymentService;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * 로컬 개발용 Mock 결제 테스트 데이터 시드.
 * 운영 API 동작을 변경하지 않으며, local 프로필에서만 실행된다.
 */
@Configuration
@Profile("local")
public class MockDataInitializer {

	private static final Logger log = LoggerFactory.getLogger(MockDataInitializer.class);

	static final String LOGIN_ID = "payment-test";
	static final String PASSWORD = "Payment1!";
	static final String SEED_ADDRESS_NAME = "Mock 결제 테스트";
	static final String SALES_SEED_ADDRESS_NAME = "Mock 총판매 시드 배송지";
	static final int TARGET_PENDING_ORDERS = 3;

	private static final List<MockCardSpec> MOCK_CARDS = List.of(
			new MockCardSpec("스타벅스 카드", "스타벅스", CardType.VISA, "**** **** **** 1234", "1234", true),
			new MockCardSpec("신한 VISA", "신한", CardType.VISA, "**** **** **** 5678", "5678", false),
			new MockCardSpec("삼성 MASTER", "삼성", CardType.MASTER, "**** **** **** 9012", "9012", false)
	);

	private static final int[] TARGET_ORDER_AMOUNTS = {15_800, 32_000, 55_000};
	private static final int[] SALES_SEED_AMOUNTS = {15_800, 32_000, 55_000, 78_000, 99_000};

	@Bean
	CommandLineRunner initMockPaymentData(
			MemberRepository memberRepository,
			MemberAddressRepository memberAddressRepository,
			MemberPaymentMethodRepository memberPaymentMethodRepository,
			ProductRepository productRepository,
			CartService cartService,
			CartItemRepository cartItemRepository,
			OrderRepository orderRepository,
			OrderService orderService,
			PaymentService paymentService,
			PaymentRepository paymentRepository,
			PasswordEncoder passwordEncoder
	) {
		return args -> {
			seedIfAbsent(
					memberRepository,
					memberAddressRepository,
					memberPaymentMethodRepository,
					productRepository,
					cartService,
					cartItemRepository,
					orderRepository,
					orderService,
					passwordEncoder
			);
			seedPaidSalesIfAbsent(
					memberRepository,
					memberAddressRepository,
					memberPaymentMethodRepository,
					productRepository,
					cartService,
					cartItemRepository,
					orderService,
					paymentService,
					paymentRepository
			);
		};
	}

	static void seedIfAbsent(
			MemberRepository memberRepository,
			MemberAddressRepository memberAddressRepository,
			MemberPaymentMethodRepository memberPaymentMethodRepository,
			ProductRepository productRepository,
			CartService cartService,
			CartItemRepository cartItemRepository,
			OrderRepository orderRepository,
			OrderService orderService,
			PasswordEncoder passwordEncoder
	) {
		Member member = findOrCreateMember(memberRepository, passwordEncoder);
		createMockCardsIfAbsent(member, memberPaymentMethodRepository);
		MemberAddress address = findOrCreateAddress(member, memberAddressRepository);
		createPendingOrdersIfAbsent(
				member,
				address,
				productRepository,
				cartService,
				cartItemRepository,
				orderRepository,
				orderService
		);
		ensureLocalDevCardsForMembersWithoutCards(memberRepository, memberPaymentMethodRepository);
	}

	private static void ensureLocalDevCardsForMembersWithoutCards(
			MemberRepository memberRepository,
			MemberPaymentMethodRepository memberPaymentMethodRepository
	) {
		for (Member member : memberRepository.findAll()) {
			if (memberPaymentMethodRepository.findActiveCardsByMemberId(member.getId()).isEmpty()) {
				createMockCardsIfAbsent(member, memberPaymentMethodRepository);
			}
		}
	}

	private static Member findOrCreateMember(MemberRepository memberRepository, PasswordEncoder passwordEncoder) {
		Optional<Member> existing = memberRepository.findByLoginId(LOGIN_ID);
		if (existing.isPresent()) {
			return existing.get();
		}

		Member member = Member.create(LOGIN_ID, passwordEncoder.encode(PASSWORD));
		MemberProfile profile = MemberProfile.create(
				member,
				"결제테스트",
				"payment-test",
				"payment-test@local.mock",
				"01099990001",
				LocalDate.of(1990, 1, 1)
		);
		member.attachProfile(profile);
		Member saved = memberRepository.save(member);
		log.info("Mock 결제 테스트 회원 생성: loginId={}", LOGIN_ID);
		return saved;
	}

	private static void createMockCardsIfAbsent(
			Member member,
			MemberPaymentMethodRepository memberPaymentMethodRepository
	) {
		for (MockCardSpec cardSpec : MOCK_CARDS) {
			if (memberPaymentMethodRepository.existsByMember_IdAndCardName(member.getId(), cardSpec.cardName())) {
				continue;
			}

			memberPaymentMethodRepository.save(MemberPaymentMethod.createMockCard(
					member,
					cardSpec.cardName(),
					cardSpec.cardCompany(),
					cardSpec.cardType(),
					cardSpec.maskedNumber(),
					cardSpec.last4(),
					null,
					cardSpec.isDefault()
			));
			log.info("Mock 결제 카드 생성: memberId={}, cardName={}", member.getId(), cardSpec.cardName());
		}
	}

	private static MemberAddress findOrCreateAddress(Member member, MemberAddressRepository memberAddressRepository) {
		return memberAddressRepository.findByMember_IdAndAddressName(member.getId(), SEED_ADDRESS_NAME)
				.orElseGet(() -> {
					MemberAddress address = MemberAddress.create(
							member,
							SEED_ADDRESS_NAME,
							"결제테스트",
							"06236",
							"서울특별시 강남구 테헤란로",
							"Mock 101호",
							"01099990001",
							null,
							"Mock 결제 테스트 배송지",
							true
					);
					MemberAddress saved = memberAddressRepository.save(address);
					log.info("Mock 결제 테스트 배송지 생성: memberId={}, addressId={}", member.getId(), saved.getId());
					return saved;
				});
	}

	private static void createPendingOrdersIfAbsent(
			Member member,
			MemberAddress address,
			ProductRepository productRepository,
			CartService cartService,
			CartItemRepository cartItemRepository,
			OrderRepository orderRepository,
			OrderService orderService
	) {
		long pendingCount = orderRepository.countByMember_IdAndOrderStatus(member.getId(), OrderStatus.PENDING);
		if (pendingCount >= TARGET_PENDING_ORDERS) {
			return;
		}

		Optional<Product> productOptional = productRepository.findFirstByStatusOrderByIdAsc(ProductStatus.ON_SALE);
		if (productOptional.isEmpty()) {
			log.warn("Mock 미결제 주문 생성 생략: ON_SALE 상품이 없습니다. loginId={}", LOGIN_ID);
			return;
		}

		Product product = productOptional.get();
		int remaining = TARGET_PENDING_ORDERS - (int) pendingCount;

		for (int index = 0; index < remaining; index++) {
			int amountIndex = (int) pendingCount + index;
			int targetAmount = TARGET_ORDER_AMOUNTS[Math.min(amountIndex, TARGET_ORDER_AMOUNTS.length - 1)];
			int quantity = calculateQuantity(product.getPrice(), targetAmount);

			cartService.addCartItem(member.getId(), new CartAddRequest(product.getId(), quantity));

			Long cartItemId = cartItemRepository.findByMemberIdAndProductId(member.getId(), product.getId())
					.orElseThrow(() -> new IllegalStateException("Mock 장바구니 아이템 생성 실패"))
					.getId();

			orderService.createOrder(
					member.getId(),
					new OrderCreateRequest(
							List.of(cartItemId),
							address.getId(),
							PaymentMethod.CARD,
							"Mock 결제 테스트 주문",
							null,
							null,
							null,
							null
					)
			);
			log.info(
					"Mock 미결제 주문 생성: memberId={}, productId={}, quantity={}, targetAmount={}",
					member.getId(),
					product.getId(),
					quantity,
					targetAmount
			);
		}
	}

	static void seedPaidSalesIfAbsent(
			MemberRepository memberRepository,
			MemberAddressRepository memberAddressRepository,
			MemberPaymentMethodRepository memberPaymentMethodRepository,
			ProductRepository productRepository,
			CartService cartService,
			CartItemRepository cartItemRepository,
			OrderService orderService,
			PaymentService paymentService,
			PaymentRepository paymentRepository
	) {
		Optional<Product> productOptional = productRepository.findFirstByStatusOrderByIdAsc(ProductStatus.ON_SALE);
		if (productOptional.isEmpty()) {
			log.warn("Mock 총판매금액 시드 생략: ON_SALE 상품이 없습니다.");
			return;
		}

		Product product = productOptional.get();
		int seededCount = 0;

		for (Member member : memberRepository.findAll()) {
			if (hasPaidOrder(member.getId(), paymentRepository)) {
				continue;
			}

			List<MemberPaymentMethod> cards = memberPaymentMethodRepository.findActiveCardsByMemberId(member.getId());
			if (cards.isEmpty()) {
				log.warn("Mock 총판매금액 시드 생략: 활성 카드 없음 memberId={}", member.getId());
				continue;
			}

			MemberAddress address = findOrCreateSalesSeedAddress(member, memberAddressRepository);
			int targetAmount = SALES_SEED_AMOUNTS[(int) (member.getId() % SALES_SEED_AMOUNTS.length)];
			int quantity = calculateQuantity(product.getPrice(), targetAmount);

			cartService.addCartItem(member.getId(), new CartAddRequest(product.getId(), quantity));

			Long cartItemId = cartItemRepository.findByMemberIdAndProductId(member.getId(), product.getId())
					.orElseThrow(() -> new IllegalStateException("Mock 총판매 시드 장바구니 생성 실패"))
					.getId();

			OrderCreateResponse order = orderService.createOrder(
					member.getId(),
					new OrderCreateRequest(
							List.of(cartItemId),
							address.getId(),
							PaymentMethod.CARD,
							"Mock 총판매금액 시드 주문",
							null,
							null,
							null,
							null
					)
			);

			paymentService.pay(
					member.getId(),
					new PaymentCreateRequest(order.orderNo(), cards.get(0).getId())
			);
			seededCount++;
		}

		if (seededCount > 0) {
			log.info(
					"Mock 총판매금액 시드 완료: paidOrderCount={}, totalPaidAmount={}",
					seededCount,
					paymentRepository.sumTotalPaidAmount()
			);
		}
	}

	private static boolean hasPaidOrder(Long memberId, PaymentRepository paymentRepository) {
		return paymentRepository.countByMemberIdAndMethodAndStatus(
				memberId,
				PaymentMethod.CARD,
				PaymentStatus.PAID
		) > 0;
	}

	private static MemberAddress findOrCreateSalesSeedAddress(
			Member member,
			MemberAddressRepository memberAddressRepository
	) {
		Optional<MemberAddress> existing = memberAddressRepository.findByMember_IdAndAddressName(
				member.getId(),
				SALES_SEED_ADDRESS_NAME
		);
		if (existing.isPresent()) {
			return existing.get();
		}

		Optional<MemberAddress> defaultAddress = memberAddressRepository.findFirstByMember_IdAndIsDefaultTrue(member.getId());
		if (defaultAddress.isPresent()) {
			return defaultAddress.get();
		}

		if (!memberAddressRepository.findByMember_IdOrderByIsDefaultDescCreatedAtDesc(member.getId()).isEmpty()) {
			return memberAddressRepository.findByMember_IdOrderByIsDefaultDescCreatedAtDesc(member.getId()).get(0);
		}

		String recipientName = member.getLoginId();
		String phone = String.format("010%08d", member.getId() % 100_000_000L);

		MemberAddress address = MemberAddress.create(
				member,
				SALES_SEED_ADDRESS_NAME,
				recipientName,
				"06236",
				"서울특별시 강남구 테헤란로",
				"Mock 101호",
				phone,
				null,
				"Mock 총판매금액 시드 배송지",
				true
		);
		MemberAddress saved = memberAddressRepository.save(address);
		log.info("Mock 총판매 시드 배송지 생성: memberId={}, addressId={}", member.getId(), saved.getId());
		return saved;
	}

	private static int calculateQuantity(int productPrice, int targetAmount) {
		if (productPrice <= 0) {
			return 1;
		}
		int quantity = (targetAmount + productPrice - 1) / productPrice;
		return Math.min(20, Math.max(1, quantity));
	}

	private record MockCardSpec(
			String cardName,
			String cardCompany,
			CardType cardType,
			String maskedNumber,
			String last4,
			boolean isDefault
	) {
	}
}
