package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberTermsAgreement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface MemberTermsAgreementRepository extends JpaRepository<MemberTermsAgreement, Long> {

	List<MemberTermsAgreement> findByMember_Id(Long memberId);

	Optional<MemberTermsAgreement> findByMember_IdAndTerms_Id(Long memberId, Long termsId);
}
