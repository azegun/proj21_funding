package proj21_funding.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserSearch;
import proj21_funding.exception.WrongIdPasswordException;
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

	// 아이디 찾기 결과화면
	@PostMapping("/account/searchId")
	public String submit_Id(@Valid UserSearch userSearch, Errors errors) {
		if (errors.hasErrors())
			return "account/searchId";
		try {
			UserInfo userInfo = service.searchuserId(userSearch.getUserName(), userSearch.getUserPhone());
			userSearch.setUserId(userInfo.getUserId());
			return "account/searchId-rs";
		} catch (NullPointerException e) {
			return "account/search-not";
		}
	}

	// 비밀번호 찾기 화면가기
	@GetMapping("/account/searchPw")
	public String form_Pw(UserSearch userSearch) {
		return "account/searchPw";
	}

	// 비밀번호 찾기 결과화면
	@PostMapping("/account/searchPw")
	public String submit_Pw(@Valid UserSearch userSearch, Errors errors) {
		if (errors.hasErrors())
			return "account/searchPw";

		try {
			UserInfo userInfo = service.searchuserPw(userSearch.getUserId(), userSearch.getUserName(), userSearch.getUserPhone());
			
			return "/account/searchPw-rs";
		} catch (NullPointerException e) {
			return "account/search-not";
		}

	}

	// 비밀번호 찾기 새 비밀번호 설정화면가기
	@GetMapping("/account/searchPw-rs")
	public String form_ChangPw(UserSearch userSearch) {
		return "account/searchPw-rs";
	}

	@PostMapping("/account/searchPw-rs")
	public String submit_ChangPw(@Valid UserSearch userSearch, Errors errors) {
		if (errors.hasErrors())
			return "account/searchPw-rs";

		if (!userSearch.isPasswordEqualToComfirmPassword()) {
			errors.rejectValue("confirmUserPw", "nomatch");
			return "account/searchPw-rs";
		}

		try {
			service.changePassword(userSearch.getUserId(), userSearch.getNewUserPw());
			return "/login";
		} catch (WrongIdPasswordException e) {
			errors.rejectValue("currentUserPw", "notMatching");
			return "account/searchPw-rs";
		}

	}

}
