package com.spharos.manbanjalbu_be.domain.cart.service;

import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartAddRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartDeleteRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartUpdateRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.response.CartItemResponse;
import com.spharos.manbanjalbu_be.domain.cart.dto.response.CartListResponse;
import com.spharos.manbanjalbu_be.domain.cart.entity.CartHistory;
import com.spharos.manbanjalbu_be.domain.cart.entity.CartItem;
import com.spharos.manbanjalbu_be.domain.cart.enums.CartActionType;
import com.spharos.manbanjalbu_be.domain.cart.repository.CartHistoryRepository;
import com.spharos.manbanjalbu_be.domain.cart.repository.CartItemRepository;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CartService {

	private static final int MAX_CART_ITEM_TYPES = 20;
	private static final int MAX_QUANTITY_PER_PRODUCT = 20;

	private final CartItemRepository cartItemRepository;
	private final CartHistoryRepository cartHistoryRepository;
	private final MemberRepository memberRepository;
	private final ProductRepository productRepository;

	public CartService(CartItemRepository cartItemRepository,
			CartHistoryRepository cartHistoryRepository,
			MemberRepository memberRepository,
			ProductRepository productRepository) {
		this.cartItemRepository = cartItemRepository;
		this.cartHistoryRepository = cartHistoryRepository;
		this.memberRepository = memberRepository;
		this.productRepository = productRepository;
	}

	@Transactional(readOnly = true)
	public CartListResponse getCartList(Long memberId) {
		List<CartItem> cartItems = cartItemRepository.findByMemberIdWithProduct(memberId);

		List<CartItemResponse> cartItemResponses = cartItems.stream()
				.map(CartItemResponse::from)
				.toList();

		return new CartListResponse(cartItemResponses, cartItemResponses.size());
	}

	public void addCartItem(Long memberId, CartAddRequest request) {
		Member member = memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));

		Product product = productRepository.findById(request.productId())
				.orElseThrow(() -> new BusinessException(ErrorCode.PRODUCT_NOT_FOUND));

		if (product.getStatus() != ProductStatus.ON_SALE) {
			throw new BusinessException(ErrorCode.PRODUCT_NOT_ON_SALE);
		}

		Optional<CartItem> existingItem = cartItemRepository
				.findByMemberIdAndProductId(memberId, request.productId());

		if (existingItem.isPresent()) {
			CartItem cartItem = existingItem.get();
			int beforeQuantity = cartItem.getQuantity();
			int newQuantity = beforeQuantity + request.quantity();

			validateQuantityLimit(newQuantity);

			cartItem.addQuantity(request.quantity());

			cartHistoryRepository.save(CartHistory.create(
					member, cartItem.getId(), request.productId(),
					CartActionType.ADD, cartItem.getQuantity(),
					beforeQuantity, cartItem.getQuantity(),
					null
			));
		} else {
			int currentCartCount = cartItemRepository.countByMemberId(memberId);
			if (currentCartCount >= MAX_CART_ITEM_TYPES) {
				throw new BusinessException(ErrorCode.CART_ITEM_LIMIT_EXCEEDED);
			}

			validateQuantityLimit(request.quantity());

			CartItem cartItem = CartItem.create(member, product, request.quantity());
			cartItemRepository.save(cartItem);

			cartHistoryRepository.save(CartHistory.create(
					member, cartItem.getId(), request.productId(),
					CartActionType.ADD, request.quantity(),
					null, request.quantity(),
					null
			));
		}
	}

	public void updateCartItemQuantity(Long memberId, Long cartItemId, CartUpdateRequest request) {
		CartItem cartItem = findCartItemWithOwnerCheck(memberId, cartItemId);

		validateQuantityLimit(request.quantity());

		int beforeQuantity = cartItem.getQuantity();
		cartItem.updateQuantity(request.quantity());

		cartHistoryRepository.save(CartHistory.create(
				cartItem.getMember(), cartItem.getId(), cartItem.getProduct().getId(),
				CartActionType.UPDATE_QUANTITY, request.quantity(),
				beforeQuantity, request.quantity(),
				null
		));
	}

	public void deleteCartItems(Long memberId, CartDeleteRequest request) {
		List<CartItem> cartItems = cartItemRepository.findAllById(request.cartItemIds());

		for (CartItem cartItem : cartItems) {
			if (!cartItem.getMember().getId().equals(memberId)) {
				throw new BusinessException(ErrorCode.CART_ITEM_UNAUTHORIZED);
			}

			cartHistoryRepository.save(CartHistory.create(
					cartItem.getMember(), cartItem.getId(), cartItem.getProduct().getId(),
					CartActionType.DELETE, cartItem.getQuantity(),
					cartItem.getQuantity(), 0,
					null
			));
		}

		cartItemRepository.deleteAll(cartItems);
	}

	public void deleteAllCartItems(Long memberId) {
		List<CartItem> cartItems = cartItemRepository.findByMemberIdOrderByCreatedAtDesc(memberId);

		if (cartItems.isEmpty()) {
			return;
		}

		Member member = cartItems.get(0).getMember();

		for (CartItem cartItem : cartItems) {
			cartHistoryRepository.save(CartHistory.create(
					member, cartItem.getId(), cartItem.getProduct().getId(),
					CartActionType.DELETE, cartItem.getQuantity(),
					cartItem.getQuantity(), 0,
					"전체 삭제"
			));
		}

		cartItemRepository.deleteAll(cartItems);
	}

	private CartItem findCartItemWithOwnerCheck(Long memberId, Long cartItemId) {
		CartItem cartItem = cartItemRepository.findById(cartItemId)
				.orElseThrow(() -> new BusinessException(ErrorCode.CART_ITEM_NOT_FOUND));

		if (!cartItem.getMember().getId().equals(memberId)) {
			throw new BusinessException(ErrorCode.CART_ITEM_UNAUTHORIZED);
		}

		return cartItem;
	}

	private void validateQuantityLimit(int quantity) {
		if (quantity > MAX_QUANTITY_PER_PRODUCT) {
			throw new BusinessException(ErrorCode.CART_QUANTITY_LIMIT_EXCEEDED);
		}
	}
}
