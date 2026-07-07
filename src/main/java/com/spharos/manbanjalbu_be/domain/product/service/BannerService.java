package com.spharos.manbanjalbu_be.domain.product.service;

import com.spharos.manbanjalbu_be.domain.product.dto.response.BannerResponse;
import com.spharos.manbanjalbu_be.domain.product.enums.BannerPosition;
import com.spharos.manbanjalbu_be.domain.product.repository.BannerRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class BannerService {

	private final BannerRepository bannerRepository;

	public BannerService(BannerRepository bannerRepository) {
		this.bannerRepository = bannerRepository;
	}

	public List<BannerResponse> getMainCarouselBanners() {
		return bannerRepository.findActiveBanners(BannerPosition.MAIN_CAROUSEL, LocalDateTime.now())
				.stream()
				.map(BannerResponse::from)
				.toList();
	}

	public List<BannerResponse> getBannersByPosition(BannerPosition position) {
		return bannerRepository.findActiveBanners(position, LocalDateTime.now())
				.stream()
				.map(BannerResponse::from)
				.toList();
	}
}
