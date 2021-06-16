package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.Project;
import proj21_funding.service.MyListService;

@Controller
public class MyListController {

		@Autowired
		private MyListService listService;
	
		@GetMapping("/myUploadedlist")
		public String myUploadedList() {			
			return "mylist/myuploaded_list";
		}
		
		@RequestMapping("/homeToMyList/{authInfo.userNo}")
		public ModelAndView homeTomyUploadedList(@PathVariable("authInfo.userNo") int userNo) {			
			System.out.println("authInfo >> " + userNo );
			List<Project> list = listService.showAllMyList(userNo);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("myList", list);
			mav.setViewName("mylist/myuploaded_list");	
			
			return mav;
		}
		@RequestMapping("/selectDetailList/{prjNo}")
		public String	showDetailList(@PathVariable("prjNo") int prjNo) {		
			System.out.println("prjNo >>" + prjNo);
			return "mylist/mydetail_list";
		}

}
