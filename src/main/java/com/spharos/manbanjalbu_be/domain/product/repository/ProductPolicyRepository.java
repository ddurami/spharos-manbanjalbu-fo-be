package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.ProductPolicy;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductPolicyRepository extends JpaRepository<ProductPolicy, Long> {
}
