package com.spharos.manbanjalbu_be.domain.product.entity;

import com.spharos.manbanjalbu_be.domain.product.enums.ReservationStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(
		name = "reservation_product",
		uniqueConstraints = @UniqueConstraint(
				name = "uk_reservation_product_product_id",
				columnNames = "product_id"
		),
		indexes = {
				@Index(name = "idx_reservation_product_status", columnList = "reservation_status"),
				@Index(name = "idx_reservation_product_period", columnList = "reservation_status, reservation_start_at, reservation_end_at")
		}
)
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ReservationProduct {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;

	@Column(name = "reservation_start_at", nullable = false)
	private LocalDateTime reservationStartAt;

	@Column(name = "reservation_end_at", nullable = false)
	private LocalDateTime reservationEndAt;

	@Column(name = "expected_release_at", nullable = false)
	private LocalDateTime expectedReleaseAt;

	@Column(name = "reservation_quantity", nullable = false)
	private int reservationQuantity;

	@Column(name = "reserved_quantity", nullable = false)
	private int reservedQuantity = 0;

	@Enumerated(EnumType.STRING)
	@Column(name = "reservation_status", nullable = false, length = 20)
	private ReservationStatus reservationStatus = ReservationStatus.READY;

	@CreationTimestamp
	@Column(name = "created_at", nullable = false, updatable = false)
	private LocalDateTime createdAt;

	@UpdateTimestamp
	@Column(name = "updated_at", nullable = false)
	private LocalDateTime updatedAt;

	public boolean isReservationAvailable(LocalDateTime at) {
		if (reservationStatus != ReservationStatus.READY && reservationStatus != ReservationStatus.OPEN) {
			return false;
		}

		if (at.isBefore(reservationStartAt) || at.isAfter(reservationEndAt)) {
			return false;
		}

		return getRemainingQuantity() > 0;
	}

	public int getRemainingQuantity() {
		return reservationQuantity - reservedQuantity;
	}

}
