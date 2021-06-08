package proj21_funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	// main화면 바로가기
	@RequestMapping("/")
	public String main() {
		return "/main";
	}	
	
	//home에서 프로젝트 둘러보기
	@RequestMapping("/home/menu")
	public String menu() {
		return "home/menu";
	}
	//home에서 개인정보 보는거
	@RequestMapping("/home/header_logmenu")
	public String logonMenu() {
		return "home/header_logmenu";
	}
	//맵핑할때 view안에 있는 폴더이면 꼭! 위치 설정해주세요. 밑에처럼
	@RequestMapping("/board_servicecenter/servicecenter_write")
	public String write_ServiceCenter(){
		return "board_servicecenter/servicecenter_write";
	}
	
	@RequestMapping("/board_servicecenter/servicecenter_view_all")
	public String view_all_ServiceCenter() {
		return "board_servicecenter/servicecenter_view_all";
	}
	
	@RequestMapping("/board_servicecenter/servicecenter_view_user")
	public String view_user_ServiceCenter() {
		return "board_servicecenter/servicecenter_view_user";
	}
		
}