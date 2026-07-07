package com.spharos.manbanjalbu_be.domain.product.entity;

import com.spharos.manbanjalbu_be.domain.product.enums.BannerPosition;
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
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "banner",
		indexes = {
				@Index(name = "idx_banner_position_active", columnList = "position, is_active, display_order")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Banner {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, length = 100)
	private String title;

	@Column(name = "image_url", nullable = false, length = 500)
	private String imageUrl;

	@Column(name = "link_url", length = 500)
	private String linkUrl;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 20)
	private BannerPosition position;

	@Column(name = "display_order", nullable = false)
	private int displayOrder;

	@Column(name = "is_active", nullable = false)
	private boolean isActive = true;

	@Column(name = "start_at")
	private LocalDateTime startAt;

	@Column(name = "end_at")
	private LocalDateTime endAt;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;
}
