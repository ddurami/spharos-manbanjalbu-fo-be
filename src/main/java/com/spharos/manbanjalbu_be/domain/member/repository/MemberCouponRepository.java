package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberCoupon;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberCouponRepository extends JpaRepository<MemberCoupon, Long> {

	long countByMember_IdAndIsUsedFalse(Long memberId);

	List<MemberCoupon> findByMember_IdAndIsUsedFalseOrderByExpiresAtAsc(Long memberId);
}
