package com.spharos.manbanjalbu_be.domain.member.dto;

public final class MemberValidationConstants {

	public static final String PASSWORD_PATTERN =
			"^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,16}$";

	public static final String PASSWORD_MESSAGE =
			"비밀번호는 8~16자리이며, 영문 대소문자와 특수문자를 각각 1개 이상 포함해야 합니다.";

	private MemberValidationConstants() {
	}
}
