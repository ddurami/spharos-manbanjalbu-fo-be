package com.spharos.manbanjalbu_be.domain.product.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
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
import jakarta.persistence.UniqueConstraint;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(
		name = "category",
		uniqueConstraints = @UniqueConstraint(
				name = "uk_category_parent_name",
				columnNames = {"parent_id", "name"}
		),
		indexes = @Index(name = "idx_category_parent_id", columnList = "parent_id")
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "parent_id")
	private Category parent;

	@OneToMany(mappedBy = "parent")
	@OrderBy("displayOrder ASC")
	private List<Category> children = new ArrayList<>();

	@Column(nullable = false, length = 100)
	private String name;

	@Column(nullable = false)
	private int depth = 1;

	@Column(name = "display_order")
	private int displayOrder = 0;
}
