package com.spharos.manbanjalbu_be.domain.cart.controller;

import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartAddRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartDeleteRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.request.CartUpdateRequest;
import com.spharos.manbanjalbu_be.domain.cart.dto.response.CartCheckoutResponse;
import com.spharos.manbanjalbu_be.domain.cart.dto.response.CartListResponse;
import com.spharos.manbanjalbu_be.domain.cart.service.CartService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cart")
@Tag(name = "장바구니", description = "장바구니 관련 API")
public class CartController {

	private final CartService cartService;

	public CartController(CartService cartService) {
		this.cartService = cartService;
	}

	@GetMapping
	@Operation(summary = "장바구니 조회")
	public ResponseEntity<ApiResponse<CartListResponse>> getCartList(
			@AuthenticationPrincipal Long memberId) {
		CartListResponse response = cartService.getCartList(memberId);
		return ResponseEntity.ok(ApiResponse.ok(response));
	}

	@GetMapping("/count")
	@Operation(summary = "장바구니 상품 개수 조회", description = "헤더 장바구니 아이콘 뱃지용")
	public ResponseEntity<ApiResponse<Integer>> getCartItemCount(
			@AuthenticationPrincipal Long memberId) {
		int count = cartService.getCartItemCount(memberId);
		return ResponseEntity.ok(ApiResponse.ok(count));
	}

	@PostMapping
	@Operation(summary = "장바구니 추가")
	public ResponseEntity<ApiResponse<Void>> addCartItem(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody CartAddRequest request) {
		cartService.addCartItem(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(null, "장바구니에 추가되었습니다."));
	}

	@PostMapping("/checkout")
	@Operation(summary = "결제 대상 장바구니 조회", description = "선택한 장바구니 상품을 결제 화면용으로 조회합니다.")
	public ResponseEntity<ApiResponse<CartCheckoutResponse>> getCheckoutItems(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody CartDeleteRequest request) {
		CartCheckoutResponse response = cartService.getCheckoutItems(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(response));
	}

	@PatchMapping("/{cartItemId}")
	@Operation(summary = "장바구니 수량 변경")
	public ResponseEntity<ApiResponse<Void>> updateCartItemQuantity(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long cartItemId,
			@Valid @RequestBody CartUpdateRequest request) {
		cartService.updateCartItemQuantity(memberId, cartItemId, request);
		return ResponseEntity.ok(ApiResponse.ok(null, "수량이 변경되었습니다."));
	}

	@DeleteMapping
	@Operation(summary = "장바구니 선택 삭제")
	public ResponseEntity<ApiResponse<Void>> deleteCartItems(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody CartDeleteRequest request) {
		cartService.deleteCartItems(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(null, "선택한 아이템이 삭제되었습니다."));
	}

	@DeleteMapping("/all")
	@Operation(summary = "장바구니 전체 삭제")
	public ResponseEntity<ApiResponse<Void>> deleteAllCartItems(
			@AuthenticationPrincipal Long memberId) {
		cartService.deleteAllCartItems(memberId);
		return ResponseEntity.ok(ApiResponse.ok(null, "장바구니가 비워졌습니다."));
	}
}
