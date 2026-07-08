package com.spharos.manbanjalbu_be.domain.payment.repository;

import com.spharos.manbanjalbu_be.domain.payment.entity.MemberActivityLog;
import com.spharos.manbanjalbu_be.domain.payment.enums.MemberActivityType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberActivityLogRepository extends JpaRepository<MemberActivityLog, Long> {

	List<MemberActivityLog> findByMember_IdAndActivityTypeOrderByCreatedAtDesc(
			Long memberId,
			MemberActivityType activityType
	);
}
