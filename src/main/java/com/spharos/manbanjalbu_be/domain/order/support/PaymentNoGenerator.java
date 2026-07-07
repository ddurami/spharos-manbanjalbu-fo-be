package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 결제번호 생성: PAY + yyyyMMddHHmmss + 4자리 시퀀스.
 */
@Component
public class PaymentNoGenerator {

	private static final String PREFIX = "PAY";
	private static final DateTimeFormatter TIMESTAMP_FORMAT =
			DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

	private final AtomicInteger sequence = new AtomicInteger(0);
	private final PaymentNoAvailabilityChecker availabilityChecker;

	public PaymentNoGenerator(PaymentNoAvailabilityChecker availabilityChecker) {
		this.availabilityChecker = availabilityChecker;
	}

	@Autowired
	public PaymentNoGenerator(PaymentRepository paymentRepository) {
		this(paymentNo -> paymentRepository.findByPaymentNo(paymentNo).isPresent());
	}

	public String generate() {
		for (int attempt = 0; attempt < 10; attempt++) {
			String paymentNo = PREFIX
					+ LocalDateTime.now().format(TIMESTAMP_FORMAT)
					+ String.format("%04d", sequence.incrementAndGet() % 10_000);

			if (!availabilityChecker.exists(paymentNo)) {
				return paymentNo;
			}
		}

		throw new IllegalStateException("고유한 결제번호를 생성하지 못했습니다.");
	}

	@FunctionalInterface
	public interface PaymentNoAvailabilityChecker {
		boolean exists(String paymentNo);
	}

}
