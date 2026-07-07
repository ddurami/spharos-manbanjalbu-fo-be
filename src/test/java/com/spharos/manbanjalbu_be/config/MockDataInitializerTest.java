package com.spharos.manbanjalbu_be.config;

import com.spharos.manbanjalbu_be.domain.cart.repository.CartItemRepository;
import com.spharos.manbanjalbu_be.domain.cart.service.CartService;
import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberAddressRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.service.OrderService;
import com.spharos.manbanjalbu_be.domain.product.entity.Category;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductPolicy;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductPolicyRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class MockDataInitializerTest {

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private MemberAddressRepository memberAddressRepository;

	@Autowired
	private MemberPaymentMethodRepository memberPaymentMethodRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductPolicyRepository productPolicyRepository;

	@Autowired
	private CartService cartService;

	@Autowired
	private CartItemRepository cartItemRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private OrderService orderService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@BeforeEach
	void setUp() throws Exception {
		saveProduct("Mock 시드 상품", 15_800);
	}

	@Test
	void seedIfAbsentCreatesMockDataOnce() {
		MockDataInitializer.seedIfAbsent(
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

		Long memberId = memberRepository.findByLoginId(MockDataInitializer.LOGIN_ID).orElseThrow().getId();

		assertThat(memberPaymentMethodRepository.countByMember_IdAndMethodType(memberId, PaymentMethodType.CARD))
				.isEqualTo(3);
		assertThat(orderRepository.countByMember_IdAndOrderStatus(memberId, OrderStatus.PENDING))
				.isEqualTo(MockDataInitializer.TARGET_PENDING_ORDERS);

		MockDataInitializer.seedIfAbsent(
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

		assertThat(memberPaymentMethodRepository.countByMember_IdAndMethodType(memberId, PaymentMethodType.CARD))
				.isEqualTo(3);
		assertThat(orderRepository.countByMember_IdAndOrderStatus(memberId, OrderStatus.PENDING))
				.isEqualTo(MockDataInitializer.TARGET_PENDING_ORDERS);
	}

	private Product saveProduct(String name, int price) throws Exception {
		Category category = newEntity(Category.class);
		setField(category, "name", "MD");
		setField(category, "depth", 1);
		category = categoryRepository.save(category);

		ProductPolicy policy = newEntity(ProductPolicy.class);
		setField(policy, "title", "기본 정책");
		setField(policy, "deliveryInfo", "배송 안내");
		setField(policy, "exchangeInfo", "교환 안내");
		setField(policy, "refundInfo", "환불 안내");
		policy = productPolicyRepository.save(policy);

		Product product = newEntity(Product.class);
		setField(product, "category", category);
		setField(product, "policy", policy);
		setField(product, "name", name);
		setField(product, "price", price);
		setField(product, "status", ProductStatus.ON_SALE);
		return productRepository.save(product);
	}

	private static <T> T newEntity(Class<T> type) throws Exception {
		Constructor<T> constructor = type.getDeclaredConstructor();
		constructor.setAccessible(true);
		return constructor.newInstance();
	}

	private static void setField(Object target, String fieldName, Object value) throws Exception {
		Field field = target.getClass().getDeclaredField(fieldName);
		field.setAccessible(true);
		field.set(target, value);
	}
}
