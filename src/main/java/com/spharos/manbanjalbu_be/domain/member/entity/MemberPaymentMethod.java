package com.spharos.manbanjalbu_be.domain.member.entity;

import com.spharos.manbanjalbu_be.domain.member.enums.CardStatus;
import com.spharos.manbanjalbu_be.domain.member.enums.CardType;
import com.spharos.manbanjalbu_be.domain.member.enums.PaymentMethodType;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
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
import java.util.UUID;

/**
 * 회원 결제수단 (Mock 카드 / 계좌).
 * 마이페이지와 결제에서 동일한 데이터를 사용한다.
 * 실제 카드번호(PAN)는 저장하지 않으며 card_token만 보관한다.
 */
@Entity
@Table(
		name = "member_payment_method",
		indexes = {
				@Index(name = "idx_member_payment_method_member_id", columnList = "member_id"),
				@Index(name = "idx_member_payment_method_member_type", columnList = "member_id, method_type"),
				@Index(name = "idx_member_payment_method_member_status", columnList = "member_id, card_status")
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

	@Column(name = "card_name", nullable = false, length = 50)
	private String cardName;

	@Column(name = "card_company", nullable = false, length = 30)
	private String cardCompany;

	@Enumerated(EnumType.STRING)
	@Column(name = "card_type", length = 20)
	private CardType cardType;

	@Column(name = "masked_number", nullable = false, length = 30)
	private String maskedNumber;

	@Column(name = "last4", nullable = false, length = 4)
	private String last4;

	@Column(name = "card_image_url", length = 500)
	private String cardImageUrl;

	@Column(name = "is_default", nullable = false)
	private Boolean isDefault = false;

	@Enumerated(EnumType.STRING)
	@Column(name = "card_status", nullable = false, length = 20)
	private CardStatus cardStatus = CardStatus.ACTIVE;

	@Column(name = "card_token", length = 100)
	private String cardToken;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	/**
	 * Mock 결제용 카드를 생성한다.
	 */
	public static MemberPaymentMethod createMockCard(
			Member member,
			String cardName,
			String cardCompany,
			CardType cardType,
			String maskedNumber,
			String last4,
			String cardImageUrl,
			boolean isDefault
	) {
		MemberPaymentMethod paymentMethod = new MemberPaymentMethod();
		paymentMethod.member = member;
		paymentMethod.methodType = PaymentMethodType.CARD;
		paymentMethod.cardName = cardName;
		paymentMethod.cardCompany = cardCompany;
		paymentMethod.cardType = cardType;
		paymentMethod.maskedNumber = maskedNumber;
		paymentMethod.last4 = last4;
		paymentMethod.cardImageUrl = cardImageUrl;
		paymentMethod.isDefault = isDefault;
		paymentMethod.cardStatus = CardStatus.ACTIVE;
		paymentMethod.cardToken = "MOCK_TOKEN_" + UUID.randomUUID();
		return paymentMethod;
	}

	/**
	 * 마이페이지 등록 계좌를 생성한다.
	 */
	public static MemberPaymentMethod createBankAccount(
			Member member,
			String bankName,
			String maskedNumber,
			String last4,
			boolean isDefault
	) {
		MemberPaymentMethod paymentMethod = new MemberPaymentMethod();
		paymentMethod.member = member;
		paymentMethod.methodType = PaymentMethodType.BANK_ACCOUNT;
		paymentMethod.cardName = bankName;
		paymentMethod.cardCompany = bankName;
		paymentMethod.maskedNumber = maskedNumber;
		paymentMethod.last4 = last4;
		paymentMethod.isDefault = isDefault;
		paymentMethod.cardStatus = CardStatus.ACTIVE;
		return paymentMethod;
	}

	/** 결제 가능 여부 (ACTIVE 상태만 허용). */
	public boolean isPayable() {
		return cardStatus == CardStatus.ACTIVE;
	}

	/** 목록 조회 가능 여부 (DELETED 제외). */
	public boolean isVisible() {
		return cardStatus != CardStatus.DELETED;
	}

	public void validatePayable() {
		if (cardStatus == CardStatus.EXPIRED) {
			throw new BusinessException(ErrorCode.CARD_EXPIRED);
		}
		if (cardStatus == CardStatus.BLOCKED) {
			throw new BusinessException(ErrorCode.CARD_BLOCKED);
		}
		if (cardStatus != CardStatus.ACTIVE) {
			throw new BusinessException(ErrorCode.CARD_NOT_FOUND);
		}
	}

	public void markDeleted() {
		this.cardStatus = CardStatus.DELETED;
	}

	public void markBlocked() {
		this.cardStatus = CardStatus.BLOCKED;
	}

	public void markExpired() {
		this.cardStatus = CardStatus.EXPIRED;
	}

	/** 마이페이지 요약 표시용 이름. */
	public String getDisplayLabel() {
		return cardName + " " + maskedNumber;
	}
}
