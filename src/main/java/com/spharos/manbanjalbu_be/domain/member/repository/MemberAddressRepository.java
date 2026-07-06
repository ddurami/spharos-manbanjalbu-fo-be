package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberAddress;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface MemberAddressRepository extends JpaRepository<MemberAddress, Long> {

	long countByMember_Id(Long memberId);

	Optional<MemberAddress> findFirstByMember_IdAndIsDefaultTrue(Long memberId);

	List<MemberAddress> findByMember_IdOrderByIsDefaultDescCreatedAtDesc(Long memberId);
}
