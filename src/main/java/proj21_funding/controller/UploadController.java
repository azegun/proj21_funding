package proj21_funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.service.ProjectAndPrjOptionService;

@Controller
public class UploadController {
	@Autowired
	private ProjectAndPrjOptionService service;
	
	//home에서 프로젝트 올리기 광고페이지
	@RequestMapping(value = "/upload/upload_main", method = RequestMethod.GET)
	public String uploadMain() {
		return "upload/upload_main";
	}
	
	//광고페이지에서 등록 html
	@RequestMapping(value = "/upload/register", method = RequestMethod.GET)
	public String uploadRegister() {
		return "upload/register";
	}
	
	@PostMapping("/ListSuccess")
	public String registerSuccess(Project project, PrjOption prjoption) {
	try {
		System.out.println(project);
		service.trJoinPrjAndPrjOpt(project, prjoption);
		System.out.println(prjoption);
		return "upload/register_success";
	
		}catch (Exception e) { 
			e.printStackTrace();
		 
		 return "upload/register"; 
		 }
				
	}

	
}
