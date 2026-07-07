package com.spharos.manbanjalbu_be.domain.product.entity;

import com.spharos.manbanjalbu_be.domain.product.enums.ProductMediaType;
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

import java.time.LocalDateTime;

@Entity
@Table(
		name = "product_media",
		indexes = @Index(name = "idx_product_media_product_id", columnList = "product_id")
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ProductMedia {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;

	@Enumerated(EnumType.STRING)
	@Column(name = "media_type", nullable = false, length = 20)
	private ProductMediaType mediaType;

	@Column(name = "media_url", nullable = false, length = 500)
	private String mediaUrl;

	@Column(name = "original_name", length = 255)
	private String originalName;

	@Column(name = "display_order")
	private int displayOrder = 1;

	@Column(name = "is_main", nullable = false)
	private boolean isMain = false;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;
}
