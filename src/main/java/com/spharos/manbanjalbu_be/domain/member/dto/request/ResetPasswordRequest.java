package com.spharos.manbanjalbu_be.domain.member.dto.request;

import com.spharos.manbanjalbu_be.domain.member.dto.MemberValidationConstants;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public record ResetPasswordRequest(
		@NotBlank(message = "인증 토큰이 필요합니다.")
		String verificationToken,

		@NotBlank(message = "비밀번호를 입력해주세요.")
		@Pattern(regexp = MemberValidationConstants.PASSWORD_PATTERN, message = MemberValidationConstants.PASSWORD_MESSAGE)
		String password
) {
}
