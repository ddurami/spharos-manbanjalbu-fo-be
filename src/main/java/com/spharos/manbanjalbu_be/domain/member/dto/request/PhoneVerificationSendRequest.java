package com.spharos.manbanjalbu_be.domain.member.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record PhoneVerificationSendRequest(
		@NotBlank(message = "휴대전화번호를 입력해주세요.")
		@Pattern(regexp = "^01[0-9]{8,9}$", message = "본인 휴대전화번호(010...) 형식이 아닙니다.")
		String phone
) {
	public PhoneVerificationSendRequest {
		phone = normalizePhone(phone);
	}

	private static String normalizePhone(String phone) {
		if (phone == null) {
			return null;
		}
		return phone.replaceAll("[^0-9]", "");
	}
}
