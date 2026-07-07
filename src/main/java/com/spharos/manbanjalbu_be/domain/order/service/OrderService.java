package com.spharos.manbanjalbu_be.domain.order.service;

import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartDeleteRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.response.CartCheckoutResponse;
import com.spharos.manbanjalbu_be.domain.cart.dto.response.CartItemResponse;
import com.spharos.manbanjalbu_be.domain.cart.entity.CartItem;
import com.spharos.manbanjalbu_be.domain.cart.repository.CartItemRepository;
import com.spharos.manbanjalbu_be.domain.cart.service.CartService;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberAddressRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.order.dto.request.OrderCreateRequest;
import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderCreateResponse;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.entity.OrderItem;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateCommand;
import com.spharos.manbanjalbu_be.domain.order.support.OrderCreateFieldSpec;
import com.spharos.manbanjalbu_be.domain.order.support.OrderNameGenerator;
import com.spharos.manbanjalbu_be.domain.order.support.OrderNoGenerator;
import com.spharos.manbanjalbu_be.domain.order.support.PaymentNoGenerator;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderService {

	private final CartService cartService;
	private final CartItemRepository cartItemRepository;
	private final MemberRepository memberRepository;
	private final MemberAddressRepository memberAddressRepository;
	private final OrderRepository orderRepository;
	private final OrderNoGenerator orderNoGenerator;
	private final PaymentNoGenerator paymentNoGenerator;

	public OrderService(
			CartService cartService,
			CartItemRepository cartItemRepository,
			MemberRepository memberRepository,
			MemberAddressRepository memberAddressRepository,
			OrderRepository orderRepository,
			OrderNoGenerator orderNoGenerator,
			PaymentNoGenerator paymentNoGenerator
	) {
		this.cartService = cartService;
		this.cartItemRepository = cartItemRepository;
		this.memberRepository = memberRepository;
		this.memberAddressRepository = memberAddressRepository;
		this.orderRepository = orderRepository;
		this.orderNoGenerator = orderNoGenerator;
		this.paymentNoGenerator = paymentNoGenerator;
	}

	public OrderCreateResponse createOrder(Long memberId, OrderCreateRequest request) {
		if (memberId == null) {
			throw new BusinessException(ErrorCode.UNAUTHORIZED);
		}

		OrderType orderType = resolveOrderType(request.orderType());
		OrderCategory orderCategory = resolveOrderCategory(request.orderCategory());

		CartCheckoutResponse checkout = cartService.getCheckoutItems(
				memberId,
				new CartDeleteRequest(request.cartItemIds())
		);

		Member member = memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));

		MemberAddress memberAddress = memberAddressRepository
				.findByIdAndMember_Id(request.memberAddressId(), memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_ADDRESS_NOT_FOUND));

		List<CartItem> cartItems = loadCartItemsInRequestOrder(memberId, request.cartItemIds());
		OrderCreateFieldSpec.OrderAmounts amounts =
				OrderCreateFieldSpec.calculateMvpAmounts(checkout.productAmount());

		String orderNo = orderNoGenerator.generate();
		String paymentNo = paymentNoGenerator.generate();
		List<String> productNames = checkout.cartItems().stream()
				.map(CartItemResponse::productName)
				.toList();
		String orderName = OrderNameGenerator.generate(productNames);

		Order order = Order.create(new OrderCreateCommand(
				member,
				memberAddress,
				orderNo,
				orderName,
				orderType,
				orderCategory,
				resolveDeliveryMemo(request.deliveryMemo(), memberAddress),
				OrderCreateFieldSpec.toRecipientSnapshot(memberAddress),
				amounts,
				LocalDateTime.now()
		));

		for (CartItem cartItem : cartItems) {
			Product product = cartItem.getProduct();
			order.addItem(OrderItem.create(
					product,
					product.getName(),
					OrderCreateFieldSpec.OrderItemPriceSnapshot.withoutDiscount(
							product.getPrice(),
							cartItem.getQuantity()
					)
			));
		}

		order.registerPayment(paymentNo, request.paymentMethod(), amounts.orderAmount());
		order.registerDelivery();

		Order savedOrder = orderRepository.save(order);
		cartService.completeCartItemsForOrder(memberId, cartItems, savedOrder.getOrderNo());
		return OrderCreateResponse.from(savedOrder);
	}

	private List<CartItem> loadCartItemsInRequestOrder(Long memberId, List<Long> cartItemIds) {
		List<CartItem> cartItems = cartItemRepository.findByMemberIdAndIdInWithProduct(memberId, cartItemIds);

		if (cartItems.size() != cartItemIds.size()) {
			throw new BusinessException(ErrorCode.CART_ITEM_NOT_FOUND);
		}

		Map<Long, CartItem> cartItemMap = cartItems.stream()
				.collect(Collectors.toMap(CartItem::getId, Function.identity()));

		return cartItemIds.stream()
				.map(cartItemMap::get)
				.toList();
	}

	private String resolveDeliveryMemo(String requestMemo, MemberAddress memberAddress) {
		if (requestMemo != null && !requestMemo.isBlank()) {
			return requestMemo;
		}
		return memberAddress.getDeliveryMemo();
	}

	private OrderType resolveOrderType(OrderType orderType) {
		return orderType != null ? orderType : OrderCreateFieldSpec.DEFAULT_ORDER_TYPE;
	}

	private OrderCategory resolveOrderCategory(OrderCategory orderCategory) {
		return orderCategory != null ? orderCategory : OrderCreateFieldSpec.DEFAULT_ORDER_CATEGORY;
	}

}
