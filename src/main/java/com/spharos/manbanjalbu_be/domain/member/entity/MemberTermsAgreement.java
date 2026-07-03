package com.spharos.manbanjalbu_be.domain.member.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "member_terms_agreement",
		uniqueConstraints = @UniqueConstraint(name = "uk_member_terms", columnNames = {"member_id", "terms_id"}),
		indexes = {
				@Index(name = "idx_member_terms_member_id", columnList = "member_id"),
				@Index(name = "idx_member_terms_terms_id", columnList = "terms_id")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberTermsAgreement {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "terms_id", nullable = false)
	private Terms terms;

	@Column(name = "is_agreed", nullable = false)
	private Boolean isAgreed = true;

	@CreationTimestamp
	@Column(name = "agreed_at", nullable = false, updatable = false)
	private LocalDateTime agreedAt;

	public static MemberTermsAgreement create(Member member, Terms terms, boolean isAgreed) {
		MemberTermsAgreement agreement = new MemberTermsAgreement();
		agreement.member = member;
		agreement.terms = terms;
		agreement.isAgreed = isAgreed;
		return agreement;
	}
}
