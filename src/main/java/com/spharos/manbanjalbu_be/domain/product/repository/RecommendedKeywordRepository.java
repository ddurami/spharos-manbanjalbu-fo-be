package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.RecommendedKeyword;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RecommendedKeywordRepository extends JpaRepository<RecommendedKeyword, Long> {

	boolean existsByLabel(String label);

	List<RecommendedKeyword> findByIsActiveTrueOrderByDisplayOrderAsc();
}
