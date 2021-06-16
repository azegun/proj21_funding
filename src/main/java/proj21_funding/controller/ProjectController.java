package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.FundingInfoService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.ProjectService;
import proj21_funding.service.UserInfoService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	@Autowired
	private PrjOptionService optionService;
	@Autowired
	private FundingInfoService fundingService;
	@Autowired
	private ProjectJoinService joinService;
	@Autowired
	private UserInfoService userService;

//	모든 프로젝트
	@RequestMapping("/projectListAll")
	public ModelAndView listAll() {
		List<Project> projects = projectService.showProjectListAll();
		List<ProjectJoin> prjs = joinService.showProjectJoinAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/list");
		mav.addObject("projects", projects);
		mav.addObject("prjs", prjs);
		return mav;
	}

	@RequestMapping("/sucessImbakProject")
	public ModelAndView ImbakListAll() {

		ModelAndView mav = new ModelAndView();
		List<ProjectJoin> prjs = joinService.showProjectSuccessImbak();
		mav.setViewName("project/list");
		mav.addObject("prjs", prjs);
		return mav;
	}

	@RequestMapping("/projectListSearch")
	public String listByName(Model model, HttpServletRequest request) {
		List<ProjectJoin> prjs = null;
		if (request.getParameter("type").equals("prjName")) {
			 prjs = joinService.showProjectJoinByPrjName(request.getParameter("param"));
		} else if (request.getParameter("type").equals("prjManager")) {
			 prjs = joinService.showProjectJoinByPrjManager(request.getParameter("param"));
		}
		model.addAttribute("prjs",prjs);
		System.out.println(request.getParameter("type"));
		System.out.println(request.getParameter("param"));
		return "project/list";
	}
	

//	@RequestMapping("/projectListAll")
//	public String listAll(Model model) {
//		List<Project> projects = mapper.selectProjectListAll();
//		model.addAttribute("projects",projects);
//		return "project/list";
//	}

	@RequestMapping("/prjDetail/{prjNo}")
	public ModelAndView detail(@PathVariable("prjNo") int prjNo, HttpSession session) {
		int count;
		int sum;
		List<PrjOption> prj = optionService.showPrjOptionByPrjNo(prjNo);
		session.setAttribute("prj", prj);
		session.setAttribute("prjNo", prjNo);
//		List<Project> prjList=projectService.showProjectListAll();
		try {
			count = fundingService.showCountByPrjNo(prjNo);
			sum = fundingService.showSumByPrjNo(prjNo);
		} catch (BindingException e) {
			count = 0;
			sum = 0;
		}
		ModelAndView mav = new ModelAndView("project/project_detail", "prj", prj);
		mav.addObject("count", count);
		mav.addObject("sum", sum);
		return mav;
	}
	
	@RequestMapping("/fundingProject")
	public ModelAndView funding(HttpServletRequest request,HttpSession session) {
//		System.out.println(session.getAttribute("authInfo"));
		UserAuthInfo uai = (UserAuthInfo) session.getAttribute("authInfo");
		String userId = uai.getUserId();
		UserInfo ui = userService.showUserInfoById(userId);
//		System.out.println(ui);
		int price = Integer.parseInt(request.getParameter("price"));
		int optNo = Integer.parseInt(request.getParameter("optNo"));
		int prjNo = (int) session.getAttribute("prjNo");
		ProjectJoin prjInfo = joinService.showProjectJoinByPrjNo(prjNo);
		PrjOption buyOption = optionService.showPrjOptionByOptNo(optNo);
		
		 
		ModelAndView mav = new ModelAndView("funding/fundingScreen","price",price);
		mav.addObject("price",price);
		mav.addObject("buyOption",buyOption);
		mav.addObject("prjInfo",prjInfo);
		mav.addObject("ui",ui);
		return mav;
	}
}
