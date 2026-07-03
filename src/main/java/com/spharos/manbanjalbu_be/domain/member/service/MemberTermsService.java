package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.TermAgreementItemRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.TermsAgreementRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MarketingConsentResultResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.SignupSessionStatusResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.TermsAgreementResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.TermsResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.SignupSession;
import com.spharos.manbanjalbu_be.domain.member.entity.Terms;
import com.spharos.manbanjalbu_be.domain.member.enums.SignupStep;
import com.spharos.manbanjalbu_be.domain.member.repository.SignupSessionRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.TermsRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
@Transactional(readOnly = true)
public class MemberTermsService {

	private final TermsRepository termsRepository;
	private final SignupSessionRepository signupSessionRepository;

	public MemberTermsService(TermsRepository termsRepository, SignupSessionRepository signupSessionRepository) {
		this.termsRepository = termsRepository;
		this.signupSessionRepository = signupSessionRepository;
	}

	public List<TermsResponse> getTerms() {
		return termsRepository.findAllByOrderByIdAsc()
				.stream()
				.map(terms -> new TermsResponse(
						terms.getId(),
						terms.getTitle(),
						terms.getContent(),
						terms.getIsMandatory()
				))
				.toList();
	}

	@Transactional
	public TermsAgreementResponse agreeTerms(TermsAgreementRequest request) {
		SignupSession session = getValidSession(request.verificationToken());

		if (session.getStep() != SignupStep.IDENTITY_VERIFIED) {
			throw new BusinessException(ErrorCode.SIGNUP_STEP_INVALID);
		}

		List<Terms> allTerms = termsRepository.findAllByOrderByIdAsc();
		Map<Long, Terms> termsMap = allTerms.stream()
				.collect(Collectors.toMap(Terms::getId, Function.identity()));

		if (termsMap.isEmpty()) {
			throw new BusinessException(ErrorCode.TERMS_NOT_FOUND);
		}

		Map<Long, Boolean> agreementMap = new HashMap<>();
		for (TermAgreementItemRequest item : request.agreements()) {
			Terms terms = termsMap.get(item.termsId());
			if (terms == null) {
				throw new BusinessException(ErrorCode.TERMS_NOT_FOUND);
			}
			agreementMap.put(item.termsId(), item.agreed());
		}

		for (Terms terms : allTerms) {
			if (terms.getIsMandatory() && !Boolean.TRUE.equals(agreementMap.get(terms.getId()))) {
				throw new BusinessException(ErrorCode.MANDATORY_TERMS_NOT_AGREED);
			}
			agreementMap.putIfAbsent(terms.getId(), false);
		}

		session.agreeTerms(agreementMap);

		return new TermsAgreementResponse(
				session.getToken(),
				"약관 동의가 완료되었습니다.",
				buildMarketingConsentResult(allTerms, agreementMap)
		);
	}

	public SignupSessionStatusResponse getSessionStatus(String verificationToken) {
		SignupSession session = getValidSession(verificationToken);
		return new SignupSessionStatusResponse(
				session.getToken(),
				session.getStep(),
				session.getAuthMethod(),
				session.getVerifiedValue(),
				session.getExpiresAt()
		);
	}

	MarketingConsentResultResponse buildMarketingConsentResult(List<Terms> allTerms, Map<Long, Boolean> agreementMap) {
		Terms marketingTerm = findMarketingTerm(allTerms)
				.orElseThrow(() -> new BusinessException(ErrorCode.TERMS_NOT_FOUND, "광고성 정보 수신 동의 약관을 찾을 수 없습니다."));

		boolean agreed = Boolean.TRUE.equals(agreementMap.get(marketingTerm.getId()));
		return MarketingConsentResultResponse.of(marketingTerm.getId(), marketingTerm.getTitle(), agreed);
	}

	private Optional<Terms> findMarketingTerm(List<Terms> allTerms) {
		return allTerms.stream()
				.filter(terms -> !terms.getIsMandatory())
				.filter(terms -> terms.getTitle().contains("광고"))
				.findFirst();
	}

	SignupSession getValidSession(String token) {
		SignupSession session = signupSessionRepository.findById(token)
				.orElseThrow(() -> new BusinessException(ErrorCode.SIGNUP_SESSION_NOT_FOUND));

		if (session.isExpired()) {
			throw new BusinessException(ErrorCode.SIGNUP_SESSION_EXPIRED);
		}

		return session;
	}

	Map<Long, Terms> getTermsMap() {
		return termsRepository.findAllByOrderByIdAsc()
				.stream()
				.collect(Collectors.toMap(Terms::getId, Function.identity()));
	}

	Set<Long> getAllTermsIds() {
		return getTermsMap().keySet();
	}
}
