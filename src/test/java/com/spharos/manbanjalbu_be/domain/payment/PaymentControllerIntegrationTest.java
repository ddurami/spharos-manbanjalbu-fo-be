package com.spharos.manbanjalbu_be.domain.payment;

import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberPaymentMethod;
import com.spharos.manbanjalbu_be.domain.member.enums.CardType;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberPaymentMethodRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.order.support.OrderTestSupport;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductPolicyRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class PaymentControllerIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductPolicyRepository productPolicyRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private MemberPaymentMethodRepository memberPaymentMethodRepository;

	@Test
	@Transactional
	void payOrderWithMockCard() throws Exception {
		String loginId = "payctrl01";
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"결제 테스트 상품 A", 35_000
		);
		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, loginId, "payctrl01@test.com");

		Member member = memberRepository.findByLoginId(loginId).orElseThrow();
		MemberPaymentMethod card = memberPaymentMethodRepository.save(MemberPaymentMethod.createMockCard(
				member,
				"스타벅스 카드",
				"스타벅스",
				CardType.VISA,
				"**** **** **** 1234",
				"1234",
				null,
				true
		));

		String orderNo = createOrder(accessToken, product);

		mockMvc.perform(get("/api/cards")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.length()").value(1))
				.andExpect(jsonPath("$.data[0].cardName").value("스타벅스 카드"));

		MvcResult payResult = mockMvc.perform(post("/api/payments")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "orderNo": "%s",
								  "cardId": %d
								}
								""".formatted(orderNo, card.getId())))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.paymentStatus").value("SUCCESS"))
				.andExpect(jsonPath("$.data.orderNo").value(orderNo))
				.andExpect(jsonPath("$.data.paidAmount").value(35_000))
				.andExpect(jsonPath("$.data.approvedNumber").value(org.hamcrest.Matchers.startsWith("APP")))
				.andExpect(jsonPath("$.data.pgName").value("MOCK"))
				.andReturn();

		Number paymentId = com.jayway.jsonpath.JsonPath.read(
				payResult.getResponse().getContentAsString(),
				"$.data.paymentId"
		);
		Number orderId = com.jayway.jsonpath.JsonPath.read(
				payResult.getResponse().getContentAsString(),
				"$.data.orderId"
		);

		mockMvc.perform(get("/api/payments/" + paymentId)
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.paymentStatus").value("SUCCESS"));

		mockMvc.perform(get("/api/orders/" + orderId + "/payment")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.paymentStatus").value("SUCCESS"));

		mockMvc.perform(post("/api/payments")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "orderNo": "%s",
								  "cardId": %d
								}
								""".formatted(orderNo, card.getId())))
				.andExpect(status().isConflict())
				.andExpect(jsonPath("$.message").value("이미 결제가 완료된 주문입니다."));
	}

	@Test
	@Transactional
	void rejectPaymentWithBlockedCard() throws Exception {
		String loginId = "payctrl02";
		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"결제 테스트 상품 B", 35_000
		);
		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, loginId, "payctrl02@test.com");

		Member member = memberRepository.findByLoginId(loginId).orElseThrow();
		MemberPaymentMethod card = MemberPaymentMethod.createMockCard(
				member,
				"신한 VISA",
				"신한",
				CardType.VISA,
				"**** **** **** 5678",
				"5678",
				null,
				true
		);
		card.markBlocked();
		card = memberPaymentMethodRepository.save(card);

		String orderNo = createOrder(accessToken, product);

		mockMvc.perform(post("/api/payments")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "orderNo": "%s",
								  "cardId": %d
								}
								""".formatted(orderNo, card.getId())))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.message").value("사용이 제한된 카드입니다."));
	}

	private String createOrder(String accessToken, Product product) throws Exception {
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, "문 앞");
		long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);

		MvcResult orderResult = mockMvc.perform(post("/api/orders")
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
				orderResult.getResponse().getContentAsString(),
				"$.data.orderNo"
		);
	}
}
