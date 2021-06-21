package proj21_funding.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminController {
	@Autowired
	private UserInfoService userService;

	@RequestMapping("/admin")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/adminMember")
	public ModelAndView adminMember() {
		List<UserInfo> userList = userService.showUserAll();
		int count =userService.userCount();
		int currentCount=userService.currentUserCount();
		int prdCount=userService.prdcount();
		ModelAndView mav = new ModelAndView("admin/adminMember","userList",userList);
		mav.addObject("count",count);
		mav.addObject("prdCount",prdCount);
		mav.addObject("currentCount", currentCount);
		return mav;
	}
	
	@RequestMapping("/adminProject")
	public String adminProject() {
		return "admin/adminProject";
	}
	
	@RequestMapping("/accordion")
	public ModelAndView adminTest() {
		List<UserInfo> userList = userService.showUserAll();
		ModelAndView mav = new ModelAndView("admin/accordion","userList",userList);
		return mav;
	}
	
	
}
