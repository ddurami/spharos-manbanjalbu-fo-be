package com.spharos.manbanjalbu_be.domain.product.dto.response;

import com.spharos.manbanjalbu_be.domain.product.entity.Season;

import java.time.LocalDateTime;

public record SeasonResponse(
		Long id,
		String name,
		LocalDateTime createdAt
) {

	public static SeasonResponse from(Season season) {
		return new SeasonResponse(
				season.getId(),
				season.getName(),
				season.getCreatedAt()
		);
	}
}
