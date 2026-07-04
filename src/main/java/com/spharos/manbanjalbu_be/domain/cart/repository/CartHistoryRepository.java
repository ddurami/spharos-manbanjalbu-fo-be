package com.spharos.manbanjalbu_be.domain.cart.repository;

import com.spharos.manbanjalbu_be.domain.cart.entity.CartHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartHistoryRepository extends JpaRepository<CartHistory, Long> {
}
