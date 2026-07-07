package com.spharos.manbanjalbu_be.domain.product.service;

import com.spharos.manbanjalbu_be.domain.product.dto.response.SeasonResponse;
import com.spharos.manbanjalbu_be.domain.product.repository.SeasonRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class SeasonService {

	private final SeasonRepository seasonRepository;

	public SeasonService(SeasonRepository seasonRepository) {
		this.seasonRepository = seasonRepository;
	}

	public List<SeasonResponse> getAllSeasons() {
		return seasonRepository.findAllByOrderByCreatedAtDesc().stream()
				.map(SeasonResponse::from)
				.toList();
	}
}
