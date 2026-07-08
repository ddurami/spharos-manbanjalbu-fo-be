package com.spharos.manbanjalbu_be.domain.payment.gateway;

import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentGatewayName;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentApproveCommand;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentGatewayResult;
import com.spharos.manbanjalbu_be.domain.payment.support.ApprovalNumberGenerator;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * Mock PG 게이트웨이.
 * <p>
 * Stateless Bean: Repository·Entity·Transaction 미사용, 승인 결과만 반환한다.
 * 비즈니스 검증(주문/카드/회원/상태)은 PaymentService에서 수행한다.
 */
@Component
@ConditionalOnProperty(name = "payment.gateway", havingValue = "mock", matchIfMissing = true)
public class MockPaymentGateway implements PaymentGateway {

	/** Mock PG 실패 시뮬레이션용 card_token prefix (테스트·개발용). */
	public static final String FAIL_TOKEN_PREFIX = "MOCK_TOKEN_FAIL";

	private static final String MOCK_FAIL_CODE = "MOCK_PAYMENT_FAILED";
	private static final String MOCK_FAIL_REASON = "Mock PG 승인 거절";

	private final ApprovalNumberGenerator approvalNumberGenerator;

	public MockPaymentGateway(ApprovalNumberGenerator approvalNumberGenerator) {
		this.approvalNumberGenerator = approvalNumberGenerator;
	}

	@Override
	public PaymentGatewayResult approve(PaymentApproveCommand command) {
		if (shouldSimulateFailure(command.cardToken())) {
			return PaymentGatewayResult.failure(
					PaymentGatewayName.MOCK,
					MOCK_FAIL_CODE,
					MOCK_FAIL_REASON
			);
		}

		return PaymentGatewayResult.success(
				approvalNumberGenerator.generate(),
				LocalDateTime.now(),
				PaymentGatewayName.MOCK,
				"MOCK_TX_" + UUID.randomUUID()
		);
	}

	/**
	 * Mock PG 거절 시뮬레이션 (비즈니스 검증이 아닌 PG 응답 시뮬레이션).
	 */
	private boolean shouldSimulateFailure(String cardToken) {
		return cardToken != null && cardToken.startsWith(FAIL_TOKEN_PREFIX);
	}
}
