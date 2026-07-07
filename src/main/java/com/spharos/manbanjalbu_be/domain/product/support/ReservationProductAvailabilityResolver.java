package com.spharos.manbanjalbu_be.domain.product.support;

import com.spharos.manbanjalbu_be.domain.product.entity.ReservationProduct;
import com.spharos.manbanjalbu_be.domain.product.repository.ReservationProductRepository;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ReservationProductAvailabilityResolver {

	private final ReservationProductRepository reservationProductRepository;

	public ReservationProductAvailabilityResolver(
			ReservationProductRepository reservationProductRepository
	) {
		this.reservationProductRepository = reservationProductRepository;
	}

	public Map<Long, Boolean> resolveAvailability(Collection<Long> productIds, LocalDateTime at) {
		if (productIds.isEmpty()) {
			return Map.of();
		}

		List<Long> distinctProductIds = productIds.stream().distinct().toList();
		Map<Long, Boolean> availability = new HashMap<>();
		distinctProductIds.forEach(productId -> availability.put(productId, false));

		List<ReservationProduct> reservationProducts =
				reservationProductRepository.findByProduct_IdIn(distinctProductIds);

		for (ReservationProduct reservationProduct : reservationProducts) {
			Long productId = reservationProduct.getProduct().getId();
			if (reservationProduct.isReservationAvailable(at)) {
				availability.put(productId, true);
			}
		}

		return availability;
	}
}
