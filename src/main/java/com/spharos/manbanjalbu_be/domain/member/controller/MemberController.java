package com.spharos.manbanjalbu_be.domain.member.controller;

import com.spharos.manbanjalbu_be.domain.member.dto.request.EmailVerificationConfirmRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.EmailVerificationSendRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.FindLoginIdRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberMarketingConsentUpdateRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberPasswordChangeRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberWithdrawRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberJoinRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberLoginRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.PhoneVerificationConfirmRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.PhoneVerificationSendRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.TermsAgreementRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.ResetPasswordRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.FindLoginIdResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MarketingConsentResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberWithdrawResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberPersonalInfoResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MypageSummaryResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.ResetPasswordResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.LoginIdCheckResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberJoinCompleteResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.MemberLoginResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.SignupSessionStatusResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.TermsAgreementResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.TermsResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.VerificationConfirmResponse;
import com.spharos.manbanjalbu_be.domain.member.dto.response.VerificationSendResponse;
import com.spharos.manbanjalbu_be.domain.member.service.MemberAuthService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberFindIdService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberFindPasswordService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberJoinService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberLoginService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberMypageService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberProfileService;
import com.spharos.manbanjalbu_be.domain.member.service.MemberTermsService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "Member", description = "회원가입 / 로그인 / 마이페이지 API")
@RestController
@RequestMapping("/api/member")
public class MemberController {

	private static final String BEARER_AUTH = "BearerAuth";

	private final MemberAuthService memberAuthService;
	private final MemberTermsService memberTermsService;
	private final MemberJoinService memberJoinService;
	private final MemberLoginService memberLoginService;
	private final MemberFindIdService memberFindIdService;
	private final MemberFindPasswordService memberFindPasswordService;
	private final MemberMypageService memberMypageService;
	private final MemberProfileService memberProfileService;

	public MemberController(
			MemberAuthService memberAuthService,
			MemberTermsService memberTermsService,
			MemberJoinService memberJoinService,
			MemberLoginService memberLoginService,
			MemberFindIdService memberFindIdService,
			MemberFindPasswordService memberFindPasswordService,
			MemberMypageService memberMypageService,
			MemberProfileService memberProfileService
	) {
		this.memberAuthService = memberAuthService;
		this.memberTermsService = memberTermsService;
		this.memberJoinService = memberJoinService;
		this.memberLoginService = memberLoginService;
		this.memberFindIdService = memberFindIdService;
		this.memberFindPasswordService = memberFindPasswordService;
		this.memberMypageService = memberMypageService;
		this.memberProfileService = memberProfileService;
	}

