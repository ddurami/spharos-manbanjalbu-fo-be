package com.spharos.manbanjalbu_be.domain.member.entity;

import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
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
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "member_payment_method",
		indexes = {
				@Index(name = "idx_member_payment_method_member_id", columnList = "member_id"),
				@Index(name = "idx_member_payment_method_member_type", columnList = "member_id, method_type")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberPaymentMethod {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@Enumerated(EnumType.STRING)
	@Column(name = "method_type", nullable = false, length = 20)
	private PaymentMethodType methodType;

	@Column(name = "provider_name", nullable = false, length = 50)
	private String providerName;

	@Column(name = "masked_number", nullable = false, length = 30)
	private String maskedNumber;

	@Column(name = "is_default", nullable = false)
	private Boolean isDefault = false;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	public static MemberPaymentMethod create(
			Member member,
			PaymentMethodType methodType,
			String providerName,
			String maskedNumber,
			boolean isDefault
	) {
		MemberPaymentMethod paymentMethod = new MemberPaymentMethod();
		paymentMethod.member = member;
		paymentMethod.methodType = methodType;
		paymentMethod.providerName = providerName;
		paymentMethod.maskedNumber = maskedNumber;
		paymentMethod.isDefault = isDefault;
		return paymentMethod;
	}
}
