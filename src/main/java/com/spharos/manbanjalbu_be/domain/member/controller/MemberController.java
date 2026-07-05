package com.spharos.manbanjalbu_be.domain.member.controller;

import com.spharos.manbanjalbu_be.domain.member.dto.request.EmailVerificationConfirmRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.EmailVerificationSendRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.FindLoginIdRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberJoinRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.MemberLoginRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.PhoneVerificationConfirmRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.PhoneVerificationSendRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.TermsAgreementRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.request.ResetPasswordRequest;
import com.spharos.manbanjalbu_be.domain.member.dto.response.FindLoginIdResponse;
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
import com.spharos.manbanjalbu_be.domain.member.service.MemberTermsService;
import com.spharos.manbanjalbu_be.global.common.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "Member", description = "회원가입 / 로그인 API")
@RestController
@RequestMapping("/api/member")
public class MemberController {

	private final MemberAuthService memberAuthService;
	private final MemberTermsService memberTermsService;
	private final MemberJoinService memberJoinService;
	private final MemberLoginService memberLoginService;
	private final MemberFindIdService memberFindIdService;
	private final MemberFindPasswordService memberFindPasswordService;

	public MemberController(
			MemberAuthService memberAuthService,
			MemberTermsService memberTermsService,
			MemberJoinService memberJoinService,
			MemberLoginService memberLoginService,
			MemberFindIdService memberFindIdService,
			MemberFindPasswordService memberFindPasswordService
	) {
		this.memberAuthService = memberAuthService;
		this.memberTermsService = memberTermsService;
		this.memberJoinService = memberJoinService;
		this.memberLoginService = memberLoginService;
		this.memberFindIdService = memberFindIdService;
		this.memberFindPasswordService = memberFindPasswordService;
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
