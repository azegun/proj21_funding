package proj21_funding.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminController {
	@Autowired
	private UserInfoService userService;
	
	@Autowired
	private ProjectJoinService joinService;
	
	@Autowired
	private PrjCategoryService categoryService;
	
	@Autowired
	private PrjOptionService optionService;
	
	@RequestMapping("/admin")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/adminMember")
	public ModelAndView adminMember() {
		//회원 후원한프로젝트수,후원금액
		List<ProjectJoin> fundingStatic= joinService.showSumCountGroupByUserNo();
		//회원별 등록프로젝트수
		List<ProjectJoin> regProject= joinService.showProjectGroupByUserNo();	
		//회원별 제작성공프로젝트수
		List<ProjectJoin> successProject= joinService.showSucessProjectGroupByUserNo();
		
		List<UserInfo> userList = userService.showUserAll();
		//총유저수
		int count =userService.userCount();
		//탈퇴 제외 유저수
		int currentCount=userService.currentUserCount();
		//제작자수
		int prdCount=userService.prdcount();
		ModelAndView mav = new ModelAndView("admin/adminMember","userList",userList);
		mav.addObject("count",count);
		mav.addObject("prdCount",prdCount);
		mav.addObject("currentCount", currentCount);
		mav.addObject("fundingStatic", fundingStatic);
		mav.addObject("regProject", regProject);
		mav.addObject("successProject", successProject);
		return mav;
	}
	
	@RequestMapping("/adminProject")
	public ModelAndView adminProject() {
//		카테고리 콤보박스 리스트
		List<PrjCategory> categoryList = categoryService.showCategory();
		List<ProjectJoin> prjList = joinService.showProjectJoinAll();
		ProjectJoin sumCount =joinService.showProjectSumCountAll();
		
		ModelAndView mav = new ModelAndView("admin/adminProject","prjList",prjList);
		mav.addObject("categoryList",categoryList);
		mav.addObject("sumCount",sumCount);
		return mav;
	}
	
	@RequestMapping("/adminBoard")
	public ModelAndView adminBoard() {
		
		ModelAndView mav = new ModelAndView("admin/adminBoard");
		return mav;
	}
	
	@RequestMapping("/accordion")
	public ModelAndView adminTest() {
		List<UserInfo> userList = userService.showUserAll();
		ModelAndView mav = new ModelAndView("admin/accordion","userList",userList);
		return mav;
	}
	
	
}
