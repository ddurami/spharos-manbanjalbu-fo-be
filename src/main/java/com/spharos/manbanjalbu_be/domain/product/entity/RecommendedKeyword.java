package com.spharos.manbanjalbu_be.domain.product.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "recommended_keyword",
		indexes = @Index(name = "idx_recommended_keyword_active_order", columnList = "is_active, display_order")
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class RecommendedKeyword {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 50)
	private String label;

	@Column(nullable = false, length = 100)
	private String keyword;

	@Column(name = "display_order", nullable = false)
	private int displayOrder = 0;

	@Column(name = "is_active", nullable = false)
	private boolean isActive = true;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	public static RecommendedKeyword create(String label, String keyword, int displayOrder) {
		RecommendedKeyword recommendedKeyword = new RecommendedKeyword();
		recommendedKeyword.label = label;
		recommendedKeyword.keyword = keyword;
		recommendedKeyword.displayOrder = displayOrder;
		recommendedKeyword.isActive = true;
		return recommendedKeyword;
	}
}
