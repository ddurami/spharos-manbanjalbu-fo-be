package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.cart.enums.CartActionType;
import com.spharos.manbanjalbu_be.domain.cart.repository.CartHistoryRepository;
import com.spharos.manbanjalbu_be.domain.order.entity.Order;
import com.spharos.manbanjalbu_be.domain.order.enums.DeliveryStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderStatus;
import com.spharos.manbanjalbu_be.domain.order.enums.OrderType;
import com.spharos.manbanjalbu_be.domain.order.enums.PaymentStatus;
import com.spharos.manbanjalbu_be.domain.order.repository.OrderRepository;
import com.spharos.manbanjalbu_be.domain.payment.entity.PaymentHistory;
import com.spharos.manbanjalbu_be.domain.payment.enums.PaymentHistoryStatus;
import com.spharos.manbanjalbu_be.domain.payment.repository.PaymentHistoryRepository;
import com.spharos.manbanjalbu_be.domain.product.entity.Category;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductPolicy;
import com.spharos.manbanjalbu_be.domain.product.entity.ReservationProduct;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.enums.ReservationStatus;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductPolicyRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ReservationProductRepository;
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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class OrderCreateIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductPolicyRepository productPolicyRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ReservationProductRepository reservationProductRepository;

	@Autowired
	private OrderRepository orderRepository;

	@Autowired
	private CartHistoryRepository cartHistoryRepository;

	@Autowired
	private PaymentHistoryRepository paymentHistoryRepository;

	@Test
	@Transactional
	void createOrderFromCartItems() throws Exception {
		Product firstProduct = saveProduct("클래식 넛츠 타르트", 30_000);
		Product secondProduct = saveProduct("스타벅스 머그", 25_000);

		String accessToken = registerAndLogin("ordercreate99", "ordercreate99@test.com");

		MvcResult addressResult = mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"집",
								  "recipientName":"홍길동",
								  "zipcode":"06236",
								  "baseAddress":"서울 강남구 테헤란로 152",
								  "detailAddress":"101동 1001호",
								  "phone1":"01077778888",
								  "deliveryMemo":"문 앞"
								}
								"""))
				.andExpect(status().isOk())
				.andReturn();

		Number addressId = com.jayway.jsonpath.JsonPath.read(
				addressResult.getResponse().getContentAsString(),
				"$.data.id"
		);

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":1}
								""".formatted(firstProduct.getId())))
				.andExpect(status().isOk());

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":2}
								""".formatted(secondProduct.getId())))
				.andExpect(status().isOk());

		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andReturn();

		Number firstCartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[0].cartItemId"
		);
		Number secondCartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[1].cartItemId"
		);

		MvcResult orderResult = mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d, %d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD",
								  "deliveryMemo": "문 앞에 놓아주세요"
								}
								""".formatted(
								firstCartItemId.longValue(),
								secondCartItemId.longValue(),
								addressId.longValue()
						)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andExpect(jsonPath("$.data.orderStatus").value("PENDING"))
				.andExpect(jsonPath("$.data.amount").value(80_000))
				.andExpect(jsonPath("$.data.deliveryFee").value(0))
				.andExpect(jsonPath("$.data.orderAmount").value(80_000))
				.andExpect(jsonPath("$.data.paymentStatus").value("READY"))
				.andReturn();

		String orderNo = com.jayway.jsonpath.JsonPath.read(
				orderResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);
		String orderName = com.jayway.jsonpath.JsonPath.read(
				orderResult.getResponse().getContentAsString(),
				"$.data.orderName"
		);
		String paymentNo = com.jayway.jsonpath.JsonPath.read(
				orderResult.getResponse().getContentAsString(),
				"$.data.paymentNo"
		);

		assertThat(orderNo).startsWith("ORD");
		assertThat(paymentNo).startsWith("PAY");
		assertThat(orderName).contains("외 1건");

		Order savedOrder = orderRepository.findByOrderNo(orderNo).orElseThrow();
		assertThat(savedOrder.getOrderStatus()).isEqualTo(OrderStatus.PENDING);
		assertThat(savedOrder.getRecipientName()).isEqualTo("홍길동");
		assertThat(savedOrder.getDeliveryMemo()).isEqualTo("문 앞에 놓아주세요");
		assertThat(savedOrder.getItems()).hasSize(2);
		assertThat(savedOrder.getPayment().getStatus()).isEqualTo(PaymentStatus.READY);
		assertThat(savedOrder.getPayment().getAmount()).isEqualTo(80_000);
		assertThat(savedOrder.getDelivery().getDeliveryStatus()).isEqualTo(DeliveryStatus.READY);

		assertThat(paymentHistoryRepository.findByPayment_PaymentIdOrderByCreatedAtAsc(
				savedOrder.getPayment().getPaymentId()))
				.hasSize(1)
				.first()
				.extracting(PaymentHistory::getHistoryStatus)
				.isEqualTo(PaymentHistoryStatus.READY);

		mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cartItems.length()").value(0));

		List<com.spharos.manbanjalbu_be.domain.cart.entity.CartHistory> histories =
				cartHistoryRepository.findByMember_IdAndActionType(
						savedOrder.getMember().getId(),
						CartActionType.ORDER_COMPLETED
				);
		assertThat(histories).hasSize(2);
		assertThat(histories).allMatch(history -> orderNo.equals(history.getMemo()));
		assertThat(histories).allMatch(history -> history.getAfterQuantity() == 0);
	}

	@Test
	@Transactional
	void createReservationOrderStoresReservationDeliveryDate() throws Exception {
		Product product = saveProduct("예약 배송 상품", 20_000);
		saveReservationProduct(product);
		String accessToken = registerAndLogin("orderreservation01", "orderreservation01@test.com");
		LocalDate reservationDate = LocalDate.now().plusDays(7);

		MvcResult addressResult = mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"집",
								  "recipientName":"홍길동",
								  "zipcode":"06236",
								  "baseAddress":"서울 강남구",
								  "detailAddress":"101동",
								  "phone1":"01077776666"
								}
								"""))
				.andExpect(status().isOk())
				.andReturn();

		Number addressId = com.jayway.jsonpath.JsonPath.read(
				addressResult.getResponse().getContentAsString(),
				"$.data.id"
		);

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":1}
								""".formatted(product.getId())))
				.andExpect(status().isOk());

		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cartItems[0].reservationAvailable").value(true))
				.andReturn();

		Number cartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[0].cartItemId"
		);

		MvcResult orderResult = mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD",
								  "orderType": "RESERVATION",
								  "reservationDeliveryDate": "%s"
								}
								""".formatted(
								cartItemId.longValue(),
								addressId.longValue(),
								reservationDate
						)))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.success").value(true))
				.andReturn();

		String orderNo = com.jayway.jsonpath.JsonPath.read(
				orderResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);

		Order savedOrder = orderRepository.findByOrderNo(orderNo).orElseThrow();
		assertThat(savedOrder.getOrderType()).isEqualTo(OrderType.RESERVATION);
		assertThat(savedOrder.getReservationDeliveryDate()).isEqualTo(reservationDate);
	}

	@Test
	@Transactional
	void createReservationOrderWithoutDateReturnsBadRequest() throws Exception {
		Product product = saveProduct("예약 배송 검증 상품", 15_000);
		String accessToken = registerAndLogin("orderreservation02", "orderreservation02@test.com");

		MvcResult addressResult = mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"집",
								  "recipientName":"홍길동",
								  "zipcode":"06236",
								  "baseAddress":"서울 강남구",
								  "detailAddress":"101동",
								  "phone1":"01066665555"
								}
								"""))
				.andExpect(status().isOk())
				.andReturn();

		Number addressId = com.jayway.jsonpath.JsonPath.read(
				addressResult.getResponse().getContentAsString(),
				"$.data.id"
		);

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":1}
								""".formatted(product.getId())))
				.andExpect(status().isOk());

		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andReturn();

		Number cartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[0].cartItemId"
		);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD",
								  "orderType": "RESERVATION"
								}
								""".formatted(cartItemId.longValue(), addressId.longValue())))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.message").value("예약 배송일을 선택해 주세요."));
	}

	@Test
	@Transactional
	void createReservationOrderWithUnavailableProductReturnsBadRequest() throws Exception {
		Product product = saveProduct("예약 불가 상품", 12_000);
		String accessToken = registerAndLogin("orderreservation03", "orderreservation03@test.com");
		LocalDate reservationDate = LocalDate.now().plusDays(5);

		MvcResult addressResult = mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"집",
								  "recipientName":"홍길동",
								  "zipcode":"06236",
								  "baseAddress":"서울 강남구",
								  "detailAddress":"101동",
								  "phone1":"01055554444"
								}
								"""))
				.andExpect(status().isOk())
				.andReturn();

		Number addressId = com.jayway.jsonpath.JsonPath.read(
				addressResult.getResponse().getContentAsString(),
				"$.data.id"
		);

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":1}
								""".formatted(product.getId())))
				.andExpect(status().isOk());

		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cartItems[0].reservationAvailable").value(false))
				.andReturn();

		Number cartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[0].cartItemId"
		);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD",
								  "orderType": "RESERVATION",
								  "reservationDeliveryDate": "%s"
								}
								""".formatted(
								cartItemId.longValue(),
								addressId.longValue(),
								reservationDate
						)))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.message").value("예약 배송이 불가능한 상품입니다."));
	}

	@Test
	@Transactional
	void createOrderRemovesOnlySelectedCartItems() throws Exception {
		Product orderedProduct = saveProduct("주문 상품", 10_000);
		Product remainingProduct = saveProduct("남는 상품", 5_000);

		String accessToken = registerAndLogin("ordercreate98", "ordercreate98@test.com");

		MvcResult addressResult = mockMvc.perform(post("/api/member/addresses")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "addressName":"집",
								  "recipientName":"홍길동",
								  "zipcode":"06236",
								  "baseAddress":"서울 강남구",
								  "detailAddress":"101동",
								  "phone1":"01088887777"
								}
								"""))
				.andExpect(status().isOk())
				.andReturn();

		Number addressId = com.jayway.jsonpath.JsonPath.read(
				addressResult.getResponse().getContentAsString(),
				"$.data.id"
		);

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":1}
								""".formatted(remainingProduct.getId())))
				.andExpect(status().isOk());

		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":1}
								""".formatted(orderedProduct.getId())))
				.andExpect(status().isOk());

		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andReturn();

		Number orderedCartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[0].cartItemId"
		);

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [%d],
								  "memberAddressId": %d,
								  "paymentMethod": "CARD"
								}
								""".formatted(orderedCartItemId.longValue(), addressId.longValue())))
				.andExpect(status().isOk());

		mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.cartItems.length()").value(1))
				.andExpect(jsonPath("$.data.cartItems[0].productId").value(remainingProduct.getId().intValue()));
	}

	private Product saveProduct(String name, int price) throws Exception {
		Category category = newEntity(Category.class);
		setField(category, "name", "MD");
		setField(category, "depth", 1);
		category = categoryRepository.save(category);

		ProductPolicy policy = newEntity(ProductPolicy.class);
		setField(policy, "title", "기본 정책");
		setField(policy, "deliveryInfo", "배송 안내");
		setField(policy, "exchangeInfo", "교환 안내");
		setField(policy, "refundInfo", "환불 안내");
		policy = productPolicyRepository.save(policy);

		Product product = newEntity(Product.class);
		setField(product, "category", category);
		setField(product, "policy", policy);
		setField(product, "name", name);
		setField(product, "price", price);
		setField(product, "status", ProductStatus.ON_SALE);
		return productRepository.save(product);
	}

	private ReservationProduct saveReservationProduct(Product product) throws Exception {
		LocalDateTime now = LocalDateTime.now();
		ReservationProduct reservationProduct = newEntity(ReservationProduct.class);
		setField(reservationProduct, "product", product);
		setField(reservationProduct, "reservationStartAt", now.minusDays(1));
		setField(reservationProduct, "reservationEndAt", now.plusMonths(1));
		setField(reservationProduct, "expectedReleaseAt", now.plusMonths(1));
		setField(reservationProduct, "reservationQuantity", 100);
		setField(reservationProduct, "reservedQuantity", 0);
		setField(reservationProduct, "reservationStatus", ReservationStatus.OPEN);
		return reservationProductRepository.save(reservationProduct);
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

	private String registerAndLogin(String loginId, String email) throws Exception {
		String digits = loginId.replaceAll("\\D", "");
		long suffix = digits.isEmpty() ? 1 : Long.parseLong(digits);
		String phone = "010" + String.format("%08d", suffix % 100_000_000L);

		MvcResult sendResult = mockMvc.perform(post("/api/member/auth/email/send")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"email":"%s"}
								""".formatted(email)))
				.andExpect(status().isOk())
				.andReturn();

		String code = com.jayway.jsonpath.JsonPath.read(
				sendResult.getResponse().getContentAsString(),
				"$.data.devCode"
		);

		MvcResult verifyResult = mockMvc.perform(post("/api/member/auth/email/verify")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"email":"%s","code":"%s"}
								""".formatted(email, code)))
				.andExpect(status().isOk())
				.andReturn();

		String verificationToken = com.jayway.jsonpath.JsonPath.read(
				verifyResult.getResponse().getContentAsString(),
				"$.data.verificationToken"
		);

		mockMvc.perform(post("/api/member/join/terms")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "agreements":[
								    {"termsId":1,"agreed":true},
								    {"termsId":2,"agreed":true},
								    {"termsId":3,"agreed":true},
								    {"termsId":4,"agreed":false}
								  ]
								}
								""".formatted(verificationToken)))
				.andExpect(status().isOk());

		mockMvc.perform(post("/api/member/join")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "verificationToken":"%s",
								  "loginId":"%s",
								  "password":"Abcdef1!",
								  "name":"주문생성",
								  "birthDate":"1990-01-01",
								  "phone":"%s",
								  "email":"%s"
								}
								""".formatted(verificationToken, loginId, phone, email)))
				.andExpect(status().isOk());

		MvcResult loginResult = mockMvc.perform(post("/api/member/login")
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"loginId":"%s","password":"Abcdef1!"}
								""".formatted(loginId)))
				.andExpect(status().isOk())
				.andReturn();

		return com.jayway.jsonpath.JsonPath.read(
				loginResult.getResponse().getContentAsString(),
				"$.data.accessToken"
		);
	}

}
