package com.spharos.manbanjalbu_be.domain.payment;

import com.spharos.manbanjalbu_be.domain.payment.support.ApprovalNumberGenerator;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.IntStream;

import static org.assertj.core.api.Assertions.assertThat;

class ApprovalNumberGeneratorTest {

	private final ApprovalNumberGenerator generator = new ApprovalNumberGenerator();

	@Test
	void generateUsesAppPrefixAndTimestampFormat() {
		String approvedNo = generator.generate();

		assertThat(approvedNo).startsWith("APP");
		assertThat(approvedNo).hasSize("APP".length() + "yyyyMMddHHmmss".length() + 4);
		assertThat(approvedNo.substring(3, 17)).matches("\\d{14}");
	}

	@Test
	void generateProducesUniqueNumbersWithinSameSecond() {
		Set<String> generated = new HashSet<>();

		IntStream.range(0, 100).forEach(i -> generated.add(generator.generate()));

		assertThat(generated).hasSize(100);
	}
}
