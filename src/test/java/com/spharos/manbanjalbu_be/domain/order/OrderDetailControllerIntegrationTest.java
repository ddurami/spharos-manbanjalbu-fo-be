package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.DeliveryStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.support.OrderDetailPolicySpec;
import com.spharos.manbanjalbu_be.domain.order.support.OrderTestSupport;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductMedia;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductMediaType;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductPolicyRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class OrderDetailControllerIntegrationTest {

	private static final String THUMBNAIL_URL = "https://example.com/tart.jpg";

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductPolicyRepository productPolicyRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Test
	void rejectGetOrderDetailWhenUnauthenticated() throws Exception {
		mockMvc.perform(get("/api/orders/ORD-NOT-FOUND"))
				.andExpect(status().isForbidden());
	}

	@Test
	@Transactional
	void rejectGetOrderDetailWhenOrderNotFound() throws Exception {
		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20001", "orderdetail20001@test.com");

		mockMvc.perform(get("/api/orders/ORD-NOT-EXISTS")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.ORDER_NOT_FOUND.getMessage()));
	}

	@Test
	@Transactional
	void rejectGetOrderDetailWhenOrderBelongsToAnotherMember() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"타인주문상품", 10_000
		);

		String ownerToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20002", "orderdetail20002@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, ownerToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, ownerToken, product.getId(), 1);
		String orderNo = createOrder(ownerToken, cartItemId, addressId);

		String otherToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20003", "orderdetail20003@test.com");

		mockMvc.perform(get("/api/orders/" + orderNo)
						.header("Authorization", "Bearer " + otherToken))
				.andExpect(status().isForbidden())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.ORDER_UNAUTHORIZED.getMessage()));
	}

	@Test
	@Transactional
	void getOrderDetailReturnsSnapshotFields() throws Exception {
		Product productA = saveProductWithThumbnail("클래식 넛츠 타르트", 15_000, THUMBNAIL_URL);
		Product productB = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"시그니처 초콜릿 케이크", 15_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20004", "orderdetail20004@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		OrderTestSupport.addToCart(mockMvc, accessToken, productA.getId(), 1);
		OrderTestSupport.addToCart(mockMvc, accessToken, productB.getId(), 1);
		long cartItemA = getCartItemId(mockMvc, accessToken, productA.getId());
		long cartItemB = getCartItemId(mockMvc, accessToken, productB.getId());
		String orderNo = createOrder(accessToken, cartItemA, cartItemB, addressId);

		mockMvc.perform(get("/api/orders/" + orderNo)
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.orderNo").value(orderNo))
				.andExpect(jsonPath("$.data.orderName").value("클래식 넛츠 타르트 외 1건"))
				.andExpect(jsonPath("$.data.orderStatus").value("PENDING"))
				.andExpect(jsonPath("$.data.orderType").value("DELIVERY"))
				.andExpect(jsonPath("$.data.orderAmount").value(30_000))
				.andExpect(jsonPath("$.data.orderedAt").exists())
				.andExpect(jsonPath("$.data.thumbnailUrl").value(THUMBNAIL_URL))
				.andExpect(jsonPath("$.data.reservationDeliveryDate").isEmpty())
				.andExpect(jsonPath("$.data.items.length()").value(2))
				.andExpect(jsonPath("$.data.items[0].productName").value("클래식 넛츠 타르트"))
				.andExpect(jsonPath("$.data.items[0].unitPrice").value(15_000))
				.andExpect(jsonPath("$.data.items[0].lineAmount").value(15_000))
				.andExpect(jsonPath("$.data.items[0].thumbnailUrl").value(THUMBNAIL_URL))
				.andExpect(jsonPath("$.data.items[1].productName").value("시그니처 초콜릿 케이크"))
				.andExpect(jsonPath("$.data.payment.orderAmount").value(30_000))
				.andExpect(jsonPath("$.data.payment.productAmount").value(30_000))
				.andExpect(jsonPath("$.data.payment.deliveryFee").value(0))
				.andExpect(jsonPath("$.data.payment.discountAmount").value(0))
				.andExpect(jsonPath("$.data.payment.paidAmount").value(30_000))
				.andExpect(jsonPath("$.data.payment.paymentMethod").value("CARD"))
				.andExpect(jsonPath("$.data.payment.paymentStatus").value("READY"))
				.andExpect(jsonPath("$.data.deliveryAddress.recipientName").value("홍길동"))
				.andExpect(jsonPath("$.data.deliveryAddress.addressName").value("집"))
				.andExpect(jsonPath("$.data.deliveryAddress.zipcode").value("06236"))
				.andExpect(jsonPath("$.data.deliveryAddress.baseAddress").value("서울 강남구 테헤란로 152"))
				.andExpect(jsonPath("$.data.deliveryAddress.detailAddress").value("101동 1001호"))
				.andExpect(jsonPath("$.data.deliveryAddress.phone1").value("01077778888"))
				.andExpect(jsonPath("$.data.deliveryAddress.isDefault").value(true))
				.andExpect(jsonPath("$.data.policy.refundInfo").value(OrderDetailPolicySpec.REFUND_INFO))
				.andExpect(jsonPath("$.data.policy.exchangeInfo").value(OrderDetailPolicySpec.EXCHANGE_INFO))
				.andExpect(jsonPath("$.data.policy.deliveryInfo").value(OrderDetailPolicySpec.DELIVERY_INFO))
				.andExpect(jsonPath("$.data.cancelable").value(false))
				.andExpect(jsonPath("$.data.changeableAddress").value(false));
	}

	@Test
	@Transactional
	void getOrderDetailReturnsCancelableTrueWhenPaidAndPreparing() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"취소가능상품", 20_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20005", "orderdetail20005@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);
		String orderNo = createOrder(accessToken, cartItemId, addressId);

		Order order = orderRepository.findByOrderNo(orderNo).orElseThrow();
		setField(order, "orderStatus", OrderStatus.PAID);
		orderRepository.saveAndFlush(order);

		mockMvc.perform(get("/api/orders/" + orderNo)
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cancelable").value(true))
				.andExpect(jsonPath("$.data.changeableAddress").value(true));
	}

	@Test
	@Transactional
	void getOrderDetailReturnsCancelableFalseWhenShipping() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"취소불가상품", 20_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20006", "orderdetail20006@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);
		String orderNo = createOrder(accessToken, cartItemId, addressId);

		Order order = orderRepository.findByOrderNo(orderNo).orElseThrow();
		setField(order, "orderStatus", OrderStatus.SHIPPING);
		setField(order.getDelivery(), "deliveryStatus", DeliveryStatus.SHIPPING);
		orderRepository.saveAndFlush(order);

		mockMvc.perform(get("/api/orders/" + orderNo)
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cancelable").value(false))
				.andExpect(jsonPath("$.data.changeableAddress").value(false));
	}

	@Test
	@Transactional
	void getOrderDetailReturnsReservationDeliveryDateOnlyForReservationOrder() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"예약상품", 12_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderdetail20007", "orderdetail20007@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);
		String orderNo = createOrder(accessToken, cartItemId, addressId);

		Order order = orderRepository.findByOrderNo(orderNo).orElseThrow();
		setField(order, "orderType", OrderType.RESERVATION);
		setField(order, "reservationDeliveryDate", java.time.LocalDate.of(2026, 7, 15));
		orderRepository.saveAndFlush(order);

		mockMvc.perform(get("/api/orders/" + orderNo)
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.orderType").value("RESERVATION"))
				.andExpect(jsonPath("$.data.reservationDeliveryDate").value("2026-07-15"));
	}

	private long getCartItemId(MockMvc mockMvc, String accessToken, long productId) throws Exception {
		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andReturn();

		net.minidev.json.JSONArray cartItems = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems"
		);

		for (Object cartItem : cartItems) {
			Number itemProductId = com.jayway.jsonpath.JsonPath.read(cartItem, "$.productId");
			if (itemProductId.longValue() == productId) {
				Number cartItemId = com.jayway.jsonpath.JsonPath.read(cartItem, "$.cartItemId");
				return cartItemId.longValue();
			}
		}

		throw new IllegalStateException("Cart item not found for productId=" + productId);
	}

	private Product saveProductWithThumbnail(String name, int price, String thumbnailUrl) throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				name, price
		);

		ProductMedia media = newEntity(ProductMedia.class);
		setField(media, "product", product);
		setField(media, "mediaType", ProductMediaType.THUMBNAIL);
		setField(media, "mediaUrl", thumbnailUrl);
		setField(media, "displayOrder", 1);
		setField(media, "isMain", true);

		Field mediaListField = Product.class.getDeclaredField("mediaList");
		mediaListField.setAccessible(true);
		@SuppressWarnings("unchecked")
		java.util.List<ProductMedia> mediaList = (java.util.List<ProductMedia>) mediaListField.get(product);
		mediaList.add(media);
		return productRepository.saveAndFlush(product);
	}

	private String createOrder(String accessToken, long cartItemId, long addressId) throws Exception {
		MvcResult createResult = mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(cartItemId, addressId)))
				.andExpect(status().isOk())
				.andReturn();

		return com.jayway.jsonpath.JsonPath.read(
				createResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);
	}

	private String createOrder(String accessToken, long firstCartItemId, long secondCartItemId, long addressId)
			throws Exception {
		MvcResult createResult = mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d, %d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(firstCartItemId, secondCartItemId, addressId)))
				.andExpect(status().isOk())
				.andReturn();

		return com.jayway.jsonpath.JsonPath.read(
				createResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);
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
