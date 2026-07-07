package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.MemberProfile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MemberProfileRepository extends JpaRepository<MemberProfile, Long> {

	boolean existsByEmail(String email);

	boolean existsByPhone(String phone);

	boolean existsByNickname(String nickname);

	Optional<MemberProfile> findByEmail(String email);

	Optional<MemberProfile> findByPhone(String phone);
}
