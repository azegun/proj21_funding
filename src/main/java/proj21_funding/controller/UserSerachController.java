package proj21_funding.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.account.UserChangePw;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserSearch;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.service.UserSerachService;

@Controller
public class UserSerachController {

	@Autowired
	private UserSerachService service;

	// 아이디/비밀번호 찾기 화면가기
	@RequestMapping("/account/searchAccount")
	public String searchAccount() {
		return "account/searchAccount";
	}

	// 아이디 찾기 화면가기
	@GetMapping("/account/searchId")
	public String form_Id(UserSearch userSearch) {
		return "account/searchId";
	}

	@PostMapping("/account/searchId")
	public String submit_Id(@Valid UserSearch userSearch, Errors errors) {
		if (errors.hasErrors())
			return "account/searchId";
		try {
			UserInfo userInfo = service.seachuserId(userSearch.getUserName(), userSearch.getUserPhone());
			userSearch.setUserId(userInfo.getUserId());
			return "account/searchId-rs";
		} catch (NullPointerException e) {
			return "account/searchId-rs";
		}
	}

	// 비밀번호 찾기 화면가기
	@GetMapping("/account/searchPw")
	public String form_Pw(UserSearch userSearch) {
		return "account/searchPw";
	}

	@PostMapping("/account/searchPw")
	public String submit_Pw(@Valid UserSearch userSearch, Errors errors) {		
		if (errors.hasErrors())
			return "account/searchPw";
		try {
			service.seachuserPw(userSearch.getUserId(), userSearch.getUserName(), userSearch.getUserPhone());
			return "account/searchPw-rs";
		} catch (NullPointerException e) {
			userSearch = null;
			return "account/searchPw-rs";
		}

	}
	
	// 비밀번호 찾기 결과화면가기
		@GetMapping("/account/searchPw-rs")
		public String form_ChangPw(UserChangePw userChangePw) {
			return "account/searchPw-rs";
		}

}
