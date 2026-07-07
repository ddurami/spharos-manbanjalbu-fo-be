package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record MemberAddressCreateRequest(
		@Size(max = 50, message = "배송지명은 50자 이하로 입력해주세요.")
		String addressName,

		@NotBlank(message = "수령인 이름을 입력해주세요.")
		@Size(max = 50, message = "수령인 이름은 50자 이하로 입력해주세요.")
		String recipientName,

		@NotBlank(message = "우편번호를 입력해주세요.")
		@Size(max = 10, message = "우편번호는 10자 이하로 입력해주세요.")
		String zipcode,

		@NotBlank(message = "기본 주소를 입력해주세요.")
		@Size(max = 255, message = "기본 주소는 255자 이하로 입력해주세요.")
		String baseAddress,

		@NotBlank(message = "상세 주소를 입력해주세요.")
		@Size(max = 255, message = "상세 주소는 255자 이하로 입력해주세요.")
		String detailAddress,

		@NotBlank(message = "연락처를 입력해주세요.")
		@Size(max = 20, message = "연락처는 20자 이하로 입력해주세요.")
		String phone1,

		@Size(max = 20, message = "추가 연락처는 20자 이하로 입력해주세요.")
		String phone2,

		@Size(max = 255, message = "배송 메모는 255자 이하로 입력해주세요.")
		String deliveryMemo,

		Boolean isDefault
) {
}
