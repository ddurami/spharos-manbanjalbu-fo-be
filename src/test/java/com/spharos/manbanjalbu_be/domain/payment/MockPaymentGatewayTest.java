package com.spharos.manbanjalbu_be.domain.payment;

import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentGatewayName;
import com.spharos.manbanjalbu_be.domain.payment.gateway.MockPaymentGateway;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentApproveCommand;
import com.spharos.manbanjalbu_be.domain.payment.gateway.dto.PaymentGatewayResult;
import com.spharos.manbanjalbu_be.domain.payment.support.ApprovalNumberGenerator;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.ClassPathScanningCandidateComponentProvider;
import org.springframework.core.type.filter.AssignableTypeFilter;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashSet;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

class MockPaymentGatewayTest {

	private final ApprovalNumberGenerator approvalNumberGenerator = new ApprovalNumberGenerator();
	private final MockPaymentGateway mockPaymentGateway = new MockPaymentGateway(approvalNumberGenerator);

	@Test
	void approveReturnsMockSuccessResult() {
		PaymentApproveCommand command = sampleCommand("MOCK_TOKEN_ok");

		PaymentGatewayResult result = mockPaymentGateway.approve(command);

		assertThat(result.success()).isTrue();
		assertThat(result.approvedNo()).startsWith("APP");
		assertThat(result.approvedAt()).isNotNull();
		assertThat(result.pgName()).isEqualTo(PaymentGatewayName.MOCK);
		assertThat(result.pgTransactionId()).startsWith("MOCK_TX_");
		assertThat(result.failCode()).isNull();
		assertThat(result.failReason()).isNull();
	}

	@Test
	void approveSimulatesPgFailureForFailTokenPrefix() {
		PaymentApproveCommand command = sampleCommand(MockPaymentGateway.FAIL_TOKEN_PREFIX + "_card");

		PaymentGatewayResult result = mockPaymentGateway.approve(command);

		assertThat(result.success()).isFalse();
		assertThat(result.pgName()).isEqualTo(PaymentGatewayName.MOCK);
		assertThat(result.failCode()).isEqualTo("MOCK_PAYMENT_FAILED");
		assertThat(result.approvedNo()).isNull();
	}

	@Test
	void mockPaymentGatewayIsStatelessAndHasNoTransactionalAnnotation() {
		assertThat(MockPaymentGateway.class.isAnnotationPresent(Transactional.class)).isFalse();
		assertThat(hasMutableState(MockPaymentGateway.class)).isFalse();
		assertThat(hasRepositoryDependency(MockPaymentGateway.class)).isFalse();
	}

	@Test
	void paymentGatewayResultIsImmutableRecord() {
		assertThat(PaymentGatewayResult.class.isRecord()).isTrue();
	}

	private PaymentApproveCommand sampleCommand(String cardToken) {
		return new PaymentApproveCommand(
				"ORD20260707120000001",
				10L,
				1L,
				100L,
				cardToken,
				15_800,
				PaymentMethod.CARD
		);
	}

	private boolean hasMutableState(Class<?> type) {
		for (Field field : type.getDeclaredFields()) {
			if (Modifier.isStatic(field.getModifiers())) {
				continue;
			}
			if (!Modifier.isFinal(field.getModifiers())) {
				return true;
			}
		}
		return false;
	}

	private boolean hasRepositoryDependency(Class<?> type) {
		ClassPathScanningCandidateComponentProvider scanner =
				new ClassPathScanningCandidateComponentProvider(false);
		scanner.addIncludeFilter(new AssignableTypeFilter(type));

		for (BeanDefinition candidate : scanner.findCandidateComponents(type.getPackageName())) {
			if (!candidate.getBeanClassName().equals(type.getName())) {
				continue;
			}
		}

		for (var constructor : type.getConstructors()) {
			for (var parameter : constructor.getParameters()) {
				if (parameter.getType().getSimpleName().endsWith("Repository")) {
					return true;
				}
			}
		}
		return false;
	}
}
