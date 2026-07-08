package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.junit.jupiter.api.Test;

import java.time.LocalDateTime;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

class OrderQuerySpecTest {

	@Test
	void resolveFromDateSupportsAllPeriodValues() {
		assertThat(OrderQuerySpec.resolveFromDate("1M")).isBefore(LocalDateTime.now());
		assertThat(OrderQuerySpec.resolveFromDate("3M")).isBefore(OrderQuerySpec.resolveFromDate("1M"));
		assertThat(OrderQuerySpec.resolveFromDate("ALL")).isEqualTo(LocalDateTime.of(1970, 1, 1, 0, 0));
	}

	@Test
	void resolveFromDateUsesOneMonthWhenPeriodMissing() {
		LocalDateTime fromDate = OrderQuerySpec.resolveFromDate(null);

		assertThat(fromDate).isAfter(LocalDateTime.now().minusMonths(1).minusMinutes(1));
		assertThat(fromDate).isBefore(LocalDateTime.now().minusMonths(1).plusMinutes(1));
	}

	@Test
	void resolveFromDateRejectsInvalidPeriod() {
		assertThatThrownBy(() -> OrderQuerySpec.resolveFromDate("INVALID"))
				.isInstanceOf(BusinessException.class)
				.extracting("errorCode")
				.isEqualTo(ErrorCode.INVALID_INPUT);
	}
}
