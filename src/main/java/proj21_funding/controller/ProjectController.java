package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectService;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService service;
	@Autowired
	PrjOptionService service1;
	
//	모든 프로젝트
	@RequestMapping("/projectListAll")
	public ModelAndView listAll() {
		List<Project> projects = service.showProjectListAll();
		return new ModelAndView("project/list","projects",projects);
	}
	
//	@RequestMapping("/projectListAll")
//	public String listAll(Model model) {
//		List<Project> projects = mapper.selectProjectListAll();
//		model.addAttribute("projects",projects);
//		return "project/list";
//	}
	
	@RequestMapping("/prjDetail/{prjNo}")
	public ModelAndView detail(@PathVariable("prjNo") int prjNo) {
//		Project prj = service.showProjectByNo(prjNo);
		List<PrjOption> prj= service1.showPrjOptionByPrjNo(prjNo);
		ModelAndView mav = new ModelAndView("project/project_detail","prj",prj);
		return mav;
	}
}
