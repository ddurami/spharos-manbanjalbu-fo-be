package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface MemberPaymentMethodRepository extends JpaRepository<MemberPaymentMethod, Long> {

	long countByMember_IdAndMethodType(Long memberId, PaymentMethodType methodType);

	boolean existsByMember_IdAndCardName(Long memberId, String cardName);

	@Query("""
			SELECT m
			FROM MemberPaymentMethod m
			WHERE m.member.id = :memberId
			  AND m.methodType = com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType.CARD
			  AND m.cardStatus = com.spharos.manbanjalbu_be.domain.member.enums.CardStatus.ACTIVE
			ORDER BY m.isDefault DESC, m.createdAt DESC
			""")
	List<MemberPaymentMethod> findActiveCardsByMemberId(@Param("memberId") Long memberId);

	@Query("""
			SELECT m
			FROM MemberPaymentMethod m
			WHERE m.id = :cardId
			  AND m.member.id = :memberId
			  AND m.cardStatus <> com.spharos.manbanjalbu_be.domain.member.enums.CardStatus.DELETED
			""")
	Optional<MemberPaymentMethod> findVisibleCardByIdAndMemberId(
			@Param("cardId") Long cardId,
			@Param("memberId") Long memberId
	);

	Optional<MemberPaymentMethod> findByIdAndMember_Id(Long id, Long memberId);

	List<MemberPaymentMethod> findByMember_IdOrderByIsDefaultDescCreatedAtDesc(Long memberId);

	List<MemberPaymentMethod> findByMember_IdAndMethodTypeOrderByIsDefaultDescCreatedAtDesc(
			Long memberId,
			PaymentMethodType methodType
	);
}
