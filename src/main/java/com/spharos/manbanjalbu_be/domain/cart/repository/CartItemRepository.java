package com.spharos.manbanjalbu_be.domain.cart.repository;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {

	List<CartItem> findByMemberIdOrderByCreatedAtDesc(Long memberId);

	Optional<CartItem> findByMemberIdAndProductId(Long memberId, Long productId);

	int countByMemberId(Long memberId);
}
