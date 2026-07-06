package com.spharos.manbanjalbu_be.domain.product.entity;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
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
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "search_history",
		indexes = {
				@Index(name = "idx_search_history_member_id", columnList = "member_id"),
				@Index(name = "idx_search_history_member_created", columnList = "member_id, created_at")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SearchHistory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	@Column(nullable = false, length = 100)
	private String keyword;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	public static SearchHistory create(Member member, String keyword) {
		SearchHistory history = new SearchHistory();
		history.member = member;
		history.keyword = keyword;
		return history;
	}
}
