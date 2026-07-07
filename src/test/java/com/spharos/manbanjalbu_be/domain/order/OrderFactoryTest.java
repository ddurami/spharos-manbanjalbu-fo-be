package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.order.entity.Delivery;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.DeliveryStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateCommand;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
import com.spharos.manbanjalbu_be.domain.order.support.OrderNameGenerator;
import com.spharos.manbanjalbu_be.domain.order.support.OrderNoGenerator;
import com.spharos.manbanjalbu_be.domain.order.support.PaymentNoGenerator;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Constructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

/**
 * Phase 2: 주문 애그리거트 팩토리·번호 생성기 단위 테스트.
 */
class OrderFactoryTest {

	@Test
	void orderNameGeneratorUsesSingleProductName() {
		assertThat(OrderNameGenerator.generate(List.of("아메리카노"))).isEqualTo("아메리카노");
	}

	@Test
	void orderNameGeneratorUsesFirstProductAndCountForMultipleItems() {
		assertThat(OrderNameGenerator.generate(List.of("아메리카노", "카페라떼", "쿠키")))
				.isEqualTo("아메리카노 외 2건");
	}

	@Test
	void orderNameGeneratorRejectsEmptyList() {
		assertThatThrownBy(() -> OrderNameGenerator.generate(List.of()))
				.isInstanceOf(IllegalArgumentException.class);
	}

	@Test
	void orderNoGeneratorProducesUniqueOrdPrefixedNumbers() {
		Set<String> existing = ConcurrentHashMap.newKeySet();
		OrderNoGenerator generator = new OrderNoGenerator(orderNo -> {
			boolean isNew = existing.add(orderNo);
			return !isNew;
		});

		String first = generator.generate();
		String second = generator.generate();

		assertThat(first).startsWith("ORD").hasSize("ORD".length() + "yyyyMMddHHmmss".length() + 4);
		assertThat(second).startsWith("ORD");
		assertThat(first).isNotEqualTo(second);
	}

	@Test
	void paymentNoGeneratorProducesUniquePayPrefixedNumbers() {
		Set<String> existing = ConcurrentHashMap.newKeySet();
		PaymentNoGenerator generator = new PaymentNoGenerator(paymentNo -> {
			boolean isNew = existing.add(paymentNo);
			return !isNew;
		});

		String first = generator.generate();
		String second = generator.generate();

		assertThat(first).startsWith("PAY");
		assertThat(second).startsWith("PAY");
		assertThat(first).isNotEqualTo(second);
	}

	@Test
	void orderCreateInitializesPendingOrderWithRecipientSnapshot() {
		Member member = Member.create("buyer", "encoded");
		MemberAddress address = MemberAddress.create(
				member,
				"집",
				"홍길동",
				"06234",
				"서울시 강남구",
				"101동",
				"010-1234-5678",
				null,
				null,
				true
		);
		LocalDateTime orderAt = LocalDateTime.of(2026, 7, 6, 10, 30);

		Order order = Order.create(new OrderCreateCommand(
				member,
				address,
				"ORD202607061030000001",
				"아메리카노 외 1건",
				OrderType.DELIVERY,
				OrderCategory.GENERAL,
				"문 앞에 놓아주세요",
				OrderCreateFieldSpec.toRecipientSnapshot(address),
				OrderCreateFieldSpec.calculateMvpAmounts(45_000),
				orderAt
		));

		assertThat(order.getMember()).isSameAs(member);
		assertThat(order.getMemberAddress()).isSameAs(address);
		assertThat(order.getOrderNo()).isEqualTo("ORD202607061030000001");
		assertThat(order.getOrderName()).isEqualTo("아메리카노 외 1건");
		assertThat(order.getOrderStatus()).isEqualTo(OrderStatus.PENDING);
		assertThat(order.getOrderType()).isEqualTo(OrderType.DELIVERY);
		assertThat(order.getOrderCategory()).isEqualTo(OrderCategory.GENERAL);
		assertThat(order.getDeliveryMemo()).isEqualTo("문 앞에 놓아주세요");
		assertThat(order.getAmount()).isEqualTo(45_000);
		assertThat(order.getDeliveryFee()).isZero();
		assertThat(order.getOrderAmount()).isEqualTo(45_000);
		assertThat(order.getRecipientName()).isEqualTo("홍길동");
		assertThat(order.getRecipientPhone()).isEqualTo("010-1234-5678");
		assertThat(order.getRecipientZipcode()).isEqualTo("06234");
		assertThat(order.getRecipientBaseAddress()).isEqualTo("서울시 강남구");
		assertThat(order.getRecipientDetailAddress()).isEqualTo("101동");
		assertThat(order.getOrderAt()).isEqualTo(orderAt);
	}

	@Test
	void orderItemCreateStoresPriceSnapshot() throws Exception {
		Product product = newProduct();
		var snapshot = OrderCreateFieldSpec.OrderItemPriceSnapshot.withoutDiscount(18_000, 2);

		OrderItem item = OrderItem.create(product, "콜드브루", snapshot);

		assertThat(item.getProduct()).isSameAs(product);
		assertThat(item.getProductName()).isEqualTo("콜드브루");
		assertThat(item.getOrderPrice()).isEqualTo(18_000);
		assertThat(item.getDiscountPrice()).isZero();
		assertThat(item.getFinalPrice()).isEqualTo(18_000);
		assertThat(item.getQuantity()).isEqualTo(2);
	}

	@Test
	void orderAggregateLinksItemsPaymentAndDelivery() throws Exception {
		Member member = Member.create("buyer", "encoded");
		MemberAddress address = MemberAddress.create(
				member,
				"집",
				"홍길동",
				"06234",
				"서울시 강남구",
				"101동",
				"010-1234-5678",
				null,
				null,
				true
		);

		Order order = Order.create(new OrderCreateCommand(
				member,
				address,
				"ORD202607061030000002",
				"아메리카노",
				OrderType.DELIVERY,
				OrderCategory.GENERAL,
				null,
				OrderCreateFieldSpec.toRecipientSnapshot(address),
				OrderCreateFieldSpec.calculateMvpAmounts(5_000),
				LocalDateTime.now()
		));

		OrderItem item = OrderItem.create(
				newProduct(),
				"아메리카노",
				OrderCreateFieldSpec.OrderItemPriceSnapshot.withoutDiscount(5_000, 1)
		);
		order.addItem(item);
		order.registerPayment("PAY202607061030000001", PaymentMethod.CARD, 5_000);
		order.registerDelivery();

		assertThat(order.getItems()).containsExactly(item);
		assertThat(item.getOrder()).isSameAs(order);

		Payment payment = order.getPayment();
		assertThat(payment.getOrder()).isSameAs(order);
		assertThat(payment.getPaymentNo()).isEqualTo("PAY202607061030000001");
		assertThat(payment.getMethod()).isEqualTo(PaymentMethod.CARD);
		assertThat(payment.getStatus()).isEqualTo(PaymentStatus.READY);
		assertThat(payment.getAmount()).isEqualTo(5_000);

		Delivery delivery = order.getDelivery();
		assertThat(delivery.getOrder()).isSameAs(order);
		assertThat(delivery.getDeliveryStatus()).isEqualTo(DeliveryStatus.READY);
	}

	private static Product newProduct() throws Exception {
		Constructor<Product> constructor = Product.class.getDeclaredConstructor();
		constructor.setAccessible(true);
		return constructor.newInstance();
	}

}
