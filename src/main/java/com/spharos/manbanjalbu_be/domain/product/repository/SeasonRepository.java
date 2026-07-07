package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.Season;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SeasonRepository extends JpaRepository<Season, Long> {

	List<Season> findAllByOrderByCreatedAtDesc();

	List<Season> findTop5ByOrderByCreatedAtDesc();
}
