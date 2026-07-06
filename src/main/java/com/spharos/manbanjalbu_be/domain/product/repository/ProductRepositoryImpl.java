package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.Capacity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepositoryCustom {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@SuppressWarnings("unchecked")
	public Page<Product> searchProducts(
			String keyword,
			List<Long> categoryIds,
			Long seasonId,
			Integer minPrice,
			Integer maxPrice,
			List<Capacity> capacities,
			String sort,
			Pageable pageable) {

		boolean useSalesSort = "sales".equals(sort);

		StringBuilder from = new StringBuilder("FROM product p ");
		if (useSalesSort) {
			from.append("LEFT JOIN product_sales_summary pss ON p.id = pss.product_id ");
		}

		StringBuilder where = new StringBuilder("WHERE p.status = 'ON_SALE' ");
		List<Object[]> params = new ArrayList<>();

		if (keyword != null && !keyword.isBlank()) {
			String likeKeyword = "%" + keyword.trim() + "%";
			where.append("AND (p.name LIKE ?").append(params.size() + 1);
			params.add(new Object[]{params.size() + 1, likeKeyword});
			where.append(" OR p.short_description LIKE ?").append(params.size() + 1).append(") ");
			params.add(new Object[]{params.size() + 1, likeKeyword});
		}

		if (categoryIds != null && !categoryIds.isEmpty()) {
			where.append("AND p.category_id IN (");
			for (int i = 0; i < categoryIds.size(); i++) {
				if (i > 0) where.append(", ");
				where.append("?").append(params.size() + 1);
				params.add(new Object[]{params.size() + 1, categoryIds.get(i)});
			}
			where.append(") ");
		}

		if (seasonId != null) {
			where.append("AND p.season_id = ?").append(params.size() + 1).append(" ");
			params.add(new Object[]{params.size() + 1, seasonId});
		}

		if (minPrice != null) {
			where.append("AND p.price >= ?").append(params.size() + 1).append(" ");
			params.add(new Object[]{params.size() + 1, minPrice});
		}

		if (maxPrice != null) {
			where.append("AND p.price <= ?").append(params.size() + 1).append(" ");
			params.add(new Object[]{params.size() + 1, maxPrice});
		}

		if (capacities != null && !capacities.isEmpty()) {
			where.append("AND p.capacity IN (");
			for (int i = 0; i < capacities.size(); i++) {
				if (i > 0) where.append(", ");
				where.append("?").append(params.size() + 1);
				params.add(new Object[]{params.size() + 1, capacities.get(i).name()});
			}
			where.append(") ");
		}

		String orderBy = switch (sort != null ? sort : "newest") {
			case "sales" -> "ORDER BY COALESCE(pss.total_sales_count, 0) DESC, p.created_at DESC ";
			case "price_asc" -> "ORDER BY p.price ASC, p.created_at DESC ";
			case "price_desc" -> "ORDER BY p.price DESC, p.created_at DESC ";
			default -> "ORDER BY p.created_at DESC ";
		};

		String countSql = "SELECT COUNT(*) " + from + where;
		Query countQuery = entityManager.createNativeQuery(countSql);
		for (Object[] param : params) {
			countQuery.setParameter((int) param[0], param[1]);
		}
		long total = ((Number) countQuery.getSingleResult()).longValue();

		if (total == 0) {
			return new PageImpl<>(List.of(), pageable, 0);
		}

		String dataSql = "SELECT p.* " + from + where + orderBy;
		Query dataQuery = entityManager.createNativeQuery(dataSql, Product.class);
		for (Object[] param : params) {
			dataQuery.setParameter((int) param[0], param[1]);
		}
		dataQuery.setFirstResult((int) pageable.getOffset());
		dataQuery.setMaxResults(pageable.getPageSize());

		List<Product> products = dataQuery.getResultList();
		return new PageImpl<>(products, pageable, total);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Long> findCategoryIdsByKeyword(String keyword) {
		String likeKeyword = "%" + keyword.trim() + "%";
		String sql = "SELECT DISTINCT p.category_id FROM product p "
				+ "WHERE p.status = 'ON_SALE' "
				+ "AND (p.name LIKE ?1 OR p.short_description LIKE ?2)";
		Query query = entityManager.createNativeQuery(sql);
		query.setParameter(1, likeKeyword);
		query.setParameter(2, likeKeyword);
		return query.getResultList();
	}
}
