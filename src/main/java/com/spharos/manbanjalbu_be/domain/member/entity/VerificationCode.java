package com.spharos.manbanjalbu_be.domain.member.entity;

import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "verification_code",
		indexes = @Index(name = "idx_verification_target", columnList = "auth_method, target_value")
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class VerificationCode {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Enumerated(EnumType.STRING)
	@Column(name = "auth_method", nullable = false, length = 20)
	private AuthMethod authMethod;

	@Column(name = "target_value", nullable = false, length = 255)
	private String targetValue;

	@Column(nullable = false, length = 10)
	private String code;

	@Column(name = "expires_at", nullable = false)
	private LocalDateTime expiresAt;

	@Column(name = "is_used", nullable = false)
	private Boolean isUsed = false;

	public static VerificationCode create(AuthMethod authMethod, String targetValue, String code, LocalDateTime expiresAt) {
		VerificationCode verificationCode = new VerificationCode();
		verificationCode.authMethod = authMethod;
		verificationCode.targetValue = targetValue;
		verificationCode.code = code;
		verificationCode.expiresAt = expiresAt;
		return verificationCode;
	}

	public void markUsed() {
		this.isUsed = true;
	}

	public boolean isExpired() {
		return LocalDateTime.now().isAfter(expiresAt);
	}
}
