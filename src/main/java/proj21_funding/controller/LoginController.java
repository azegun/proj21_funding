package proj21_funding.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.AuthInfo;
import proj21_funding.dto.LoginCommand;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.service.AuthService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private AuthService authService;

	// 로그인 화면가기
	@GetMapping
	public String login(LoginCommand loginCommand, @CookieValue(value = "REMEMBER", required = false) Cookie rCookie) {
		if (rCookie != null) {
			loginCommand.setUserId(rCookie.getValue());
			loginCommand.setRememberUserId(true);
		}
		return "/account/login";
	}

	// 로그인 성공시 메인화면으로
	@PostMapping
	public String submit(@Valid LoginCommand loginCommand, Errors errors, HttpSession session,
			HttpServletResponse response) {
		if (errors.hasErrors())
			return "/account/login";

		try {
			AuthInfo authInfo = authService.authenicate(loginCommand.getUserId(), loginCommand.getUserPw());
			session.setAttribute("authInfo", authInfo);

			Cookie rememberCookie = new Cookie("REMEMBER", loginCommand.getUserId());
			rememberCookie.setPath("/");

			if (loginCommand.isRememberUserId()) {
				rememberCookie.setMaxAge(60 * 60 * 24 * 30);
			} else {
				rememberCookie.setMaxAge(0);
			}
			response.addCookie(rememberCookie);

			return "/main";
		} catch (WrongIdPasswordException ex) {
			errors.reject("idPasswordNotMatching");
			return "/account/login";
		}

	}

}
