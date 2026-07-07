package com.spharos.manbanjalbu_be.domain.order.support;

import com.spharos.manbanjalbu_be.domain.product.entity.Category;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.entity.ProductPolicy;
import com.spharos.manbanjalbu_be.domain.product.enums.ProductStatus;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductPolicyRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public final class OrderTestSupport {

	private OrderTestSupport() {
	}

	public static String registerAndLogin(MockMvc mockMvc, String loginId, String email) throws Exception {
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
								  "name":"주문테스트",
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

	public static long createAddress(MockMvc mockMvc, String accessToken, String deliveryMemo) throws Exception {
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
								  "deliveryMemo":"%s"
								}
								""".formatted(deliveryMemo == null ? "" : deliveryMemo)))
				.andExpect(status().isOk())
				.andReturn();

		Number addressId = com.jayway.jsonpath.JsonPath.read(
				addressResult.getResponse().getContentAsString(),
				"$.data.id"
		);
		return addressId.longValue();
	}

	public static long addToCart(MockMvc mockMvc, String accessToken, long productId, int quantity) throws Exception {
		mockMvc.perform(post("/api/cart")
						.header("Authorization", "Bearer " + accessToken)
						.contentType(MediaType.APPLICATION_JSON)
						.content("""
								{"productId":%d,"quantity":%d}
								""".formatted(productId, quantity)))
				.andExpect(status().isOk());

		MvcResult cartResult = mockMvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get("/api/cart")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andReturn();

		Number cartItemId = com.jayway.jsonpath.JsonPath.read(
				cartResult.getResponse().getContentAsString(),
				"$.data.cartItems[0].cartItemId"
		);
		return cartItemId.longValue();
	}

	public static Product saveProduct(
			CategoryRepository categoryRepository,
			ProductPolicyRepository productPolicyRepository,
			ProductRepository productRepository,
			String name,
			int price
	) throws Exception {
		return saveProduct(
				categoryRepository,
				productPolicyRepository,
				productRepository,
				name,
				price,
				ProductStatus.ON_SALE
		);
	}

	public static Product saveProduct(
			CategoryRepository categoryRepository,
			ProductPolicyRepository productPolicyRepository,
			ProductRepository productRepository,
			String name,
			int price,
			ProductStatus status
	) throws Exception {
		Category category = newEntity(Category.class);
		setField(category, "name", "MD-" + name);
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
		setField(product, "status", status);
		return productRepository.save(product);
	}

	public static void updateProductStatus(ProductRepository productRepository, Product product, ProductStatus status)
			throws Exception {
		setField(product, "status", status);
		productRepository.save(product);
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
