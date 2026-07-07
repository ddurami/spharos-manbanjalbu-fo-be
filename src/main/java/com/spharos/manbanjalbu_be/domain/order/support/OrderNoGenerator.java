package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 주문번호 생성: ORD + yyyyMMddHHmmss + 4자리 시퀀스.
 */
@Component
public class OrderNoGenerator {

	private static final String PREFIX = "ORD";
	private static final DateTimeFormatter TIMESTAMP_FORMAT =
			DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

	private final AtomicInteger sequence = new AtomicInteger(0);
	private final OrderNoAvailabilityChecker availabilityChecker;

	public OrderNoGenerator(OrderNoAvailabilityChecker availabilityChecker) {
		this.availabilityChecker = availabilityChecker;
	}

	@Autowired
	public OrderNoGenerator(OrderRepository orderRepository) {
		this(orderNo -> orderRepository.findByOrderNo(orderNo).isPresent());
	}

	public String generate() {
		for (int attempt = 0; attempt < 10; attempt++) {
			String orderNo = PREFIX
					+ LocalDateTime.now().format(TIMESTAMP_FORMAT)
					+ String.format("%04d", sequence.incrementAndGet() % 10_000);

			if (!availabilityChecker.exists(orderNo)) {
				return orderNo;
			}
		}

		throw new IllegalStateException("고유한 주문번호를 생성하지 못했습니다.");
	}

	@FunctionalInterface
	public interface OrderNoAvailabilityChecker {
		boolean exists(String orderNo);
	}

}
