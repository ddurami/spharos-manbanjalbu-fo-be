package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.order.support.OrderTestSupport;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
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

import java.lang.reflect.Field;
import java.time.LocalDate;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class OrderListControllerIntegrationTest {

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
	void rejectGetOrdersWhenUnauthenticated() throws Exception {
		mockMvc.perform(get("/api/orders"))
				.andExpect(status().isForbidden());
	}

	@Test
	@Transactional
	void getOrdersReturnsEmptyListWhenNoOrders() throws Exception {
		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderlist10001", "orderlist10001@test.com");

		mockMvc.perform(get("/api/orders")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.orders").isArray())
				.andExpect(jsonPath("$.data.orders.length()").value(0))
				.andExpect(jsonPath("$.data.currentPage").value(0))
				.andExpect(jsonPath("$.data.totalPages").value(0))
				.andExpect(jsonPath("$.data.totalElements").value(0));
	}

	@Test
	@Transactional
	void getOrdersReturnsCreatedOrderWithResponseContract() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"클래식 넛츠 타르트", 30_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderlist10002", "orderlist10002@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, "문 앞");
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 2);

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

		String orderNo = com.jayway.jsonpath.JsonPath.read(
				createResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);

		mockMvc.perform(get("/api/orders?period=1M")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.orders.length()").value(1))
				.andExpect(jsonPath("$.data.orders[0].orderNo").value(orderNo))
				.andExpect(jsonPath("$.data.orders[0].orderName").value("클래식 넛츠 타르트"))
				.andExpect(jsonPath("$.data.orders[0].orderStatus").value("PENDING"))
				.andExpect(jsonPath("$.data.orders[0].orderType").value("DELIVERY"))
				.andExpect(jsonPath("$.data.orders[0].orderAmount").value(60_000))
				.andExpect(jsonPath("$.data.orders[0].orderedAt").exists())
				.andExpect(jsonPath("$.data.orders[0].paymentStatus").value("READY"))
				.andExpect(jsonPath("$.data.orders[0].deliveryStatus").value("READY"))
				.andExpect(jsonPath("$.data.orders[0].cancelable").value(false))
				.andExpect(jsonPath("$.data.currentPage").value(0))
				.andExpect(jsonPath("$.data.totalElements").value(1));
	}

	@Test
	@Transactional
	void rejectGetOrdersWhenPeriodIsInvalid() throws Exception {
		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderlist10003", "orderlist10003@test.com");

		mockMvc.perform(get("/api/orders?period=INVALID")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.INVALID_INPUT.getMessage()));
	}

	@Test
	@Transactional
	void getOrdersExcludesCancelledOrdersByDefault() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"취소대상상품", 10_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderlist10004", "orderlist10004@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);

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

		String orderNo = com.jayway.jsonpath.JsonPath.read(
				createResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);

		Order order = orderRepository.findByOrderNo(orderNo).orElseThrow();
		setField(order, "orderStatus", OrderStatus.CANCELLED);
		orderRepository.saveAndFlush(order);

		mockMvc.perform(get("/api/orders?period=ALL")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.orders.length()").value(0));
	}

	@Test
	@Transactional
	void getOrdersFiltersByOrderType() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"예약상품", 12_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderlist10005", "orderlist10005@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);

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

		String orderNo = com.jayway.jsonpath.JsonPath.read(
				createResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);

		Order order = orderRepository.findByOrderNo(orderNo).orElseThrow();
		setField(order, "orderType", OrderType.RESERVATION);
		setField(order, "reservationDeliveryDate", LocalDate.now().plusDays(3));
		orderRepository.saveAndFlush(order);

		mockMvc.perform(get("/api/orders?period=ALL&orderType=RESERVATION")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.orders.length()").value(1))
				.andExpect(jsonPath("$.data.orders[0].orderType").value("RESERVATION"));

		mockMvc.perform(get("/api/orders?period=ALL&orderType=DELIVERY")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.orders.length()").value(0));
	}

	private static void setField(Object target, String fieldName, Object value) throws Exception {
		Field field = target.getClass().getDeclaredField(fieldName);
		field.setAccessible(true);
		field.set(target, value);
	}
}
