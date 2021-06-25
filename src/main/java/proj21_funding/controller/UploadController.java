package proj21_funding.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.project.AddPrjOption;
import proj21_funding.dto.project.UpdateProject;
import proj21_funding.exception.DateTimeOverException;
import proj21_funding.exception.ProjectNotDeleteException;
import proj21_funding.exception.ProjectNotFoundException;
import proj21_funding.service.MyListService;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectAndPrjOptionService;
import proj21_funding.service.ProjectService;
import proj21_funding.service.UserInfoService;

@Controller
public class UploadController {	
	
	//web.xml에 있는 multipart-config 주소랑 동일시하게 
	private static final String UPLOAD_PATH = "C:\\workspace_web\\proj21_funding\\src\\main\\webapp\\images\\project";

	@Autowired
	private ProjectAndPrjOptionService trService;
	
	@Autowired
	private PrjOptionService optionService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private PrjCategoryService prjCategoryService;
	
	@Autowired
	private UserInfoService userService;
	
	private List<PrjOption> optList;
	
//	업로드 할 시 계좌 등록 안되어있으면 계좌 등록
	@GetMapping("/registerAccount")
	public String registerAccount() {
		return "upload/register_bankaccount";
	}
	
//	home에서 프로젝트 올리기 광고페이지
	@GetMapping("/uploadMain")
	public String uploadMain() {		
		return "upload/upload_main";
	}
//	로그인 되어있을 시 파일 업로드 가능.
	@GetMapping("/uploadMain/{authInfo.userNo}")
	public ModelAndView uploadMainByNo(@PathVariable("authInfo.userNo") int userNo) {
		UserInfo list = userService.showBankAccount(userNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("upload/upload_main");	
		
		return mav;
	}
//  계좌 등록 페이지
	@PostMapping("/registerBank/{authInfo.userNo}")
	public ModelAndView updateBankAccount(@PathVariable("authInfo.userNo") int userNo, UserInfo userInfo ) {
		userService.updateBankAccount(userInfo);
		List<PrjCategory> list = prjCategoryService.showCategory();

		ModelAndView mav = new ModelAndView();		
		mav.addObject("category", list);
		mav.setViewName("upload/register");
		
		return mav;
	}
	
	//광고페이지에서 등록 html 여기
	@GetMapping("/registerForm")
	public ModelAndView uploadRegister() {	
		List<Project> proList = projectService.showProjectListAll();
		List<PrjCategory> list = prjCategoryService.showCategory();
//		System.out.println("prjcategory >>" + list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("category", list);
		mav.addObject("prjList", proList);		
		mav.setViewName("upload/register");			
		return mav;
	}
	
	//등록 취소 후 광고페이지
	@GetMapping("/uploadListCancel")
	public  String uploadCancel() {
		return "upload/upload_main";
	}
	
	//수정 취소 후 리스트
	@RequestMapping("/updateListCancel")
	public String updateListCancel() {
		return "upload/register_success";		
	}	
	
	//업로드
	@PostMapping("/listSuccess")
	public ModelAndView registerSuccess(Project project,  PrjOption prjoption, 	AddPrjOption addPrjOption,
										MultipartFile uploadfile,  HttpServletResponse response) throws IOException {	
		ModelAndView mav = new ModelAndView();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			//트렌젝션추가
			trService.trJoinPrjAndPrjOpt(project, prjoption, uploadfile);		
			optList = optionService.selectSimplePrjOptionByPrjNo(project.getPrjNo());
			System.out.println("optList >> "+  optList);
			//두개 이상이면 작동옵션
			if(addPrjOption.getAddOptName() != null) {
				addPrjOption.setPrjNo(prjoption.getPrjNo());
				optionService.insertAddPrjOption(addPrjOption);
			}
			Project list = projectService.showJoinPrjAndCategory(project.getPrjNo());
			optList = optionService.selectSimplePrjOptionByPrjNo(project.getPrjNo());
			System.out.println("list>>> "+ list);
		
			mav.addObject("optList", optList);		
			mav.addObject("category", list);				
			mav.setViewName("upload/register_success");	
			return mav;	
		
		}catch (DateTimeOverException e) { 	
			out.println("<script type='text/javascript'>");
			out.println("alert('결재일이 마감일보다 빠를 수 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			mav.setViewName("upload/register");
		 return mav; 
		 }				
	}
	
	//등록완료페이지에서 -> 수정페이지
	@RequestMapping("/updatePrj/{prjNo}")
	public ModelAndView updateProject(@PathVariable("prjNo") int prjNo) {
		optList = optionService.selectSimplePrjOptionByPrjNo(prjNo);
		List<PrjOption> project = optionService.showPrjOptionByPrjNo(prjNo);
		
		List<PrjCategory> list = prjCategoryService.showCategory();
		
		if(project == null) { 
			throw new ProjectNotFoundException();
		}		
		ModelAndView mav = new ModelAndView();
		mav.addObject("optList", optList);
		mav.addObject("project", project);
		mav.addObject("category", list);
		mav.setViewName("upload/update");
		
		return mav;	
	}
	
	//수정 완료 후 리스트
	@PostMapping("/updateListSuccess")
	public ModelAndView updateListSuccess(UpdateProject project, PrjOption prjoption,
		AddPrjOption addprjoption,	MultipartFile uploadfile, 	HttpServletResponse response  ) throws IOException {
		
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("pNo", project.getPrjNo().getPrjNo());
		map.put("pCategoryNo", project.getpCategoryNo().getpCategoryNo());
		map.put("pName", project.getPrjName());
		map.put("pContent", project.getPrjContent());
		map.put("pGoal", project.getPrjGoal());
		map.put("eDate", project.getEndDate());
		map.put("pDate", project.getPayDate());
		map.put("oName", project.getOptName());
		map.put("oPrice", project.getOptPrice());
		map.put("oContent", project.getOptContent());
		
		// 파일 업로드
		String saveName = "project"+project.getPrjNo().getPrjNo()+".jpg";
		
		File saveFile = new File(UPLOAD_PATH, saveName);
		//카테고리 리스트
		
		try {
			uploadfile.transferTo(saveFile);
		}catch (IOException e) {
		e.printStackTrace();
		}
		// 프로젝트 수정
		ModelAndView mav = new ModelAndView();
		try {
		//리스트 조인
		projectService.joinUpdateProjectAndPrjoptionByNo(map);	
		
		if(addprjoption.getAddOptName() !=null) {
			System.out.println("ddd");
			//추가적인 업데이트
			prjoption.setOptNo(optList.get(0).getOptNo());
			optionService.updatePrjOption(prjoption);
			
			addprjoption.setAddOptNo(optList.get(1).getOptNo());
			optionService.updateAddOption(addprjoption);		
		}
		
		//옵션리스트 받기
		optList = optionService.selectSimplePrjOptionByPrjNo(prjoption.getPrjNo().getPrjNo());	
		
		}catch (DateTimeOverException e) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('결재일이 마감일보다 빠를 수 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
		}
		
		Project list = projectService.showJoinPrjAndCategory(project.getPrjNo().getPrjNo());
			
		mav.addObject("optList", optList);
		mav.addObject("project", map);
		mav.addObject("category", list);
		mav.setViewName("upload/update_success");	
	
		return mav;				 
	
	}
//	삭제
	@RequestMapping("/removeOneProject/{prjNo}")
	public String deleteProject(@PathVariable("prjNo") int prjNo) {
		trService.trremovePrjAndPrjOpt(prjNo);
		if(prjNo == 0) { 
			throw new ProjectNotDeleteException();
		}		
		return "/upload/register_success";
	}
		

}
