package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.order.support.OrderTestSupport;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
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
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * Phase 5: POST /api/orders Controller 통합(E2E) 테스트.
 */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class OrderControllerIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductPolicyRepository productPolicyRepository;

	@Autowired
	private ProductRepository productRepository;

	@Test
	@Transactional
	void createOrderReturnsCompleteResponseContract() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"콜드브루 텀블러", 35_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl01", "orderctrl01@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, "문 앞");
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 2);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "MOBILE",
								  "deliveryMemo": "경비실에 맡겨주세요"
								}
								""".formatted(cartItemId, addressId)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.message").value("주문이 생성되었습니다."))
				.andExpect(jsonPath("$.data.orderId").isNumber())
				.andExpect(jsonPath("$.data.orderNo").value(org.hamcrest.Matchers.startsWith("ORD")))
				.andExpect(jsonPath("$.data.orderName").value("콜드브루 텀블러"))
				.andExpect(jsonPath("$.data.orderStatus").value("PENDING"))
				.andExpect(jsonPath("$.data.amount").value(70_000))
				.andExpect(jsonPath("$.data.deliveryFee").value(0))
				.andExpect(jsonPath("$.data.orderAmount").value(70_000))
				.andExpect(jsonPath("$.data.paymentStatus").value("READY"))
				.andExpect(jsonPath("$.data.paymentNo").value(org.hamcrest.Matchers.startsWith("PAY")));
	}

	@Test
	@Transactional
	void createOrderUsesAddressDeliveryMemoWhenRequestMemoMissing() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"머그컵", 12_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl02", "orderctrl02@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, "부재 시 연락");
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "EASY_PAY"
								}
								""".formatted(cartItemId, addressId)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.orderAmount").value(12_000));
	}

	@Test
	@Transactional
	void rejectOrderCreateWhenAddressNotFound() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"키링", 8_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl03", "orderctrl03@test.com");
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": 99999,
								  "paymentMethod": "CARD"
								}
								""".formatted(cartItemId)))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.MEMBER_ADDRESS_NOT_FOUND.getMessage()));
	}

	@Test
	@Transactional
	void rejectOrderCreateWhenCartItemNotFound() throws Exception {
		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl04", "orderctrl04@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [99999],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(addressId)))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.CART_ITEM_NOT_FOUND.getMessage()));
	}

	@Test
	@Transactional
	void rejectOrderCreateWhenCartItemBelongsToAnotherMember() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"다른회원상품", 15_000
		);

		String ownerToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl05", "orderctrl05@test.com");
		long ownerCartItemId = OrderTestSupport.addToCart(mockMvc, ownerToken, product.getId(), 1);

		String otherToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl06", "orderctrl06@test.com");
		long otherAddressId = OrderTestSupport.createAddress(mockMvc, otherToken, null);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + otherToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(ownerCartItemId, otherAddressId)))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.CART_ITEM_NOT_FOUND.getMessage()));
	}

	@Test
	@Transactional
	void rejectOrderCreateWhenProductNotOnSale() throws Exception {
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"품절상품", 20_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl07", "orderctrl07@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);

		OrderTestSupport.updateProductStatus(productRepository, product, ProductStatus.SOLD_OUT);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(cartItemId, addressId)))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.message").value(ErrorCode.PRODUCT_NOT_ON_SALE.getMessage()));
	}

	@Test
	@Transactional
	void createOrderDoesNotRemoveUnorderedCartItems() throws Exception {
		Product orderedProduct = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"주문할상품", 10_000
		);
		Product remainingProduct = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"남을상품", 5_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderctrl08", "orderctrl08@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);
		OrderTestSupport.addToCart(mockMvc, accessToken, remainingProduct.getId(), 1);
		long orderedCartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, orderedProduct.getId(), 1);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(orderedCartItemId, addressId)))
				.andExpect(status().isOk());

		mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cartItems.length()").value(1))
				.andExpect(jsonPath("$.data.cartItems[0].productId").value(remainingProduct.getId().intValue()));
	}

}
