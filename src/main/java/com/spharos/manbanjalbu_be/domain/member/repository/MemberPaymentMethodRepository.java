package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberPaymentMethodRepository extends JpaRepository<MemberPaymentMethod, Long> {

	long countByMember_IdAndMethodType(Long memberId, PaymentMethodType methodType);

	List<MemberPaymentMethod> findByMember_IdOrderByIsDefaultDescCreatedAtDesc(Long memberId);

	List<MemberPaymentMethod> findByMember_IdAndMethodTypeOrderByIsDefaultDescCreatedAtDesc(
			Long memberId,
			PaymentMethodType methodType
	);
}
