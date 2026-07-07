package com.spharos.manbanjalbu_be.global.dto.octomo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public record OctomoMessageExistsResponse(
		Boolean verified,
		Boolean exists
) {
	public boolean isVerified() {
		return Boolean.TRUE.equals(verified) || Boolean.TRUE.equals(exists);
	}
}