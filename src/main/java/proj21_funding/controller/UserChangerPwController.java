package proj21_funding.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.UserAuthInfo;
import proj21_funding.dto.UserChangePw;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.service.UserChangePwService;



@Controller
@RequestMapping("/account/UserchangePw")
public class UserChangerPwController {

	@Autowired
	private UserChangePwService userChangePwService;
	
	@GetMapping
	public String form(UserChangePw userChangePw) {
		return "/account/UserchangePw1";
	}
	
	
	@PostMapping
	public String submit(UserChangePw userChangePw, Errors errors, HttpSession session) {
		if(errors.hasErrors())
			return "/account/UserchangePw1";
		
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("userAuthInfo");
		try {
			userChangePwService.changePassword(userAuthInfo.getUserId(), userChangePw.getCurrentUserPw(), userChangePw.getNewUserPw());
			return "/account/UserchangePw2";
		}catch (WrongIdPasswordException e) {
			errors.rejectValue("currentUserPw", "notMatching");
			return "/account/UserchangePw1";
		}
	}
	
	
	
	
	
}
