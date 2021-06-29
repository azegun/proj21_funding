package proj21_funding.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.PrjCategory;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.BoardService;
import proj21_funding.service.CategoryService;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminController {
	@Autowired
	private UserInfoService userService;
	
	@Autowired
	private ProjectJoinService joinService;
	
	@Autowired
	private PrjCategoryService categoryService;
	
	@Autowired
	private PrjOptionService optionService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CategoryService bcService;
	
	@RequestMapping("/admin")
	public String adminMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("/adminMember")
	public ModelAndView adminMember() {
		//회원 후원한프로젝트수,후원금액
		List<ProjectJoin> fundingStatic= joinService.showSumCountGroupByUserNo();
		//회원별 등록프로젝트수
		List<ProjectJoin> regProject= joinService.showProjectGroupByUserNo();	
		//회원별 제작성공프로젝트수
		List<ProjectJoin> successProject= joinService.showSucessProjectGroupByUserNo();
		
		List<UserInfo> userList = userService.showUserAll();
		//총유저수
		int count =userService.userCount();
		//탈퇴 제외 유저수
		int currentCount=userService.currentUserCount();
		//제작자수
		int prdCount=userService.prdcount();
		ModelAndView mav = new ModelAndView("admin/adminMember","userList",userList);
		mav.addObject("count",count);
		mav.addObject("prdCount",prdCount);
		mav.addObject("currentCount", currentCount);
		mav.addObject("fundingStatic", fundingStatic);
		mav.addObject("regProject", regProject);
		mav.addObject("successProject", successProject);
		return mav;
	}
	
	@RequestMapping("/adminProject")
	public ModelAndView adminProject() {
//		카테고리 콤보박스 리스트
		List<PrjCategory> categoryList = categoryService.showCategory();
		List<ProjectJoin> prjList = joinService.showProjectJoinAll();
		ProjectJoin sumCount =joinService.showProjectSumCountAll();
		
		ModelAndView mav = new ModelAndView("admin/adminProject","prjList",prjList);
		mav.addObject("categoryList",categoryList);
		mav.addObject("sumCount",sumCount);
		return mav;
	}
	
	@RequestMapping("/adminBoard")
	public ModelAndView searchProject(@RequestParam(value="category",required=false,defaultValue = "total") String category,
			@RequestParam(value="keyword",required=false, defaultValue = "total") String keyword,
			@RequestParam(value="searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session) throws Exception {
		
		int pageSearch = (currentPage-1)*cntPerPage;
		
		Map<String,Object> listMap = new HashMap<String,Object>();
		listMap.put("category", category);
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("currentPage",currentPage );
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize",pageSize );
		listMap.put("pageSearch",pageSearch);
		
		System.out.println(category);
		System.out.println(keyword);
		System.out.println(searchKeyword);
		System.out.println(listMap);
		
		int listCnt = boardService.selectSearchBoardListCount(listMap);
		System.out.println(listCnt);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		List<BoardCategory> bc = bcService.showBCByClass("board");
		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("category", category);
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("admin/adminBoard");
		mav.addObject("pagination", pagination);
		mav.addObject("listCnt", listCnt);
		mav.addObject("board", boardService.selectSearchBoardList(listMap));
		mav.addObject("bc", bc);

		return mav;
	}
	
//	@RequestMapping("/adminBoard")
//	public ModelAndView adminBoard(
//			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
//			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
//			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session)
//					throws Exception {
//		ModelAndView mav = new ModelAndView("admin/adminBoard");
//		
//		int listCnt = boardService.BoardCount();
//		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
//		pagination.setTotalRecordCount(listCnt);
//		List<BoardCategory> bc = bcService.showBCByClass("board");
//		session.setAttribute("pagination", pagination);
//		
//		mav.addObject("pagination", pagination);
//		mav.addObject("board", boardService.selectBoardCategoryList(pagination));
//		mav.addObject("boardCount", boardService.selectBoardCategoryListForCount());
//		mav.addObject("listCnt", listCnt);
//		mav.addObject("bc", bc);
//		return mav;
//	}
	
	@RequestMapping("/accordion")
	public ModelAndView adminTest() {
		List<UserInfo> userList = userService.showUserAll();
		ModelAndView mav = new ModelAndView("admin/accordion","userList",userList);
		return mav;
	}
	
	
}
