package com.spharos.manbanjalbu_be.domain.member.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "terms")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Terms {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 100)
	private String title;

	@Column(nullable = false, columnDefinition = "TEXT")
	private String content;

	@Column(name = "is_mandatory", nullable = false)
	private Boolean isMandatory;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@OneToMany(mappedBy = "terms")
	private List<MemberTermsAgreement> memberAgreements = new ArrayList<>();

	public static Terms create(String title, String content, boolean isMandatory) {
		Terms terms = new Terms();
		terms.title = title;
		terms.content = content;
		terms.isMandatory = isMandatory;
		return terms;
	}
}
