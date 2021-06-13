package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.AddPrjOption;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.exception.ProjectNotFoundException;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectAndPrjOptionService;
import proj21_funding.service.ProjectService;

@Controller
public class UploadController {	

	@Autowired
	private ProjectAndPrjOptionService service;
	
	@Autowired
	private PrjOptionService optionService;
	
	
	//home에서 프로젝트 올리기 광고페이지
	@GetMapping("/uploadMain")
	public String uploadMain() {
		return "upload/upload_main";
	}
	
	//광고페이지에서 등록 html
	@GetMapping("/registerForm")
	public String uploadRegister() {
		return "upload/register";
	}
	
	//등록 취소 후 광고페이지
	@GetMapping("/uploadListCancel")
	public  String uploadCancel() {
		return "upload/upload_main";
	}
	
	//수정 완료 후 리스트
	@RequestMapping("/updateListSuccess")
	public String updateListSuccess() {
		return "upload/register_success";		
	}
	
	//수정 취소 후 리스트
	@RequestMapping("/updateListCancel")
	public String updateListCancel() {
		return "upload/register_success";		
	}	
	
	//업로드
	@PostMapping("/listSuccess")
	public String registerSuccess(Project project, PrjOption prjoption, AddPrjOption addPrjOption, MultipartFile uploadfile) {	
		
	try {
		//트렌젝션추가
		service.trJoinPrjAndPrjOpt(project, prjoption, uploadfile);
		//옵션 추가
//		addPrjOption.setPrjNo(prjoption.getPrjNo());
//		optionService.insertAddPrjOption(addPrjOption);		
		return "upload/register_success";
	
		}catch (Exception e) { 
			e.printStackTrace();
		 
		 return "upload/register"; 
		 }				
	}
	//프로젝트 수정
	@RequestMapping("/updatePrj/{prjNo}")
	public ModelAndView updateProject(@PathVariable("prjNo") int prjNo) {
		System.out.println("prjNo >> "+ prjNo);
		List<PrjOption> project = optionService.showPrjOptionByPrjNo(prjNo);
		System.out.println("project >>>> " +project);
		if(project == null) {
			throw new ProjectNotFoundException();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("project", project);
		mav.setViewName("upload/update");
		
		return mav;	
	}

}
