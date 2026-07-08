package com.spharos.manbanjalbu_be.domain.order;

import com.spharos.manbanjalbu_be.domain.order.support.OrderTestSupport;
import com.spharos.manbanjalbu_be.domain.product.entity.Product;
import com.spharos.manbanjalbu_be.domain.product.repository.CategoryRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductPolicyRepository;
import com.spharos.manbanjalbu_be.domain.product.repository.ProductRepository;
import org.hibernate.SessionFactory;
import org.hibernate.stat.Statistics;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import jakarta.persistence.EntityManagerFactory;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@TestPropertySource(properties = "spring.jpa.properties.hibernate.generate_statistics=true")
class OrderListQueryPerformanceIntegrationTest {

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductPolicyRepository productPolicyRepository;

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private EntityManagerFactory entityManagerFactory;

	@Test
	@Transactional
	void getOrdersUsesBoundedQueryCount() throws Exception {
		Statistics statistics = entityManagerFactory.unwrap(SessionFactory.class).getStatistics();
		statistics.setStatisticsEnabled(true);
		statistics.clear();

		Product product = OrderTestSupport.saveProduct(
				categoryRepository, productPolicyRepository, productRepository,
				"쿼리검증상품", 15_000
		);

		String accessToken = OrderTestSupport.registerAndLogin(mockMvc, "orderlist10006", "orderlist10006@test.com");
		long addressId = OrderTestSupport.createAddress(mockMvc, accessToken, null);

		for (int index = 0; index < 3; index++) {
			long cartItemId = OrderTestSupport.addToCart(mockMvc, accessToken, product.getId(), 1);
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
					.andExpect(status().isOk());
		}

		statistics.clear();

		mockMvc.perform(get("/api/orders?period=ALL&size=20")
						.header("Authorization", "Bearer " + accessToken))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.orders.length()").value(3));

		assertThat(statistics.getQueryExecutionCount()).isLessThanOrEqualTo(10);
	}
}