	@Operation(
			summary = "개인정보 관리 - 본인 정보 조회",
			description = """
					마이페이지 > 개인정보 관리 화면에 표시할 회원 정보를 반환합니다.
					JWT(Bearer) 로그인 필수.

					| 필드 | 설명 |
					|------|------|
					| loginId | 아이디 (읽기 전용) |
					| name | 이름 |
					| birthDate | 생년월일 |
					| phone | 휴대폰 번호 |
					| email | 이메일 |
					| marketingConsent | [선택] 마케팅 활용 수집·이용 동의 및 E-mail/SMS 수신 동의 |

					비밀번호는 보안상 응답에 포함하지 않습니다. 변경은 PATCH /profile/password 사용.
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@GetMapping("/profile")
	public ResponseEntity<ApiResponse<MemberPersonalInfoResponse>> getPersonalInfo(
			@AuthenticationPrincipal Long memberId
	) {
		return ResponseEntity.ok(ApiResponse.ok(memberProfileService.getPersonalInfo(memberId)));
	}

	@Operation(
			summary = "개인정보 관리 - 비밀번호 변경",
			description = "현재 비밀번호 확인 후 새 비밀번호로 변경합니다. JWT(Bearer) 로그인 필수.",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@PatchMapping("/profile/password")
	public ResponseEntity<ApiResponse<Void>> changePassword(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody MemberPasswordChangeRequest request
	) {
		memberProfileService.changePassword(memberId, request);
		return ResponseEntity.ok(ApiResponse.ok(null, "비밀번호가 변경되었습니다."));
	}

	@Operation(
			summary = "개인정보 관리 - 마케팅 수신 동의 변경",
			description = """
					[선택] 마케팅 활용 수집·이용 동의 및 E-mail/SMS 광고성 정보 수신 동의를 변경합니다.
					- marketingUtilizationAgreed=false 이면 emailAgreed, smsAgreed 모두 false 여야 합니다.
					- marketingUtilizationAgreed=true 이면 emailAgreed, smsAgreed 중 하나 이상 true 여야 합니다.
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@PatchMapping("/profile/marketing-consent")
	public ResponseEntity<ApiResponse<MarketingConsentResponse>> updateMarketingConsent(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody MemberMarketingConsentUpdateRequest request
	) {
		return ResponseEntity.ok(
				ApiResponse.ok(memberProfileService.updateMarketingConsent(memberId, request))
		);
	}

	@Operation(
			summary = "회원 탈퇴",
			description = """
					로그인 회원 계정을 소프트 딜리트(WITHDRAWN) 처리합니다. JWT(Bearer) 로그인 필수.

					사전 인증 절차:
					1) POST /api/member/auth/email/send → /auth/email/verify (또는 phone/send → phone/verify)
					2) verify 응답의 verificationToken 과 로그인 회원의 이메일/휴대폰번호 일치 여부 확인
					3) 본 API 호출

					인증한 이메일 또는 휴대폰번호가 로그인 회원 정보와 일치해야 탈퇴가 처리됩니다.
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@PostMapping("/withdraw")
	public ResponseEntity<ApiResponse<MemberWithdrawResponse>> withdraw(
			@AuthenticationPrincipal Long memberId,
			@Valid @RequestBody MemberWithdrawRequest request
	) {
		return ResponseEntity.ok(ApiResponse.ok(memberProfileService.withdraw(memberId, request)));
	}

	@Operation(
			summary = "마이페이지 요약",
			description = """
					로그인 회원의 이름과 쇼핑정보·결제수단 요약을 반환합니다.
					- name: 회원 프로필 이름
					- shoppingInfo / paymentMethods: DB 실데이터 기준 count·summary
					- 데이터가 없으면 count=0, summary=null
					""",
			security = @SecurityRequirement(name = BEARER_AUTH)
	)
	@GetMapping("/mypage")
	public ResponseEntity<ApiResponse<MypageSummaryResponse>> getMypageSummary(
			@AuthenticationPrincipal Long memberId
	) {
		return ResponseEntity.ok(ApiResponse.ok(memberMypageService.getSummary(memberId)));
	}

	@Operation(summary = "1. 이메일 인증번호 발송", description = """
			이메일 인증번호를 발송합니다.
			- devCode: 로컬/Swagger용 (member.verification.expose-dev-code=true 일 때만 표시)
			- authCode: 이메일 인증에서는 항상 null (휴대폰 Octomo 전용)
			- mock 또는 expose-dev-code=false 이면 devCode null → 실제 메일함 확인
			""")
	@PostMapping("/auth/email/send")
	public ApiResponse<VerificationSendResponse> sendEmailVerification(
			@Valid @RequestBody EmailVerificationSendRequest request
	) {
		return ApiResponse.ok(memberAuthService.sendEmailVerification(request));
	}

	@Operation(summary = "2. 이메일 인증번호 확인", description = "인증 성공 시 verificationToken 을 반환합니다.")
	@PostMapping("/auth/email/verify")
	public ApiResponse<VerificationConfirmResponse> confirmEmailVerification(
			@Valid @RequestBody EmailVerificationConfirmRequest request
	) {
		return ApiResponse.ok(memberAuthService.confirmEmailVerification(request));
	}

	@Operation(
			summary = "1. 휴대폰 Octomo 인증 요청",
			description = """
					[실연동 MO 인증] 서버가 문자를 보내지 않습니다.
					1) 응답 data.authCode, data.receivePhoneNumber(1666-3538) 확인
					2) 사용자가 본인 휴대폰(010...)에서 1666-3538로 authCode만 문자 발송
					3) POST /auth/phone/verify 호출 (phone=본인 번호, code=authCode)

					mock 모드(octomo.mock-enabled=true): devCode/authCode 반환 후 verify 호출.
					"""
	)
	@PostMapping("/auth/phone/send")
	public ApiResponse<VerificationSendResponse> sendPhoneVerification(
			@Valid @RequestBody PhoneVerificationSendRequest request
	) {
		return ApiResponse.ok(memberAuthService.sendPhoneVerification(request));
	}

	@Operation(
			summary = "2. 휴대폰 Octomo 문자 인증 확인",
			description = "1666-3538로 authCode 문자 발송 후 호출. phone은 본인 휴대폰(010...). 인증 유효시간은 Octomo 기본값(약 5분) 적용"
	)
	@PostMapping("/auth/phone/verify")
	public ApiResponse<VerificationConfirmResponse> confirmPhoneVerification(
			@Valid @RequestBody PhoneVerificationConfirmRequest request
	) {
		return ApiResponse.ok(memberAuthService.confirmPhoneVerification(request));
	}

	@Operation(summary = "3. 약관 목록 조회", description = "mandatory=true 필수 약관, mandatory=false 선택 약관(광고성 정보 수신 등)")
	@GetMapping("/terms")
	public ApiResponse<List<TermsResponse>> getTerms() {
		return ApiResponse.ok(memberTermsService.getTerms());
	}

	@Operation(
			summary = "4. 약관 동의",
			description = "필수 약관(mandatory=true)은 모두 agreed=true 필요. marketingConsent에 광고성 정보 수신 동의 결과 포함"
	)
	@PostMapping("/join/terms")
	public ApiResponse<TermsAgreementResponse> agreeTerms(@Valid @RequestBody TermsAgreementRequest request) {
		return ApiResponse.ok(memberTermsService.agreeTerms(request));
	}

	@Operation(
			summary = "5. 회원 정보 입력 및 가입 완료",
			description = """
					약관 동의 후 호출. nickname 제외 전 필드 필수.
					비밀번호: 8~12자, 영문 대소문자+특수문자 각 1개 이상.
					응답 marketingConsent: 회원가입 완료 페이지 광고성 정보 수신 동의 결과.
					"""
	)
	@PostMapping("/join")
	public ApiResponse<MemberJoinCompleteResponse> join(@Valid @RequestBody MemberJoinRequest request) {
		return ApiResponse.ok(memberJoinService.join(request), "회원가입이 완료되었습니다.");
	}

	@Operation(summary = "회원가입 세션 조회", description = "FO 중간 단계 복구용. verificationToken 으로 현재 step 확인")
	@GetMapping("/join/session")
	public ApiResponse<SignupSessionStatusResponse> getSignupSession(
			@RequestParam String verificationToken
	) {
		return ApiResponse.ok(memberTermsService.getSessionStatus(verificationToken));
	}

	@Operation(summary = "아이디 중복 확인", description = "회원가입 정보 입력 단계에서 loginId 사용 가능 여부 확인")
	@GetMapping("/join/login-id/check")
	public ApiResponse<LoginIdCheckResponse> checkLoginId(@RequestParam String loginId) {
		return ApiResponse.ok(memberJoinService.checkLoginIdAvailability(loginId));
	}

	@Operation(summary = "6. 로그인", description = "회원가입 완료 후 loginId/password 로 JWT 발급")
	@PostMapping("/login")
	public ApiResponse<MemberLoginResponse> login(@Valid @RequestBody MemberLoginRequest request) {
		return ApiResponse.ok(memberLoginService.login(request));
	}

	@Operation(
			summary = "아이디 찾기",
			description = """
					이메일 또는 휴대폰 인증 완료 후 호출.
					1) POST /auth/email/send → /auth/email/verify (또는 phone/send → phone/verify)
					2) verify 응답의 verificationToken 으로 본 API 호출
					3) 등록된 loginId 를 마스킹 없이 반환
					"""
	)
	@PostMapping("/find-id")
	public ApiResponse<FindLoginIdResponse> findLoginId(@Valid @RequestBody FindLoginIdRequest request) {
		return ApiResponse.ok(memberFindIdService.findLoginId(request));
	}

	@Operation(
			summary = "비밀번호 찾기 - 계정 확인",
			description = """
					이메일 또는 휴대폰 인증 완료 후 호출.
					1) POST /auth/email/send → /auth/email/verify (또는 phone/send → phone/verify)
					2) verify 응답의 verificationToken 으로 본 API 호출
					3) 등록된 loginId 를 마스킹 없이 반환 (세션 유지 → reset API 호출)
					"""
	)
	@PostMapping("/find-password/verify")
	public ApiResponse<FindLoginIdResponse> verifyAccountForPasswordReset(
			@Valid @RequestBody FindLoginIdRequest request
	) {
		return ApiResponse.ok(memberFindPasswordService.verifyAccount(request));
	}

	@Operation(
			summary = "비밀번호 찾기 - 비밀번호 재설정",
			description = """
					계정 확인(verify) 완료 후 동일 verificationToken 으로 호출.
					비밀번호: 8~16자, 영문 대소문자+특수문자 각 1개 이상.
					"""
	)
	@PostMapping("/find-password/reset")
	public ApiResponse<ResetPasswordResponse> resetPassword(@Valid @RequestBody ResetPasswordRequest request) {
		return ApiResponse.ok(memberFindPasswordService.resetPassword(request), "비밀번호가 변경되었습니다.");
	}
}
