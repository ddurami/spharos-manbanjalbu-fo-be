package com.spharos.manbanjalbu_be.domain.payment;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.CardStatus;
import com.spharos.manbanjalbu_be.domain.member.enums.CardType;
import com.spharos.manbanjalbu_be.domain.order.entity.Payment;
import com.spharos.manbanjalbu_be.domain.payment.entity.MemberActivityLog;
import com.spharos.manbanjalbu_be.domain.payment.entity.PaymentHistory;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentHistoryStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Table;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Field;
import java.util.Arrays;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Step 1: Mock 결제 도메인 엔티티·Enum 정합성 검증.
 */
class PaymentEntityAlignmentTest {

	@Test
	void memberPaymentMethodMapsMockCardColumns() {
		assertTableName(MemberPaymentMethod.class, "member_payment_method");
		assertHasColumn(MemberPaymentMethod.class, "cardName");
		assertHasColumn(MemberPaymentMethod.class, "cardCompany");
		assertHasColumn(MemberPaymentMethod.class, "cardType");
		assertHasColumn(MemberPaymentMethod.class, "maskedNumber");
		assertHasColumn(MemberPaymentMethod.class, "last4");
		assertHasColumn(MemberPaymentMethod.class, "cardImageUrl");
		assertHasColumn(MemberPaymentMethod.class, "cardStatus");
		assertHasColumn(MemberPaymentMethod.class, "cardToken");
	}

	@Test
	void cardStatusEnumContainsRequiredValues() {
		assertThat(Arrays.asList(CardStatus.values()))
				.containsExactly(
						CardStatus.ACTIVE,
						CardStatus.EXPIRED,
						CardStatus.BLOCKED,
						CardStatus.DELETED
				);
	}

	@Test
	void cardTypeEnumContainsRequiredValues() {
		assertThat(Arrays.asList(CardType.values()))
				.contains(
						CardType.VISA,
						CardType.MASTER,
						CardType.AMEX,
						CardType.JCB,
						CardType.LOCAL
				);
	}

	@Test
	void paymentEntityMapsExtendedColumns() {
		assertTableName(Payment.class, "payment");
		assertHasColumn(Payment.class, "memberPaymentMethodId");
		assertHasColumn(Payment.class, "paidAmount");
		assertHasColumn(Payment.class, "approvedNo");
		assertHasColumn(Payment.class, "approvedAt");
		assertHasColumn(Payment.class, "failCode");
		assertHasColumn(Payment.class, "failReason");
		assertHasColumn(Payment.class, "pgTransactionId");
		assertHasColumn(Payment.class, "pgName");
		assertHasColumn(Payment.class, "version");
	}

	@Test
	void paymentHistoryEntityMapsAuditColumns() {
		assertTableName(PaymentHistory.class, "payment_history");
		assertHasColumn(PaymentHistory.class, "historyStatus");
		assertHasColumn(PaymentHistory.class, "orderId");
		assertHasColumn(PaymentHistory.class, "memberId");
	}

	@Test
	void paymentHistoryStatusEnumContainsRequiredValues() {
		assertThat(Arrays.asList(PaymentHistoryStatus.values()))
				.containsExactly(
						PaymentHistoryStatus.READY,
						PaymentHistoryStatus.SUCCESS,
						PaymentHistoryStatus.FAILED,
						PaymentHistoryStatus.CANCEL,
						PaymentHistoryStatus.PARTIAL_CANCEL
				);
	}

	@Test
	void memberActivityLogEntityMapsCoreColumns() {
		assertTableName(MemberActivityLog.class, "member_activity_log");
		assertHasColumn(MemberActivityLog.class, "activityType");
		assertHasColumn(MemberActivityLog.class, "referenceType");
		assertHasColumn(MemberActivityLog.class, "referenceId");
		assertHasColumn(MemberActivityLog.class, "message");
	}

	private void assertTableName(Class<?> entityClass, String expectedTableName) {
		Table table = entityClass.getAnnotation(Table.class);
		assertThat(table).isNotNull();
		assertThat(table.name()).isEqualTo(expectedTableName);
	}

	private void assertHasColumn(Class<?> entityClass, String fieldName) {
		try {
			Field field = entityClass.getDeclaredField(fieldName);
			assertThat(field.isAnnotationPresent(Column.class)
					|| field.isAnnotationPresent(jakarta.persistence.JoinColumn.class)
					|| field.isAnnotationPresent(jakarta.persistence.Version.class))
					.as("%s.%s should have JPA column mapping", entityClass.getSimpleName(), fieldName)
					.isTrue();
		} catch (NoSuchFieldException exception) {
			throw new AssertionError("Missing field: " + entityClass.getSimpleName() + "." + fieldName, exception);
		}
	}
}
