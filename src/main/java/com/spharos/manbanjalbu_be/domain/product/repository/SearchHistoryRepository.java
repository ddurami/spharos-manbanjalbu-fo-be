package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.SearchHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SearchHistoryRepository extends JpaRepository<SearchHistory, Long> {

	List<SearchHistory> findTop10ByMemberIdOrderByCreatedAtDesc(Long memberId);

	List<SearchHistory> findByMemberIdOrderByCreatedAtDesc(Long memberId);

	Optional<SearchHistory> findByIdAndMemberId(Long id, Long memberId);

	void deleteByMemberIdAndKeyword(Long memberId, String keyword);

	void deleteByMemberId(Long memberId);
}
