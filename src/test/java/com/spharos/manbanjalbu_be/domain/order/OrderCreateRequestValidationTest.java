package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.order.enums.PaymentMethod;
import com.spharos.manbanjalbu_be.domain.order.support.CheckoutPaymentMethodMapper;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class OrderCreateRequestValidationTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void rejectOrderCreateWithoutAuth() throws Exception {
		mockMvc.perform(post("/api/orders")
						.contentType(MediaType.APPLICATION_JSON)
						.content(validOrderRequestJson()))
				.andExpect(status().isForbidden());
	}

	@Test
	void rejectOrderCreateWithEmptyCartItemIds() throws Exception {
		String accessToken = registerAndLogin("ordervalidate01", "ordervalidate01@test.com");

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [],
								  "memberAddressId": 1,
								  "paymentMethod": "CARD"
								}
								"""))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void rejectOrderCreateWithoutMemberAddressId() throws Exception {
		String accessToken = registerAndLogin("ordervalidate02", "ordervalidate02@test.com");

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [1],
								  "paymentMethod": "CARD"
								}
								"""))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void rejectOrderCreateWithoutPaymentMethod() throws Exception {
		String accessToken = registerAndLogin("ordervalidate03", "ordervalidate03@test.com");

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{
								  "cartItemIds": [1],
								  "memberAddressId": 1
								}
								"""))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void authenticatedValidRequestFailsWhenCartItemsDoNotExist() throws Exception {
		String accessToken = registerAndLogin("ordervalidate04", "ordervalidate04@test.com");

		mockMvc.perform(post("/api/orders")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content(validOrderRequestJson()))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.success").value(false));
	}

	@ParameterizedTest
	@CsvSource({
			"credit-card, CARD",
			"ssgpay, MOBILE",
			"simple-pay, EASY_PAY",
			"starbucks-card, EASY_PAY"
	})
	void mapFrontendPaymentMethodToBackend(String frontendValue, PaymentMethod expected) {
		assertThat(CheckoutPaymentMethodMapper.fromFrontendValue(frontendValue))
				.isEqualTo(expected);
	}

	@Test
	void rejectUnknownFrontendPaymentMethod() {
		assertThatThrownBy(() -> CheckoutPaymentMethodMapper.fromFrontendValue("unknown"))
				.isInstanceOf(BusinessException.class)
				.satisfies(exception ->
						assertThat(((BusinessException) exception).getErrorCode())
								.isEqualTo(ErrorCode.ORDER_PAYMENT_METHOD_INVALID));
	}

	private String validOrderRequestJson() {
		return """
				{
				  "cartItemIds": [1, 2],
				  "memberAddressId": 3,
				  "paymentMethod": "CARD",
				  "deliveryMemo": "문 앞에 놓아주세요"
				}
				""";
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
								  "name":"주문검증",
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
