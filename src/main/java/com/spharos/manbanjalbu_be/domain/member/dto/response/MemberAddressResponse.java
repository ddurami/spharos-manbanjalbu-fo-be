package com.spharos.manbanjalbu_be.domain.member.dto.response;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;

import java.time.LocalDateTime;
import java.util.List;

public record MemberAddressResponse(
		Long id,
		String addressName,
		String recipientName,
		String zipcode,
		String baseAddress,
		String detailAddress,
		String phone1,
		String phone2,
		String deliveryMemo,
		boolean isDefault,
		LocalDateTime createdAt,
		LocalDateTime updatedAt
) {
	public static MemberAddressResponse from(MemberAddress address) {
		return new MemberAddressResponse(
				address.getId(),
				address.getAddressName(),
				address.getRecipientName(),
				address.getZipcode(),
				address.getBaseAddress(),
				address.getDetailAddress(),
				address.getPhone1(),
				address.getPhone2(),
				address.getDeliveryMemo(),
				address.getIsDefault(),
				address.getCreatedAt(),
				address.getUpdatedAt()
		);
	}

	public static List<MemberAddressResponse> fromList(List<MemberAddress> addresses) {
		return addresses.stream()
				.map(MemberAddressResponse::from)
				.toList();
	}
}
