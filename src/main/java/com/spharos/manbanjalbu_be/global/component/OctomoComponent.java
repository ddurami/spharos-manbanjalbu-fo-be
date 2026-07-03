package com.spharos.manbanjalbu_be.global.component;

import com.spharos.manbanjalbu_be.global.dto.octomo.OctomoMessageExistsRequest;
import com.spharos.manbanjalbu_be.global.dto.octomo.OctomoMessageExistsResponse;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestClient;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestClientResponseException;

@Component
public class OctomoComponent {

	private static final Logger log = LoggerFactory.getLogger(OctomoComponent.class);

	private final RestClient octomoRestClient;
	private final String apiKey;
	private final String receivePhoneNumber;
	private final boolean mockEnabled;

	public OctomoComponent(
			RestClient octomoRestClient,
			@Value("${octomo.api-key:}") String apiKey,
			@Value("${octomo.receive-phone-number:}") String receivePhoneNumber,
			@Value("${octomo.mock-enabled:true}") boolean mockEnabled
	) {
		this.octomoRestClient = octomoRestClient;
		this.apiKey = apiKey;
		this.receivePhoneNumber = normalizePhone(receivePhoneNumber);
		this.mockEnabled = mockEnabled;
	}

	public boolean isMockEnabled() {
		return mockEnabled;
	}

	public String getReceivePhoneNumber() {
		validateSendConfig();
		return receivePhoneNumber;
	}

	public void validateSendConfig() {
		validateApiKey();
		if (!StringUtils.hasText(receivePhoneNumber)) {
			throw new BusinessException(
					ErrorCode.OCTOMO_CONFIG_INVALID,
					"octomo.receive-phone-number 설정이 필요합니다."
			);
		}
	}

	public boolean existsMessage(String mobileNum, String text) {
		if (mockEnabled) {
			throw new IllegalStateException("Octomo mock 모드에서는 existsMessage API를 직접 호출하지 않습니다.");
		}

		validateConfig();

		OctomoMessageExistsRequest requestBody = new OctomoMessageExistsRequest(
				normalizePhone(mobileNum),
				text,
				null
		);

		try {
			OctomoMessageExistsResponse response = octomoRestClient.post()
					.uri("/octomo/v1/public/message/exists")
					.contentType(MediaType.APPLICATION_JSON)
					.accept(MediaType.APPLICATION_JSON)
					.header("Authorization", "Octomo " + apiKey)
					.body(requestBody)
					.retrieve()
					.body(OctomoMessageExistsResponse.class);

			if (response == null) {
				throw new BusinessException(ErrorCode.OCTOMO_API_ERROR, "Octomo API 응답이 없습니다.");
			}

			log.info("Octomo 문자 인증 조회 - mobileNum: {}, verified: {}", normalizePhone(mobileNum), response.isVerified());
			return response.isVerified();
		} catch (RestClientResponseException exception) {
			log.error(
					"Octomo API 호출 실패 - status: {}, body: {}",
					exception.getStatusCode().value(),
					exception.getResponseBodyAsString(),
					exception
			);
			throw new BusinessException(ErrorCode.OCTOMO_API_ERROR, resolveOctomoApiErrorMessage(exception));
		} catch (RestClientException exception) {
			log.error("Octomo API 호출 실패 - mobileNum: {}", normalizePhone(mobileNum), exception);
			throw new BusinessException(ErrorCode.OCTOMO_API_ERROR, "Octomo API 호출 중 오류가 발생했습니다.");
		}
	}

	private String resolveOctomoApiErrorMessage(RestClientResponseException exception) {
		int status = exception.getStatusCode().value();
		return switch (status) {
			case 401, 403 -> "Octomo API Key가 올바르지 않습니다. application-local.yaml 의 octomo.api-key 를 확인해주세요.";
			case 400 -> "Octomo API 요청 형식이 올바르지 않습니다. 1666-3538로 인증코드 문자 발송 후 다시 시도해주세요.";
			default -> "Octomo API 호출 중 오류가 발생했습니다. (HTTP " + status + ")";
		};
	}

	private void validateConfig() {
		validateApiKey();
	}

	private void validateApiKey() {
		if (!StringUtils.hasText(apiKey)) {
			throw new BusinessException(
					ErrorCode.OCTOMO_CONFIG_INVALID,
					"octomo.api-key 설정이 필요합니다."
			);
		}
	}

	private String normalizePhone(String phone) {
		return phone.replaceAll("[^0-9]", "");
	}
}
