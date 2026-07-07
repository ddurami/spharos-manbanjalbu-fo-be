package com.spharos.manbanjalbu_be.domain.payment.gateway;

import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentApproveCommand;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentGatewayResult;

/**
 * 결제 게이트웨이(PG) 추상화.
 * <p>
 * - {@code PaymentService} 에서만 호출한다 (Controller 등 다른 계층에서 직접 호출 금지).
 * - Repository·Entity·Transaction을 사용하지 않으며 승인 처리 결과만 반환한다.
 * - 주문/카드/회원/상태 등 비즈니스 검증은 Service 책임이다.
 */
public interface PaymentGateway {

	/**
	 * 결제 승인을 요청한다.
	 *
	 * @param command 승인에 필요한 Command DTO (Entity 미사용)
	 * @return 승인 결과 (immutable)
	 */
	PaymentGatewayResult approve(PaymentApproveCommand command);
}
