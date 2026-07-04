package com.spharos.manbanjalbu_be.domain.product.entity;

import com.spharos.manbanjalbu_be.domain.product.enums.Capacity;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.enums.SaleType;
import jakarta.persistence.CascadeType;
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
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(
		name = "product",
		indexes = {
				@Index(name = "idx_product_category_id", columnList = "category_id"),
				@Index(name = "idx_product_policy_id", columnList = "policy_id"),
				@Index(name = "idx_product_status", columnList = "status"),
				@Index(name = "idx_product_sale_type", columnList = "sale_type"),
				@Index(name = "idx_product_sale_status", columnList = "sale_type, status")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	private Category category;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "policy_id", nullable = false)
	private ProductPolicy policy;

	@Column(nullable = false, length = 200)
	private String name;

	@Column(name = "short_description", length = 255)
	private String shortDescription;

	@Column(nullable = false)
	private int price;

	@Enumerated(EnumType.STRING)
	@Column(name = "sale_type", nullable = false, length = 20)
	private SaleType saleType = SaleType.NORMAL;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "season_id")
	private Season season;

	@Enumerated(EnumType.STRING)
	@Column(length = 20)
	private Capacity capacity;

	@Column(name = "is_best", nullable = false)
	private boolean isBest = false;

	@Column(name = "is_new", nullable = false)
	private boolean isNew = false;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false, length = 20)
	private ProductStatus status = ProductStatus.ON_SALE;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
	@OrderBy("displayOrder ASC")
	private List<ProductMedia> mediaList = new ArrayList<>();
}
