package proj21_funding.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.service.ProjectAndPrjOptionService;

//@RequestMapping("/upload")
@Controller
public class UploadController {
	
	private ProjectAndPrjOptionService service;
	
	//home에서 프로젝트 올리기 광고페이지
//	@GetMapping("/upload_main")
	@RequestMapping(value = "/upload/upload_main", method = RequestMethod.GET)
	public String uploadMain() {
		return "upload/upload_main";
	}
	
	//광고페이지에서 등록 html
//	@GetMapping("/register")
	@RequestMapping(value = "/upload/register", method = RequestMethod.GET)
	public String uploadRegister() {
		return "upload/register";
	}
	
	@PostMapping("/ListSuccess")
	public String registerSuccess(/* Project project, PrjOption prjoption */ HttpServletRequest request) {
		UserInfo userNo = new UserInfo(Integer.parseInt(request.getParameter("userNo")));
		int prjGoal = Integer.parseInt(request.getParameter("prjGoal"));
		Project project = new Project(userNo, request.getParameter("prjName"), request.getParameter("prjContent"), prjGoal);
		
		
		Project prjNo = new Project(Integer.parseInt(request.getParameter("prjNo")));
		int optPrice = Integer.parseInt(request.getParameter("optPrice"));
		PrjOption prjoption = new PrjOption(prjNo, request.getParameter("optName") , optPrice, request.getParameter("optContent"));
		System.out.println(project);
		System.out.println(prjoption);
		try {
		service.trJoinPrjAndPrjOpt(project, prjoption);
		System.out.println("success");
		return "project/list";
		
		}catch (Exception e) {
			System.out.println("errors2");
			e.printStackTrace();
			
		return "upload/register";
		}
		
				
	}

	
}
