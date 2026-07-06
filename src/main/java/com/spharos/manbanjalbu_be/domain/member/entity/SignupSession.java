package com.spharos.manbanjalbu_be.domain.member.entity;

import com.spharos.manbanjalbu_be.domain.member.enums.AuthMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.SignupStep;
import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapKeyColumn;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Entity
@Table(name = "signup_session", comment = "회원가입/비밀번호찾기 세션")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SignupSession {

	@Id
	@Column(length = 36)
	private String token;

	@Enumerated(EnumType.STRING)
	@Column(name = "auth_method", nullable = false, length = 20)
	private AuthMethod authMethod;

	@Column(name = "verified_value", nullable = false, length = 255)
	private String verifiedValue;

	@Column(length = 88)
	private String ci;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 30)
	private SignupStep step;

	@ElementCollection
	@CollectionTable(name = "signup_session_terms", joinColumns = @JoinColumn(name = "session_token"))
	@MapKeyColumn(name = "terms_id")
	@Column(name = "is_agreed")
	private Map<Long, Boolean> termAgreements = new HashMap<>();

	@Column(name = "expires_at", nullable = false)
	private LocalDateTime expiresAt;

	public static SignupSession createIdentityVerified(
			String token,
			AuthMethod authMethod,
			String verifiedValue,
			String ci,
			LocalDateTime expiresAt
	) {
		SignupSession session = new SignupSession();
		session.token = token;
		session.authMethod = authMethod;
		session.verifiedValue = verifiedValue;
		session.ci = ci;
		session.step = SignupStep.IDENTITY_VERIFIED;
		session.expiresAt = expiresAt;
		return session;
	}

	public void agreeTerms(Map<Long, Boolean> agreements) {
		this.termAgreements = new HashMap<>(agreements);
		this.step = SignupStep.TERMS_AGREED;
	}

	public void markPasswordResetVerified() {
		this.step = SignupStep.PASSWORD_RESET_VERIFIED;
	}

	public boolean isExpired() {
		return LocalDateTime.now().isAfter(expiresAt);
	}
}
