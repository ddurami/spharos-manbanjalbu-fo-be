package com.spharos.manbanjalbu_be.domain.cart.repository;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {

	@Query("SELECT ci FROM CartItem ci " +
			"JOIN FETCH ci.product p " +
			"LEFT JOIN FETCH p.mediaList " +
			"WHERE ci.member.id = :memberId " +
			"ORDER BY ci.createdAt DESC")
	List<CartItem> findByMemberIdWithProduct(@Param("memberId") Long memberId);

	List<CartItem> findByMemberIdOrderByCreatedAtDesc(Long memberId);

	Optional<CartItem> findByMemberIdAndProductId(Long memberId, Long productId);

	int countByMemberId(Long memberId);
}
