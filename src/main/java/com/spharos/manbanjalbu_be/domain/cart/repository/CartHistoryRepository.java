package com.spharos.manbanjalbu_be.domain.cart.repository;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartHistory;
import com.spharos.manbanjalbu_be.domain.cart.enums.CartActionType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartHistoryRepository extends JpaRepository<CartHistory, Long> {

	List<CartHistory> findByMember_IdAndActionType(Long memberId, CartActionType actionType);

}
