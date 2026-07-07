package com.spharos.manbanjalbu_be.domain.member.entity;

import com.spharos.manbanjalbu_be.domain.member.enums.CouponDiscountType;
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

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(
		name = "member_coupon",
		indexes = {
				@Index(name = "idx_member_coupon_member_id", columnList = "member_id"),
				@Index(name = "idx_member_coupon_member_used", columnList = "member_id, is_used"),
				@Index(name = "idx_member_coupon_expires_at", columnList = "expires_at")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberCoupon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@Column(name = "coupon_name", nullable = false, length = 100)
	private String couponName;

	@Enumerated(EnumType.STRING)
	@Column(name = "discount_type", nullable = false, length = 20)
	private CouponDiscountType discountType = CouponDiscountType.FIXED;

	@Column(name = "discount_value")
	private Integer discountValue;

	@Column(name = "expires_at", nullable = false)
	private LocalDate expiresAt;

	@Column(name = "is_used", nullable = false)
	private Boolean isUsed = false;

	@Column(name = "used_at")
	private LocalDateTime usedAt;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	public static MemberCoupon create(
			Member member,
			String couponName,
			CouponDiscountType discountType,
			Integer discountValue,
			LocalDate expiresAt
	) {
		MemberCoupon coupon = new MemberCoupon();
		coupon.member = member;
		coupon.couponName = couponName;
		coupon.discountType = discountType;
		coupon.discountValue = discountValue;
		coupon.expiresAt = expiresAt;
		return coupon;
	}

	public void markUsed() {
		this.isUsed = true;
		this.usedAt = LocalDateTime.now();
	}
}
