package com.spharos.manbanjalbu_be.domain.member.dto.request;

import com.spharos.manbanjalbu_be.domain.member.dto.MemberValidationConstants;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public record MemberJoinRequest(
		@NotBlank(message = "회원가입 세션 토큰이 필요합니다.")
		String verificationToken,

		@NotBlank(message = "아이디를 입력해주세요.")
		@Size(min = 4, max = 50, message = "아이디는 4~50자리여야 합니다.")
		String loginId,

		@NotBlank(message = "비밀번호를 입력해주세요.")
		@Pattern(regexp = MemberValidationConstants.PASSWORD_PATTERN, message = MemberValidationConstants.PASSWORD_MESSAGE)
		String password,

		@NotBlank(message = "이름을 입력해주세요.")
		String name,

		@NotNull(message = "생년월일을 입력해주세요.")
		LocalDate birthDate,

		@NotBlank(message = "휴대전화번호를 입력해주세요.")
		@Pattern(regexp = "^01[0-9]{8,9}$", message = "올바른 휴대전화번호 형식이 아닙니다.")
		String phone,

		@NotBlank(message = "이메일을 입력해주세요.")
		@Email(message = "올바른 이메일 형식이 아닙니다.")
		String email,

		@Size(max = 50, message = "닉네임은 50자 이하여야 합니다.")
		String nickname
) {
}
