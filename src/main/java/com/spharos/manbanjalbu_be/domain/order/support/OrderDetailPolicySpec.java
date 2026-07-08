package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.order.dto.response.OrderDetailPolicyResponse;

/**
 * 주문 상세 하단 정책 안내. 주문별 스냅샷이 아닌 사이트 공통(관리자/정적) 정책이다.
 */
public final class OrderDetailPolicySpec {

	private OrderDetailPolicySpec() {
	}

	public static final String REFUND_INFO =
			"주문 취소는 상품 준비 전까지 가능합니다.\n취소 완료 후 결제 수단에 따라 환불 처리 기간이 달라질 수 있습니다.";

	public static final String EXCHANGE_INFO =
			"상품 수령 후 7일 이내 교환/반품이 가능합니다.\n단, 상품 특성상 교환/반품이 제한될 수 있습니다.";

	public static final String DELIVERY_INFO =
			"배송은 주문 완료 후 영업일 기준 2~3일 소요됩니다.\n도서산간 지역은 추가 배송비가 발생할 수 있습니다.";

	public static OrderDetailPolicyResponse toResponse() {
		return new OrderDetailPolicyResponse(REFUND_INFO, EXCHANGE_INFO, DELIVERY_INFO);
	}
}
