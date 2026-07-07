package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.enums.MemberStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

	boolean existsByLoginId(String loginId);

	Optional<Member> findByLoginId(String loginId);

	Optional<Member> findByLoginIdAndStatus(String loginId, MemberStatus status);
}
