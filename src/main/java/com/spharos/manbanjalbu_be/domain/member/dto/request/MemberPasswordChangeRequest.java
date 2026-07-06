package com.spharos.manbanjalbu_be.domain.member.dto.request;

import com.spharos.manbanjalbu_be.domain.member.dto.MemberValidationConstants;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record MemberPasswordChangeRequest(
		@NotBlank(message = "현재 비밀번호를 입력해주세요.")
		String currentPassword,

		@NotBlank(message = "새 비밀번호를 입력해주세요.")
		@Pattern(regexp = MemberValidationConstants.PASSWORD_PATTERN, message = MemberValidationConstants.PASSWORD_MESSAGE)
		String newPassword
) {
}
