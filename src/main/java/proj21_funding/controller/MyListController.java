package proj21_funding.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.dto.project.PrjPlusOption;
import proj21_funding.service.MyListService;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectAndPrjOptionService;
import proj21_funding.service.ProjectJoinService;

@Controller
public class MyListController {
	
		@Autowired
		private ProjectAndPrjOptionService trService;

		@Autowired
		private MyListService listService;		
		
		@Autowired
		private PrjCategoryService prjCategoryService;		
		
		@Autowired
		private MyListService myListService;
		
		@Autowired
		private PrjOptionService optionService;
		@Autowired
		private ProjectJoinService joinService;
		
		private List<PrjOption> optList;
		
		
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
		
		//페이징
		//홈 메뉴에서 마이리스트(등록된 리스트)
		@RequestMapping("/homeToMyList/{authInfo.userNo}")
		public ModelAndView homeTomyUploadedList(
				@PathVariable("authInfo.userNo") int userNo,
				@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
				@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
				@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, 
				HttpSession session) throws Exception {
			
			
			if(session.getAttribute("authInfo")==null) {
				return new ModelAndView("redirect:/login");
			}
			
			int pageSearch = (currentPage-1)*cntPerPage;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("uNo", userNo);
			map.put("currentPage",currentPage );
			map.put("cntPerPage", cntPerPage);
			map.put("pageSize",pageSize );
			map.put("pageSearch",pageSearch);
			System.out.println("map >> " + map);			
				
			int count = myListService.selectCountPrjByUserNo(map);
			
			Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
			pagination.setTotalRecordCount(count);
			session.setAttribute("pagination", pagination);
			
			System.out.println("page >> "+ pagination);
			List<Project> list = listService.showAllListByMap(map);		
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("map", map);
			mav.addObject("myList", list);
			mav.addObject("count",count);
			mav.setViewName("mylist/myuploaded_list");				
			return mav;
		}
		
		//마이리스트에서 디테일리스트
		@RequestMapping("/selectDetailList/{prjNo}")
		public ModelAndView	showDetailList(PrjPlusOption prjplusoption,
				@PathVariable("prjNo") int prjNo) {		
			List<Project> list = listService.showDetailListByprjNo(prjNo);
			List<PrjCategory> categorylist = prjCategoryService.showCategory();
			
			ModelAndView mav = new ModelAndView();
			optList = optionService.selectSimplePrjOptionByPrjNo(prjNo);
			
			System.out.println("optList >> " + optList);
			mav.addObject("optList", optList);
			mav.addObject("myList", list);
			mav.addObject("categoryList", categorylist);
			mav.setViewName("mylist/mydetail_list");	
		
			return mav;
		}
		
//		디테일리스트에서 수정
		@PostMapping("/myListUpdate/{authInfo.userNo}")
		public ModelAndView myListUpdate(PrjPlusOption prjplusoption,
				@PathVariable("authInfo.userNo") int userNo,
				@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
				@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
				@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, 
				HttpSession session, 
				HttpServletRequest request) {
			
			if(session.getAttribute("authInfo")==null) {
				return new ModelAndView("redirect:/login");
			}
			
			int pageSearch = (currentPage-1)*cntPerPage;
			
			Map<String, Object> map = new HashMap<String, Object>();	
			map.put("currentPage",currentPage );
			map.put("cntPerPage", cntPerPage);
			map.put("pageSize",pageSize );
			map.put("pageSearch",pageSearch);
			
			Enumeration enu = request.getParameterNames();
		      while (enu.hasMoreElements()) {
		         String name = (String) enu.nextElement();
		         String value = request.getParameter(name);
		         map.put(name, value);
		      }
		      
		      int count = myListService.selectCountPrjByUserNo(map);
			
			
		      System.out.println("map>> "+ map);
		      
		   boolean addOptName1 = map.containsKey("addOptName1");
		   boolean addOptName2 = map.containsKey("addOptName2");
		   boolean addOptName3 = map.containsKey("addOptName3");
			    
			    // 리스트를 새로 찍어줘야지 if조건에서 리스트를 찾음
		   optList = optionService.selectSimplePrjOptionByPrjNo(prjplusoption.getpNo());    
		   System.out.println("optList>> "+ optList);
		    try {
	
		    //프로젝트 + 옵션1 조인 업데이트
			myListService.joinUpdateProjectAndPrjOptionByPrjNoInMyLIst(map);
			
			   if(addOptName1 == false && addOptName2 == false && addOptName3 == false) {
			    	if( optList.size() > 1) {
			    		//수정이 1개일떄
				    	//지어진값은 데이터 삭제
			    		System.out.println("1번");
			    		map.put("addOptNo1", optList.get(1).getOptNo());
			    		if(optList.size() > 2) {
				    	map.put("addOptNo2", optList.get(2).getOptNo());
				    	//조건하기
					    	if(optList.size() == 4) {
				    		map.put("addOptNo3", optList.get(3).getOptNo());
					    	}
			    		}
				    	
				    	optionService.removeOptNumOne(map);
				    	optionService.removeOptNumThree(map);
			    		optionService.removeOptNumTwo(map);		    			
			    	}
			    }
		    
		    if(addOptName1 == true && addOptName2 == false  && addOptName3 ==false) {
		    		  //수정이 2개일떄
		    		  //지어진값은 데이터 삭제
			    	System.out.println("2번");
		    		if(optList.size() > 2) {
		    		map.put("addOptNo2", optList.get(2).getOptNo());
			    		if(optList.size() == 4) {
			    		map.put("addOptNo3", optList.get(3).getOptNo());
			    		}
		    		}
		    		 optionService.removeOptNumTwo(map);	
		    		 optionService.removeOptNumThree(map);		    
		    		 
		    		 myListService.updateListOptionByMap(map);

		    }else if (addOptName1 == true && addOptName2== true && addOptName3 == false) {
		    	  //수정이 3개일떄
		    		  //지어진값은 데이터 삭제
		    	System.out.println("3번");
		    		  if(optList.size() > 3) {
		    			  map.put("addOptNo3", optList.get(3).getOptNo());
		    			  }  		
		    		  
		    		  optionService.removeOptNumThree(map);
		    		  
		    		  myListService.updateListAllAddOptionsByMap(map);
		    }else if(addOptName1 == true && addOptName2 == true && addOptName3 == true) {
			  	  //수정이 4개일떄
		    	System.out.println("4번");
			      trService.trUpdateListAddOptionsOfFourTimes(map);
		    }
	    	
		    }catch (Exception e) {
		    	System.out.println(e);
		    }
		    
		    Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
			pagination.setTotalRecordCount(count);
			session.setAttribute("pagination", pagination);
			
			System.out.println("page >> "+ pagination);
			List<Project> list = listService.showAllListByMap(map);		
		    
		    optList = optionService.selectSimplePrjOptionByPrjNo(prjplusoption.getpNo());
//			List<Project> list = listService.showAllMyList(userNo);
			ModelAndView mav = new ModelAndView();		
			
			mav.addObject("optList", optList);
			mav.addObject("project", map);
			mav.addObject("myList", list);
			mav.addObject("count",count);
			mav.setViewName("redirect:/homeToMyList/"+userNo);				
			return mav;
		}
	}
