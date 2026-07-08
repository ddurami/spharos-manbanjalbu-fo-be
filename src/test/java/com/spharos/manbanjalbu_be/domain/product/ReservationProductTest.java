package com.spharos.manbanjalbu_be.domain.product;

import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ReservationProduct;
import com.spharos.manbanjalbu_be.domain.product.enums.ReservationStatus;
import org.junit.jupiter.api.Test;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.time.LocalDateTime;

import static org.assertj.core.api.Assertions.assertThat;

class ReservationProductTest {

	@Test
	void isReservationAvailableReturnsTrueForOpenProductWithinPeriodWithStock() throws Exception {
		LocalDateTime now = LocalDateTime.of(2026, 7, 8, 12, 0);
		ReservationProduct reservationProduct = reservationProduct(
				now.minusDays(1),
				now.plusDays(30),
				ReservationStatus.OPEN,
				10,
				2
		);

		assertThat(reservationProduct.isReservationAvailable(now)).isTrue();
	}

	@Test
	void isReservationAvailableReturnsFalseWhenClosed() throws Exception {
		LocalDateTime now = LocalDateTime.of(2026, 7, 8, 12, 0);
		ReservationProduct reservationProduct = reservationProduct(
				now.minusDays(1),
				now.plusDays(30),
				ReservationStatus.CLOSED,
				10,
				0
		);

		assertThat(reservationProduct.isReservationAvailable(now)).isFalse();
	}

	@Test
	void isReservationAvailableReturnsFalseWhenOutOfPeriod() throws Exception {
		LocalDateTime now = LocalDateTime.of(2026, 7, 8, 12, 0);
		ReservationProduct reservationProduct = reservationProduct(
				now.plusDays(1),
				now.plusDays(30),
				ReservationStatus.OPEN,
				10,
				0
		);

		assertThat(reservationProduct.isReservationAvailable(now)).isFalse();
	}

	@Test
	void isReservationAvailableReturnsFalseWhenSoldOut() throws Exception {
		LocalDateTime now = LocalDateTime.of(2026, 7, 8, 12, 0);
		ReservationProduct reservationProduct = reservationProduct(
				now.minusDays(1),
				now.plusDays(30),
				ReservationStatus.OPEN,
				5,
				5
		);

		assertThat(reservationProduct.isReservationAvailable(now)).isFalse();
	}

	private static ReservationProduct reservationProduct(
			LocalDateTime startAt,
			LocalDateTime endAt,
			ReservationStatus status,
			int reservationQuantity,
			int reservedQuantity
	) throws Exception {
		Product product = newEntity(Product.class);

		ReservationProduct reservationProduct = newEntity(ReservationProduct.class);
		setField(reservationProduct, "product", product);
		setField(reservationProduct, "reservationStartAt", startAt);
		setField(reservationProduct, "reservationEndAt", endAt);
		setField(reservationProduct, "expectedReleaseAt", endAt);
		setField(reservationProduct, "reservationQuantity", reservationQuantity);
		setField(reservationProduct, "reservedQuantity", reservedQuantity);
		setField(reservationProduct, "reservationStatus", status);
		return reservationProduct;
	}

	private static <T> T newEntity(Class<T> type) throws Exception {
		Constructor<T> constructor = type.getDeclaredConstructor();
		constructor.setAccessible(true);
		return constructor.newInstance();
	}

	private static void setField(Object target, String fieldName, Object value) throws Exception {
		Field field = target.getClass().getDeclaredField(fieldName);
		field.setAccessible(true);
		field.set(target, value);
	}
}
