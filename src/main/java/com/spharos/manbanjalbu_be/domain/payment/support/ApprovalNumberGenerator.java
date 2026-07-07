package com.spharos.manbanjalbu_be.domain.payment.support;

import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Mock/PG 승인번호 생성기.
 * 형식: APP + yyyyMMddHHmmss + 4자리 시퀀스 (동일 초 내 중복 방지).
 */
@Component
public class ApprovalNumberGenerator {

	private static final DateTimeFormatter SECOND_FORMAT = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
	private static final String PREFIX = "APP";

	private final AtomicInteger sequence = new AtomicInteger(0);
	private volatile String currentSecondKey = "";

	/**
	 * 유일한 승인번호를 생성한다.
	 * 동일 초(yyyyMMddHHmmss) 내 호출 시 시퀀스를 증가시켜 중복을 방지한다.
	 */
	public String generate() {
		String secondKey = LocalDateTime.now().format(SECOND_FORMAT);
		synchronized (this) {
			if (!secondKey.equals(currentSecondKey)) {
				currentSecondKey = secondKey;
				sequence.set(0);
			}
			int next = sequence.incrementAndGet();
			if (next > 9999) {
				throw new IllegalStateException("동일 초 내 승인번호 생성 한도(9999)를 초과했습니다.");
			}
			return PREFIX + secondKey + String.format("%04d", next);
		}
	}
}
