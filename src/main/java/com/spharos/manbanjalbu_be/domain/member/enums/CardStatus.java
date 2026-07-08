package com.spharos.manbanjalbu_be.domain.member.enums;

/**
 * Mock/PG 결제수단(카드) 상태.
 * DELETED는 soft delete이며 목록 조회에서 제외한다.
 */
public enum CardStatus {
	ACTIVE,
	EXPIRED,
	BLOCKED,
	DELETED
}
