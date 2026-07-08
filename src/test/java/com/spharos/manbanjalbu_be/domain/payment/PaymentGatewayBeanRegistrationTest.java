package com.spharos.manbanjalbu_be.domain.payment;

import com.spharos.manbanjalbu_be.domain.payment.gateway.MockPaymentGateway;
import com.spharos.manbanjalbu_be.domain.payment.gateway.PaymentGateway;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@ActiveProfiles("test")
class PaymentGatewayBeanRegistrationTest {

	@Autowired
	private PaymentGateway paymentGateway;

	@Test
	void mockPaymentGatewayIsRegisteredByDefault() {
		assertThat(paymentGateway).isInstanceOf(MockPaymentGateway.class);
	}
}
