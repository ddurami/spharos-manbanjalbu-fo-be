package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.order.enums.DeliveryStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;

/**
 * Phase 0 산출물: 주문 생성 시 DB/JPA 엔티티에 채워야 하는 필드·매핑·초기값 명세.
 * <p>
 * DDL 기준 테이블: orders, orders_item, payment, delivery, cart_history, member_coupon
 * payment(주문 결제 이력) ≠ member_payment_method(마이페이지 등록 결제수단)
 */
public final class OrderCreateFieldSpec {

	private OrderCreateFieldSpec() {
	}

	public static final OrderStatus INITIAL_ORDER_STATUS = OrderStatus.PENDING;
	public static final OrderType DEFAULT_ORDER_TYPE = OrderType.DELIVERY;
	public static final OrderCategory DEFAULT_ORDER_CATEGORY = OrderCategory.GENERAL;
	public static final PaymentStatus INITIAL_PAYMENT_STATUS = PaymentStatus.READY;
	public static final DeliveryStatus INITIAL_DELIVERY_STATUS = DeliveryStatus.READY;
	public static final int RESERVATION_MONTHS_LIMIT = 3;

	/**
	 * member_address → orders 배송지 스냅샷 매핑.
	 * 주문 후 배송지 변경/삭제와 무관하게 orders.recipient_* 컬럼에 복사한다.
	 */
	public static RecipientSnapshot toRecipientSnapshot(MemberAddress address) {
		return new RecipientSnapshot(
				address.getRecipientName(),
				address.getPhone1(),
				address.getZipcode(),
				address.getBaseAddress(),
				address.getDetailAddress()
		);
	}

	/**
	 * MVP 금액 계산 (쿠폰·배송비 미적용).
	 * <ul>
	 *   <li>orders.amount = Σ(final_price × quantity)</li>
	 *   <li>orders.delivery_fee = 0</li>
	 *   <li>orders.order_amount = amount + delivery_fee - orderLevelDiscount</li>
	 *   <li>orders_item: discount_price=0, final_price=order_price</li>
	 * </ul>
	 */
	public static OrderAmounts calculateMvpAmounts(int productAmount) {
		int deliveryFee = 0;
		int orderAmount = productAmount + deliveryFee;
		return new OrderAmounts(productAmount, deliveryFee, orderAmount);
	}

	public record RecipientSnapshot(
			String recipientName,
			String recipientPhone,
			String recipientZipcode,
			String recipientBaseAddress,
			String recipientDetailAddress
	) {
	}

	public record OrderAmounts(
			int amount,
			int deliveryFee,
			int orderAmount
	) {
	}

	public record OrderItemPriceSnapshot(
			int orderPrice,
			int discountPrice,
			int finalPrice,
			int quantity
	) {
		public static OrderItemPriceSnapshot withoutDiscount(int unitPrice, int quantity) {
			return new OrderItemPriceSnapshot(unitPrice, 0, unitPrice, quantity);
		}

		public int lineTotal() {
			return finalPrice * quantity;
		}
	}

}
