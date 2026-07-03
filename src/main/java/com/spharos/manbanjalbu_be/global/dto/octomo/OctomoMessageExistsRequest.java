package com.spharos.manbanjalbu_be.global.dto.octomo;

import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public record OctomoMessageExistsRequest(
		String mobileNum,
		String text,
		Integer withinMinutes
) {
}
