package com.spharos.manbanjalbu_be.domain.product.service;

import com.spharos.manbanjalbu_be.domain.product.dto.response.CategoryResponse;
import com.spharos.manbanjalbu_be.domain.product.entity.Category;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class CategoryService {

	private final CategoryRepository categoryRepository;

	public CategoryService(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	public List<CategoryResponse> getAllCategories() {
		List<Category> topCategories = categoryRepository.findByDepthOrderByDisplayOrderAsc(1);
		return topCategories.stream()
				.map(CategoryResponse::from)
				.toList();
	}

	/**
	 * FE에서 전달된 categoryIds를 실제 조회에 사용할 ID 목록으로 확장한다.
	 * - depth=1 카테고리가 포함된 경우: 해당 카테고리의 모든 2차 하위 카테고리 ID를 추가
	 * - depth=2 카테고리는 그대로 유지
	 */
	public List<Long> expandCategoryIds(List<Long> categoryIds) {
		if (categoryIds == null || categoryIds.isEmpty()) {
			return List.of();
		}

		List<Category> categories = categoryRepository.findAllById(categoryIds);
		List<Long> expandedIds = new ArrayList<>();

		for (Category category : categories) {
			if (category.getDepth() == 1) {
				List<Category> children = categoryRepository.findByParentId(category.getId());
				if (children.isEmpty()) {
					expandedIds.add(category.getId());
				} else {
					children.forEach(child -> expandedIds.add(child.getId()));
				}
			} else {
				expandedIds.add(category.getId());
			}
		}

		return expandedIds;
	}
}
