package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.entity.Delivery;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.DeliveryStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;

public final class OrderActionPolicy {

	private OrderActionPolicy() {
	}

	public static boolean isCancelable(Order order) {
		OrderStatus orderStatus = order.getOrderStatus();
		if (orderStatus != OrderStatus.PAID && orderStatus != OrderStatus.PREPARING) {
			return false;
		}

		Delivery delivery = order.getDelivery();
		if (delivery == null) {
			return false;
		}

		DeliveryStatus deliveryStatus = delivery.getDeliveryStatus();
		return deliveryStatus == DeliveryStatus.READY || deliveryStatus == DeliveryStatus.PREPARING;
	}

	public static boolean isChangeableAddress(Order order) {
		if (order.getOrderStatus() != OrderStatus.PAID) {
			return false;
		}

		Delivery delivery = order.getDelivery();
		return delivery != null && delivery.getDeliveryStatus() == DeliveryStatus.READY;
	}
}
