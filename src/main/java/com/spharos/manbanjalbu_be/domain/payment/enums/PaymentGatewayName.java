package com.spharos.manbanjalbu_be.domain.payment.enums;

/**
 * 결제 게이트웨이(PG) 식별자.
 * Mock 환경에서는 MOCK을 사용한다.
 */
public enum PaymentGatewayName {
	MOCK,
	TOSS,
	INICIS,
	KAKAO_PAY
}
