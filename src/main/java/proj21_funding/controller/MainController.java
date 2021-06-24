package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.PrjCategory;
import proj21_funding.service.PrjCategoryService;

@Controller
public class MainController {
	
	@Autowired
	private PrjCategoryService service;
	
	// main화면 바로가기
	@RequestMapping("/")
	public String main() {
		return "/main";
	}	
	
	//home에서 프로젝트 둘러보기
	@RequestMapping("/home/menu")
	public String menu(Model model) {
		List<PrjCategory> prjCategory = service.showCategory();
		model.addAttribute("prjCategory", prjCategory);
		return "home/menu";
	}
	
	//home에서 개인정보 보는거
	@RequestMapping("/home/header_logmenu")
	public String logonMenu() {
		return "home/header_logmenu";
	}
	//맵핑할때 view안에 있는 폴더이면 꼭! 위치 설정해주세요.
		
}