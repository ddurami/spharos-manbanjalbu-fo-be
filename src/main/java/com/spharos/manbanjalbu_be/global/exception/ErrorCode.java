package com.spharos.manbanjalbu_be.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public enum ErrorCode {
	INVALID_INPUT(HttpStatus.BAD_REQUEST, "입력값이 올바르지 않습니다."),
	VERIFICATION_CODE_NOT_FOUND(HttpStatus.BAD_REQUEST, "인증번호를 찾을 수 없습니다."),
	VERIFICATION_CODE_EXPIRED(HttpStatus.BAD_REQUEST, "인증번호가 만료되었습니다."),
	VERIFICATION_CODE_MISMATCH(HttpStatus.BAD_REQUEST, "인증번호가 일치하지 않습니다."),
	VERIFICATION_ALREADY_USED(HttpStatus.BAD_REQUEST, "이미 사용된 인증번호입니다."),
	SIGNUP_SESSION_NOT_FOUND(HttpStatus.BAD_REQUEST, "회원가입 세션이 유효하지 않습니다."),
	SIGNUP_SESSION_EXPIRED(HttpStatus.BAD_REQUEST, "회원가입 세션이 만료되었습니다."),
	SIGNUP_STEP_INVALID(HttpStatus.BAD_REQUEST, "회원가입 진행 순서가 올바르지 않습니다."),
	MANDATORY_TERMS_NOT_AGREED(HttpStatus.BAD_REQUEST, "필수 약관에 모두 동의해야 합니다."),
	TERMS_NOT_FOUND(HttpStatus.NOT_FOUND, "약관 정보를 찾을 수 없습니다."),
	DUPLICATE_LOGIN_ID(HttpStatus.CONFLICT, "이미 사용 중인 아이디입니다."),
	DUPLICATE_EMAIL(HttpStatus.CONFLICT, "이미 사용 중인 이메일입니다."),
	DUPLICATE_PHONE(HttpStatus.CONFLICT, "이미 사용 중인 휴대전화번호입니다."),
	DUPLICATE_NICKNAME(HttpStatus.CONFLICT, "이미 사용 중인 닉네임입니다."),
	MEMBER_NOT_FOUND(HttpStatus.NOT_FOUND, "회원 정보를 찾을 수 없습니다."),
	INVALID_CREDENTIALS(HttpStatus.UNAUTHORIZED, "아이디 또는 비밀번호가 올바르지 않습니다."),
	MEMBER_INACTIVE(HttpStatus.FORBIDDEN, "활성화되지 않은 회원입니다."),
	MEMBER_ALREADY_WITHDRAWN(HttpStatus.BAD_REQUEST, "이미 탈퇴한 회원입니다."),
	INVALID_CURRENT_PASSWORD(HttpStatus.BAD_REQUEST, "현재 비밀번호가 올바르지 않습니다."),
	EMAIL_CONFIG_INVALID(HttpStatus.BAD_REQUEST, "메일 발송 설정이 올바르지 않습니다. application-local.yaml 을 확인해주세요."),
	EMAIL_AUTHENTICATION_FAILED(HttpStatus.BAD_REQUEST, "Gmail SMTP 인증에 실패했습니다. Gmail 앱 비밀번호를 사용했는지 확인해주세요."),
	EMAIL_SEND_FAILED(HttpStatus.INTERNAL_SERVER_ERROR, "이메일 발송에 실패했습니다."),
	OCTOMO_CONFIG_INVALID(HttpStatus.BAD_REQUEST, "Octomo API 설정이 올바르지 않습니다."),
	OCTOMO_VERIFICATION_FAILED(HttpStatus.BAD_REQUEST, "휴대폰 문자 인증에 실패했습니다."),
	OCTOMO_API_ERROR(HttpStatus.BAD_GATEWAY, "Octomo API 호출 중 오류가 발생했습니다."),
	UNAUTHORIZED(HttpStatus.UNAUTHORIZED, "인증이 필요합니다."),

	CART_ITEM_NOT_FOUND(HttpStatus.NOT_FOUND, "장바구니 아이템을 찾을 수 없습니다."),
	CART_ITEM_UNAUTHORIZED(HttpStatus.FORBIDDEN, "접근 권한이 없는 장바구니 아이템입니다."),
	CART_ITEM_LIMIT_EXCEEDED(HttpStatus.BAD_REQUEST, "장바구니에는 최대 20종류의 상품만 담을 수 있습니다."),
	CART_QUANTITY_LIMIT_EXCEEDED(HttpStatus.BAD_REQUEST, "하나의 상품은 최대 20개까지만 담을 수 있습니다."),

	PRODUCT_NOT_FOUND(HttpStatus.NOT_FOUND, "상품을 찾을 수 없습니다."),
	PRODUCT_NOT_ON_SALE(HttpStatus.BAD_REQUEST, "현재 판매 중이 아닌 상품입니다."),
	CATEGORY_NOT_FOUND(HttpStatus.NOT_FOUND, "카테고리를 찾을 수 없습니다."),
	SEARCH_HISTORY_NOT_FOUND(HttpStatus.NOT_FOUND, "검색 기록을 찾을 수 없습니다.");

	private final HttpStatus status;
	private final String message;

	ErrorCode(HttpStatus status, String message) {
		this.status = status;
		this.message = message;
	}
}
