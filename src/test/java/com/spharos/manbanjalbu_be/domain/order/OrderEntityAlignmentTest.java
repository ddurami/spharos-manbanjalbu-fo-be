package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartHistory;
import com.spharos.manbanjalbu_be.domain.cart.enums.CartActionType;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberCoupon;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.CouponDiscountType;
import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
import com.spharos.manbanjalbu_be.domain.order.entity.Delivery;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Set;
import java.util.stream.Collectors;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Phase 0: DDL·엔티티 정합성 검증.
 */
class OrderEntityAlignmentTest {

	@Test
	void orderEntityMapsCoreColumns() {
		assertTableName(Order.class, "orders");
		assertHasColumn(Order.class, "orderNo");
		assertHasColumn(Order.class, "orderName");
		assertHasColumn(Order.class, "amount");
		assertHasColumn(Order.class, "deliveryFee");
		assertHasColumn(Order.class, "orderAmount");
		assertHasColumn(Order.class, "recipientName");
		assertHasColumn(Order.class, "recipientPhone");
		assertHasColumn(Order.class, "recipientZipcode");
		assertHasColumn(Order.class, "recipientBaseAddress");
		assertHasColumn(Order.class, "recipientDetailAddress");
		assertHasColumn(Order.class, "orderAt");
		assertHasColumn(Order.class, "deliveryMemo");
		assertHasColumn(Order.class, "memberAddress");
	}

	@Test
	void orderItemEntityMapsPriceSnapshotColumns() {
		assertTableName(OrderItem.class, "orders_item");
		assertHasColumn(OrderItem.class, "productName");
		assertHasColumn(OrderItem.class, "orderPrice");
		assertHasColumn(OrderItem.class, "discountPrice");
		assertHasColumn(OrderItem.class, "finalPrice");
		assertHasColumn(OrderItem.class, "quantity");
	}

	@Test
	void paymentEntityIsOrderPaymentNotMemberPaymentMethod() {
		assertTableName(Payment.class, "payment");
		assertTableName(MemberPaymentMethod.class, "member_payment_method");
		assertHasColumn(Payment.class, "paymentNo");
		assertHasColumn(Payment.class, "method");
		assertHasColumn(Payment.class, "status");
		assertHasColumn(Payment.class, "amount");
	}

	@Test
	void deliveryEntityMapsStatusColumns() {
		assertTableName(Delivery.class, "delivery");
		assertHasColumn(Delivery.class, "deliveryStatus");
	}

	@Test
	void cartHistoryStoresIdsWithoutProductOrCartItemForeignKey() {
		assertTableName(CartHistory.class, "cart_history");
		assertHasColumn(CartHistory.class, "cartItemId", Long.class);
		assertHasColumn(CartHistory.class, "productId", Long.class);
		assertThat(CartHistory.class.getDeclaredFields()).noneMatch(field ->
				field.isAnnotationPresent(ManyToOne.class)
						&& (field.getName().equals("cartItemId") || field.getName().equals("productId")));
		assertThat(Arrays.asList(CartActionType.values()))
				.contains(CartActionType.ORDER_COMPLETED);
	}

	@Test
	void memberCouponSupportsDiscountTypesFromDdl() {
		assertTableName(MemberCoupon.class, "member_coupon");
		assertThat(Arrays.asList(CouponDiscountType.values()))
				.containsExactlyInAnyOrder(
						CouponDiscountType.PERCENT,
						CouponDiscountType.FIXED,
						CouponDiscountType.FREE_SHIPPING
				);
	}

	@Test
	void memberPaymentMethodTypesAreSeparateFromOrderPaymentMethod() {
		assertThat(Arrays.asList(PaymentMethodType.values()))
				.containsExactlyInAnyOrder(PaymentMethodType.CARD, PaymentMethodType.BANK_ACCOUNT);
		assertThat(Arrays.asList(PaymentMethod.values()))
				.contains(
						PaymentMethod.CARD,
						PaymentMethod.MOBILE,
						PaymentMethod.EASY_PAY
				);
	}

	@Test
	void productEntityHasNoStockColumn() {
		Set<String> fieldNames = Arrays.stream(Product.class.getDeclaredFields())
				.map(Field::getName)
				.collect(Collectors.toSet());
		assertThat(fieldNames).doesNotContain("stock", "stockQuantity", "inventory");
	}

	@Test
	void mvpAmountFormulaMatchesFieldSpec() {
		OrderCreateFieldSpec.OrderAmounts amounts = OrderCreateFieldSpec.calculateMvpAmounts(55_000);
		assertThat(amounts.amount()).isEqualTo(55_000);
		assertThat(amounts.deliveryFee()).isZero();
		assertThat(amounts.orderAmount()).isEqualTo(55_000);
	}

	@Test
	void orderItemLineTotalUsesFinalPriceTimesQuantity() {
		var snapshot = OrderCreateFieldSpec.OrderItemPriceSnapshot.withoutDiscount(30_000, 2);
		assertThat(snapshot.orderPrice()).isEqualTo(30_000);
		assertThat(snapshot.discountPrice()).isZero();
		assertThat(snapshot.finalPrice()).isEqualTo(30_000);
		assertThat(snapshot.lineTotal()).isEqualTo(60_000);
	}

	private void assertTableName(Class<?> entityClass, String expectedTableName) {
		Table table = entityClass.getAnnotation(Table.class);
		assertThat(table).isNotNull();
		assertThat(table.name()).isEqualTo(expectedTableName);
	}

	private void assertHasColumn(Class<?> entityClass, String fieldName) {
		assertHasColumn(entityClass, fieldName, null);
	}

	private void assertHasColumn(Class<?> entityClass, String fieldName, Class<?> fieldType) {
		try {
			Field field = entityClass.getDeclaredField(fieldName);
			if (fieldType != null) {
				assertThat(field.getType()).isEqualTo(fieldType);
			}
			if (field.isAnnotationPresent(JoinColumn.class)) {
				return;
			}
			assertThat(field.isAnnotationPresent(Column.class))
					.as("%s.%s should have @Column or @JoinColumn", entityClass.getSimpleName(), fieldName)
					.isTrue();
		} catch (NoSuchFieldException exception) {
			throw new AssertionError("Missing field: " + entityClass.getSimpleName() + "." + fieldName, exception);
		}
	}

}
