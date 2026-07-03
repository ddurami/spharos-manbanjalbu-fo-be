package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.VerificationCode;
import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface VerificationCodeRepository extends JpaRepository<VerificationCode, Long> {

	Optional<VerificationCode> findFirstByAuthMethodAndTargetValueAndIsUsedFalseOrderByIdDesc(
			AuthMethod authMethod,
			String targetValue
	);
}
