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
import proj21_funding.dto.QNA;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.BoardService;
import proj21_funding.service.CategoryService;
import proj21_funding.service.PrjCategoryService;
import proj21_funding.service.PrjOptionService;
import proj21_funding.service.ProjectJoinService;
import proj21_funding.service.QNAService;
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
	private QNAService qnaService;
	
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
		List<ProjectJoin> fundingStat= joinService.showSumCountGroupByUserNo();
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
		mav.addObject("fundingStat", fundingStat);
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
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			 HttpSession session) throws Exception {
		
		int pageSearch = (currentPage-1)*cntPerPage;
		
		Map<String,Object> listMap = new HashMap<String,Object>();
		listMap.put("category", category);
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("currentPage",currentPage );
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize",pageSize );
		listMap.put("pageSearch",pageSearch);
		
		
		int listCnt = boardService.selectSearchBoardListCount(listMap);
		System.out.println(listCnt);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		List<BoardCategory> bc = bcService.showBCByClass("board");
		session.setAttribute("pagination", pagination);
		session.setAttribute("category", category);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("admin/adminBoard");
		mav.addObject("pagination", pagination);
		mav.addObject("listCnt", listCnt);
		mav.addObject("board", boardService.selectSearchBoardList(listMap));
		mav.addObject("bc", bc);

		return mav;
	}
	
	@RequestMapping("/adminQna")
	public ModelAndView adminQna(@RequestParam(value="category",required=false,defaultValue = "total") String category,
			@RequestParam(value="keyword",required=false, defaultValue = "total") String keyword,
			@RequestParam(value="searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
			@RequestParam(value="replyYn", required = false, defaultValue="total") String replyYn, HttpSession session) throws Exception {

		int pageSearch = (currentPage-1)*cntPerPage;
		
		Map<String,Object> listMap = new HashMap<String,Object>();
		listMap.put("category", category);
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("currentPage",currentPage );
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize",pageSize );
		listMap.put("pageSearch",pageSearch);
		listMap.put("replyYn",replyYn);
		
		

		List<QNA> qnaList = qnaService.selectQnaListByMap(listMap);
		int count = qnaService.selectQnaCountByMap(listMap);	
		
		Pagination pagination1 = new Pagination(currentPage, cntPerPage, pageSize);
		pagination1.setTotalRecordCount(count);
		session.setAttribute("pagination1", pagination1);
		session.setAttribute("category", category);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("replyYn", replyYn);

		
		ModelAndView mav = new ModelAndView("admin/adminQna");
		mav.addObject("pagination1",pagination1);
		mav.addObject("qnaList",qnaList);
		mav.addObject("count",count);
		
		return mav;
	}
	
	
}
