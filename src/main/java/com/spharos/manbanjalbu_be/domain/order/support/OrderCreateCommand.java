package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderCategory;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;

import java.time.LocalDate;
import java.time.LocalDateTime;

public record OrderCreateCommand(
		Member member,
		MemberAddress memberAddress,
		String orderNo,
		String orderName,
		OrderType orderType,
		OrderCategory orderCategory,
		String deliveryMemo,
		LocalDate reservationDeliveryDate,
		OrderCreateFieldSpec.RecipientSnapshot recipient,
		OrderCreateFieldSpec.OrderAmounts amounts,
		LocalDateTime orderAt
) {
}
