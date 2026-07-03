package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record PhoneVerificationConfirmRequest(
		@NotBlank(message = "휴대전화번호를 입력해주세요.")
		@Pattern(regexp = "^01[0-9]{8,9}$", message = "본인 휴대전화번호(010...)를 입력해주세요. Octomo 수신번호(1666-3538)는 phone에 넣을 수 없습니다.")
		String phone,

		@NotBlank(message = "인증번호를 입력해주세요.")
		String code
) {
	public PhoneVerificationConfirmRequest {
		phone = normalizePhone(phone);
	}

	private static String normalizePhone(String phone) {
		if (phone == null) {
			return null;
		}
		return phone.replaceAll("[^0-9]", "");
	}
}
