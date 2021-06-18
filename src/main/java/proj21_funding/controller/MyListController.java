package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.Project;
import proj21_funding.service.MyListService;
import proj21_funding.service.PrjCategoryService;

@Controller
public class MyListController {

		@Autowired
		private MyListService listService;
		
		@Autowired
		private PrjCategoryService prjCategoryService;
		
//		파일등록에서 수정완료시 버튼
		@GetMapping("/myUploadedlist/{authInfo.userNo}")
		public ModelAndView myUploadedList(@PathVariable("authInfo.userNo") int userNo) {			
			List<Project> list = listService.showAllMyList(userNo);			
			ModelAndView mav = new ModelAndView();
			mav.addObject("myList", list);
			mav.setViewName("mylist/myuploaded_list");
			return mav;
		}
//		디테일리스트에서 마이리스트로
		@GetMapping("/backMyList/{authInfo.userNo}")
		public ModelAndView backMyList(@PathVariable("authInfo.userNo") int userNo) {
			List<Project> list = listService.showAllMyList(userNo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("myList", list);
			mav.setViewName("mylist/myuploaded_list");
			return mav;
		}
		
		//홈 메뉴에서 마이리스트(등록된 리스트)
		@RequestMapping("/homeToMyList/{authInfo.userNo}")
		public ModelAndView homeTomyUploadedList(@PathVariable("authInfo.userNo") int userNo) {			
			List<Project> list = listService.showAllMyList(userNo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("myList", list);
			mav.setViewName("mylist/myuploaded_list");	
			
			return mav;
		}
//		마이리스트에서 디테일리스트
		@RequestMapping("/selectDetailList/{prjNo}")
		public ModelAndView	showDetailList(@PathVariable("prjNo") int prjNo) {		
			System.out.println("prjNo >>" + prjNo);
			List<Project> list = listService.showDetailListByprjNo(prjNo);
			List<PrjCategory> categorylist = prjCategoryService.showCategory();
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("myList", list);
			mav.addObject("categoryList", categorylist);
			mav.setViewName("mylist/mydetail_list");	
		
			return mav;
		}
//		디테일리스트에서 수정
		@RequestMapping("/myListUpdate/{prjNo}")
		public String myListUpdate(@PathVariable("prjNo") int prjNo) {
			System.out.println("prjNo >> "+ prjNo);
			return "mylist/mydetail_update";
		}

}
