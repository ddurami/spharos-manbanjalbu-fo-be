package com.spharos.manbanjalbu_be.domain.member.service;

import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberMarketingConsentUpdateRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberPasswordChangeRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MarketingConsentResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberPersonalInfoResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberWithdrawResponse;
import com.spharos.manbanjalbu_be.domain.member.entity.Member;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberProfile;
import com.spharos.manbanjalbu_be.domain.member.entity.MemberTermsAgreement;
import com.spharos.manbanjalbu_be.domain.member.entity.Terms;
import com.spharos.manbanjalbu_be.domain.member.enums.MemberStatus;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.MemberTermsAgreementRepository;
import com.spharos.manbanjalbu_be.domain.member.repository.TermsRepository;
import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberProfileService {

	private final MemberRepository memberRepository;
	private final MemberTermsAgreementRepository memberTermsAgreementRepository;
	private final TermsRepository termsRepository;
	private final PasswordEncoder passwordEncoder;

	public MemberProfileService(
			MemberRepository memberRepository,
			MemberTermsAgreementRepository memberTermsAgreementRepository,
			TermsRepository termsRepository,
			PasswordEncoder passwordEncoder
	) {
		this.memberRepository = memberRepository;
		this.memberTermsAgreementRepository = memberTermsAgreementRepository;
		this.termsRepository = termsRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@Transactional(readOnly = true)
	public MemberPersonalInfoResponse getPersonalInfo(Long memberId) {
		Member member = getActiveMember(memberId);
		MemberProfile profile = getProfile(member);

		return new MemberPersonalInfoResponse(
				member.getLoginId(),
				profile.getName(),
				profile.getBirthDate(),
				profile.getPhone(),
				profile.getEmail(),
				buildMarketingConsent(member, profile)
		);
	}

	public void changePassword(Long memberId, MemberPasswordChangeRequest request) {
		Member member = getActiveMember(memberId);

		if (!passwordEncoder.matches(request.currentPassword(), member.getPassword())) {
			throw new BusinessException(ErrorCode.INVALID_CURRENT_PASSWORD);
		}
		if (passwordEncoder.matches(request.newPassword(), member.getPassword())) {
			throw new BusinessException(ErrorCode.INVALID_INPUT, "새 비밀번호는 현재 비밀번호와 달라야 합니다.");
		}

		member.changePassword(passwordEncoder.encode(request.newPassword()));
	}

	public MarketingConsentResponse updateMarketingConsent(
			Long memberId,
			MemberMarketingConsentUpdateRequest request
	) {
		Member member = getActiveMember(memberId);
		MemberProfile profile = getProfile(member);
		Terms marketingTerms = getMarketingTerms();

		boolean utilizationAgreed = Boolean.TRUE.equals(request.marketingUtilizationAgreed());
		boolean emailAgreed = Boolean.TRUE.equals(request.emailAgreed());
		boolean smsAgreed = Boolean.TRUE.equals(request.smsAgreed());

		if (!utilizationAgreed && (emailAgreed || smsAgreed)) {
			throw new BusinessException(
					ErrorCode.INVALID_INPUT,
					"마케팅 활용 수집·이용에 동의하지 않으면 E-mail/SMS 수신 동의를 선택할 수 없습니다."
			);
		}

		if (utilizationAgreed && !emailAgreed && !smsAgreed) {
			throw new BusinessException(
					ErrorCode.INVALID_INPUT,
					"마케팅 활용 수집·이용에 동의한 경우 E-mail 또는 SMS 중 하나 이상 선택해야 합니다."
			);
		}

		MemberTermsAgreement agreement = memberTermsAgreementRepository
				.findByMember_IdAndTerms_Id(memberId, marketingTerms.getId())
				.orElseGet(() -> MemberTermsAgreement.create(member, marketingTerms, false));

		agreement.updateAgreed(utilizationAgreed);
		memberTermsAgreementRepository.save(agreement);

		profile.updateMarketingConsent(
				utilizationAgreed && emailAgreed,
				utilizationAgreed && smsAgreed
		);

		return buildMarketingConsent(member, profile);
	}

	public MemberWithdrawResponse withdraw(Long memberId) {
		Member member = memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));

		if (member.getStatus() == MemberStatus.WITHDRAWN) {
			throw new BusinessException(ErrorCode.MEMBER_ALREADY_WITHDRAWN);
		}

		member.withdraw();

		return new MemberWithdrawResponse(
				member.getLoginId(),
				"회원 탈퇴가 완료되었습니다."
		);
	}

	private MarketingConsentResponse buildMarketingConsent(Member member, MemberProfile profile) {
		Terms marketingTerms = getMarketingTerms();
		boolean utilizationAgreed = memberTermsAgreementRepository
				.findByMember_IdAndTerms_Id(member.getId(), marketingTerms.getId())
				.map(MemberTermsAgreement::getIsAgreed)
				.orElse(false);

		return new MarketingConsentResponse(
				marketingTerms.getId(),
				marketingTerms.getTitle(),
				utilizationAgreed,
				Boolean.TRUE.equals(profile.getMarketingEmailAgreed()),
				Boolean.TRUE.equals(profile.getMarketingSmsAgreed())
		);
	}

	private Terms getMarketingTerms() {
		return termsRepository.findAllByOrderByIdAsc().stream()
				.filter(terms -> !terms.getIsMandatory())
				.filter(terms -> terms.getTitle().contains("광고"))
				.findFirst()
				.orElseThrow(() -> new BusinessException(
						ErrorCode.TERMS_NOT_FOUND,
						"광고성 정보 수신 동의 약관을 찾을 수 없습니다."
				));
	}

	private Member getActiveMember(Long memberId) {
		Member member = memberRepository.findById(memberId)
				.orElseThrow(() -> new BusinessException(ErrorCode.MEMBER_NOT_FOUND));

		if (member.getStatus() == MemberStatus.WITHDRAWN) {
			throw new BusinessException(ErrorCode.MEMBER_ALREADY_WITHDRAWN);
		}
		if (member.getStatus() != MemberStatus.ACTIVE) {
			throw new BusinessException(ErrorCode.MEMBER_INACTIVE);
		}
		return member;
	}

	private MemberProfile getProfile(Member member) {
		MemberProfile profile = member.getProfile();
		if (profile == null) {
			throw new BusinessException(ErrorCode.MEMBER_NOT_FOUND);
		}
		return profile;
	}
}
