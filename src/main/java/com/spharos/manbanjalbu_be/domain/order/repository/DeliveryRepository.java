package com.spharos.manbanjalbu_be.domain.order.repository;

import com.spharos.manbanjalbu_be.domain.order.entity.Delivery;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface DeliveryRepository extends JpaRepository<Delivery, Long> {

	Optional<Delivery> findByOrderId(Long orderId);
}
