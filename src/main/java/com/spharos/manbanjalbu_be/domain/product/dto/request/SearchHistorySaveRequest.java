package com.spharos.manbanjalbu_be.domain.product.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record SearchHistorySaveRequest(
		@NotBlank(message = "검색어를 입력해주세요.")
		@Size(max = 100, message = "검색어는 100자 이하로 입력해주세요.")
		String keyword
) {
}
