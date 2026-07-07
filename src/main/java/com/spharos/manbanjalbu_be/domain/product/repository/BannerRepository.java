package com.spharos.manbanjalbu_be.domain.product.repository;

import com.spharos.manbanjalbu_be.domain.product.entity.Banner;
import com.spharos.manbanjalbu_be.domain.product.enums.BannerPosition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;

public interface BannerRepository extends JpaRepository<Banner, Long> {

	@Query("SELECT b FROM Banner b " +
			"WHERE b.position = :position " +
			"AND b.isActive = true " +
			"AND (b.startAt IS NULL OR b.startAt <= :now) " +
			"AND (b.endAt IS NULL OR b.endAt >= :now) " +
			"ORDER BY b.displayOrder ASC")
	List<Banner> findActiveBanners(
			@Param("position") BannerPosition position,
			@Param("now") LocalDateTime now
	);
}
