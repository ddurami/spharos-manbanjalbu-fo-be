package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;

/**
 * FE checkout 결제수단 문자열 → BE {@link PaymentMethod} 매핑.
 */
public final class CheckoutPaymentMethodMapper {

	private CheckoutPaymentMethodMapper() {
	}

	public static PaymentMethod fromFrontendValue(String frontendValue) {
		if (frontendValue == null || frontendValue.isBlank()) {
			throw new BusinessException(ErrorCode.ORDER_PAYMENT_METHOD_INVALID);
		}

		return switch (frontendValue.trim()) {
			case "credit-card" -> PaymentMethod.CARD;
			case "ssgpay" -> PaymentMethod.MOBILE;
			case "simple-pay", "starbucks-card" -> PaymentMethod.EASY_PAY;
			default -> throw new BusinessException(ErrorCode.ORDER_PAYMENT_METHOD_INVALID);
		};
	}

}
