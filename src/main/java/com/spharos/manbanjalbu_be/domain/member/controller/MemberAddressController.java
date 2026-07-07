package com.spharos.manbanjalbu_be.domain.member.controller;

import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberAddressCreateRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberAddressUpdateRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberAddressResponse;
import com.spharos.manbanjalbu_be.domain.member.service.MemberAddressService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "배송지", description = "마이페이지 배송지 관리 API")
@RestController
@RequestMapping("/api/member/addresses")
public class MemberAddressController {

	private static final String BEARER_AUTH = "BearerAuth";

	private final MemberAddressService memberAddressService;

	public MemberAddressController(MemberAddressService memberAddressService) {
		this.memberAddressService = memberAddressService;
	}

	@GetMapping
	@Operation(
			summary = "배송지 목록 조회",
			description = "기본 배송지가 먼저, 이후 등록일 최신순으로 반환합니다.",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<List<MemberAddressResponse>>> getAddresses(
			@AuthenticationPrincipal Long memberId
	) {
		return ResponseEntity.ok(ApiResponse.ok(memberAddressService.getAddresses(memberId)));
	}

	@GetMapping("/{addressId}")
	@Operation(summary = "배송지 상세 조회", security = @SecurityRequirement(name = BEARER_AUTH))
	public ResponseEntity<ApiResponse<MemberAddressResponse>> getAddress(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long addressId
	) {
		return ResponseEntity.ok(ApiResponse.ok(memberAddressService.getAddress(memberId, addressId)));
	}

	@PostMapping
	@Operation(
			summary = "배송지 등록",
			description = "첫 배송지는 자동으로 기본 배송지로 등록됩니다.",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<MemberAddressResponse>> createAddress(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody MemberAddressCreateRequest request
	) {
		MemberAddressResponse response = memberAddressService.createAddress(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(response, "배송지가 등록되었습니다."));
	}

	@PutMapping("/{addressId}")
	@Operation(summary = "배송지 수정", security = @SecurityRequirement(name = BEARER_AUTH))
	public ResponseEntity<ApiResponse<MemberAddressResponse>> updateAddress(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long addressId,
			@Valid @RequestBody MemberAddressUpdateRequest request
	) {
		MemberAddressResponse response = memberAddressService.updateAddress(memberId, addressId, request);
		return ResponseEntity.ok(ApiResponse.ok(response, "배송지가 수정되었습니다."));
	}

	@PatchMapping("/{addressId}/default")
	@Operation(summary = "기본 배송지 설정", security = @SecurityRequirement(name = BEARER_AUTH))
	public ResponseEntity<ApiResponse<MemberAddressResponse>> setDefaultAddress(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long addressId
	) {
		MemberAddressResponse response = memberAddressService.setDefaultAddress(memberId, addressId);
		return ResponseEntity.ok(ApiResponse.ok(response, "기본 배송지가 변경되었습니다."));
	}

	@DeleteMapping("/{addressId}")
	@Operation(
			summary = "배송지 삭제",
			description = "기본 배송지 삭제 시 다른 배송지가 자동으로 기본 배송지가 됩니다.",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	public ResponseEntity<ApiResponse<Void>> deleteAddress(
			@AuthenticationPrincipal Long memberId,
			@PathVariable Long addressId
	) {
		memberAddressService.deleteAddress(memberId, addressId);
		return ResponseEntity.ok(ApiResponse.ok(null, "배송지가 삭제되었습니다."));
	}
}
