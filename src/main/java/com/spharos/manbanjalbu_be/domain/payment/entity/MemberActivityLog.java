package com.spharos.manbanjalbu_be.domain.payment.entity;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.payment.enums.ActivityReferenceType;
import com.spharos.manbanjalbu_be.domain.payment.enums.MemberActivityType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

/**
 * 회원 활동 로그.
 */
@Entity
@Table(
		name = "member_activity_log",
		indexes = {
				@Index(name = "idx_member_activity_log_member_id", columnList = "member_id"),
				@Index(name = "idx_member_activity_log_reference", columnList = "reference_type, reference_id")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberActivityLog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@Enumerated(EnumType.STRING)
	@Column(name = "activity_type", nullable = false, length = 30)
	private MemberActivityType activityType;

	@Enumerated(EnumType.STRING)
	@Column(name = "reference_type", nullable = false, length = 30)
	private ActivityReferenceType referenceType;

	@Column(name = "reference_id", nullable = false)
	private Long referenceId;

	@Column(nullable = false, length = 255)
	private String message;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	public static MemberActivityLog createPaymentCompleted(
			Member member,
			Long orderId,
			String orderNo
	) {
		MemberActivityLog log = new MemberActivityLog();
		log.member = member;
		log.activityType = MemberActivityType.PAYMENT_COMPLETED;
		log.referenceType = ActivityReferenceType.ORDER;
		log.referenceId = orderId;
		log.message = "주문 " + orderNo + " 결제가 완료되었습니다.";
		return log;
	}
}
