package com.spharos.manbanjalbu_be.global.component;

import com.spharos.manbanjalbu_be.global.exception.BusinessException;
import com.spharos.manbanjalbu_be.global.exception.ErrorCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailAuthenticationException;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.concurrent.ThreadLocalRandom;

@Component
public class EmailComponent {

	private static final Logger log = LoggerFactory.getLogger(EmailComponent.class);

	private final JavaMailSender mailSender;
	private final String mailUsername;
	private final boolean mockEnabled;
	private final String fromAddress;
	private final String subject;
	private final long expireMinutes;

	public EmailComponent(
			@Autowired(required = false) JavaMailSender mailSender,
			@Value("${spring.mail.username:}") String mailUsername,
			@Value("${spring.mail.password:}") String mailPassword,
			@Value("${mail.verification.mock-enabled:true}") boolean mockEnabled,
			@Value("${mail.verification.from:}") String fromAddress,
			@Value("${mail.verification.subject:[스타벅스] 이메일 인증번호}") String subject,
			@Value("${member.verification.expire-minutes:5}") long expireMinutes
	) {
		this.mailSender = mailSender;
		this.mailUsername = mailUsername;
		this.mockEnabled = mockEnabled;
		this.fromAddress = StringUtils.hasText(fromAddress) ? fromAddress : mailUsername;
		this.subject = subject;
		this.expireMinutes = expireMinutes;

		if (!mockEnabled && !isMailConfigValid(mailUsername, mailPassword, this.fromAddress)) {
			log.warn("메일 실발송 설정이 불완전합니다. application-local.yaml 의 spring.mail.username/password, mail.verification.from 을 확인하세요.");
		}
	}

	public String generateVerificationCode() {
		int value = ThreadLocalRandom.current().nextInt(100000, 1000000);
		return String.valueOf(value);
	}

	public void sendVerificationEmail(String recipientEmail, String verificationCode) {
		if (mockEnabled) {
			log.info("[MOCK EMAIL] 인증번호 발송 - to: {}, code: {}, expireMinutes: {}",
					recipientEmail, verificationCode, expireMinutes);
			return;
		}

		validateMailConfig();

		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(fromAddress);
			message.setTo(recipientEmail);
			message.setSubject(subject);
			message.setText(buildVerificationBody(verificationCode));
			mailSender.send(message);
			log.info("이메일 인증번호 발송 완료 - to: {}", recipientEmail);
		} catch (MailAuthenticationException exception) {
			log.error("Gmail SMTP 인증 실패 - username: {}, from: {}", mailUsername, fromAddress, exception);
			throw new BusinessException(
					ErrorCode.EMAIL_AUTHENTICATION_FAILED,
					"Gmail SMTP 인증에 실패했습니다. application-local.yaml 의 spring.mail.password 에 Google 앱 비밀번호 16자리를 설정해주세요."
			);
		} catch (MailException exception) {
			log.error("이메일 인증번호 발송 실패 - to: {}", recipientEmail, exception);
			throw new BusinessException(ErrorCode.EMAIL_SEND_FAILED, "이메일 발송 중 오류가 발생했습니다.");
		}
	}

	private void validateMailConfig() {
		if (mailSender == null) {
			throw new BusinessException(
					ErrorCode.EMAIL_CONFIG_INVALID,
					"JavaMailSender 설정이 없습니다. spring.mail 설정을 확인해주세요."
			);
		}
		if (!StringUtils.hasText(mailUsername) || !StringUtils.hasText(fromAddress)) {
			throw new BusinessException(
					ErrorCode.EMAIL_CONFIG_INVALID,
					"application-local.yaml 의 spring.mail.username 과 mail.verification.from 값이 필요합니다."
			);
		}
	}

	private boolean isMailConfigValid(String username, String password, String from) {
		return StringUtils.hasText(username)
				&& StringUtils.hasText(password)
				&& StringUtils.hasText(from);
	}

	private String buildVerificationBody(String verificationCode) {
		return """
				안녕하세요. 스타벅스 온라인 스토어입니다.

				회원가입 이메일 인증번호는 아래와 같습니다.

				인증번호: %s

				인증번호는 %d분간 유효합니다.
				본인이 요청하지 않은 경우 이 메일을 무시해 주세요.
				""".formatted(verificationCode, expireMinutes);
	}
}
