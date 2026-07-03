package com.spharos.manbanjalbu_be.domain.member.repository;

import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SignupSessionRepository extends JpaRepository<SignupSession, String> {
}
