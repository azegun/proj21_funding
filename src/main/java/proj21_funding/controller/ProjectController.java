package proj21_funding.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.binding.BindingException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.Message;
import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserLogin;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.service.FundingInfoService;
import proj21_funding.service.MessageService;
import proj21_funding.service.PrjBoardService;
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
	@Autowired
	private MessageService service;
	@Autowired
	private PrjBoardService boardService;

//	모든 프로젝트
	@RequestMapping("/projectList")
	public ModelAndView listAll(@RequestParam(value = "keyword", defaultValue = "total") String keyword,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "finishYn", required = false, defaultValue = "notFinished") String finishYn,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "12") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "9") int pageSize, HttpSession session)
			throws Exception {

		int pageSearch = (currentPage - 1) * cntPerPage;

		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("finishYn", finishYn);
		listMap.put("currentPage", currentPage);
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize", pageSize);
		listMap.put("pageSearch", pageSearch);

		List<ProjectJoin> prjs = joinService.showProjectListByMap(listMap);
		int listCount = joinService.showProjectListByMapCount(listMap);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCount);

		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("finishYn", finishYn);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("project/list");
		mav.addObject("prjs", prjs);
		mav.addObject("listCount", listCount);
		return mav;
	}

	@RequestMapping("/projectList/{pCategoryNo}")
	public String category(@PathVariable("pCategoryNo") int pCategoryNo, Model model,
			@RequestParam(value = "keyword", defaultValue = "total") String keyword,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
			@RequestParam(value = "finishYn", required = false, defaultValue = "notFinished") String finishYn,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session)
			throws Exception {

		int pageSearch = (currentPage - 1) * cntPerPage;

		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("finishYn", finishYn);
		listMap.put("currentPage", currentPage);
		listMap.put("cntPerPage", cntPerPage);
		listMap.put("pageSize", pageSize);
		listMap.put("pageSearch", pageSearch);
		listMap.put("category", pCategoryNo);

		List<ProjectJoin> prjs = joinService.showProjectListByMap(listMap);
		int listCount = joinService.showProjectListByMapCount(listMap);
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCount);

		session.setAttribute("pagination", pagination);
		session.setAttribute("keyword", keyword);
		session.setAttribute("searchKeyword", searchKeyword);
		session.setAttribute("finishYn", finishYn);

//		List<ProjectJoin> prjs = joinService.showProjectJoinByPcategoryno(pCategoryNo);
		model.addAttribute("prjs", prjs);
		model.addAttribute("pCateogryNo", pCategoryNo);
		model.addAttribute("listCount", listCount);
		return "project/listByCategory";
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
		model.addAttribute("prjs", prjs);
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
		List<PrjBoard> prBd = boardService.showPrjBoardbyPrjNo(prjNo);
		List<String> imgList = new ArrayList<String>();
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<FundingInfo> fundingInfos = service.showFundingInfosByPrjNo(prjNo);

		for (PrjBoard board : prBd) {
			UserInfo user = service.showUserbyNo(board.getUserNo().getUserNo());
			board.setUserNo(user);

			if (board.getPostFile() != null && board.getPostFile().length > 0) {
				try {
					byte[] imagefile = board.getPostFile();
					byte[] encodeBase64 = Base64.encodeBase64(imagefile);
					String base64DataString = new String(encodeBase64, "UTF-8");
					imgList.add(base64DataString);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}

		if (authInfo != null) {
			for (FundingInfo info : fundingInfos) {
				if (info.getUserNo().getUserNo() == authInfo.getUserNo()) {
					session.setAttribute("info", info);
				}
			}
		}

		session.setAttribute("img", imgList);
		session.setAttribute("board", prBd);
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

	@GetMapping("/prjBoard/{postNo}")
	public String prjBoard(@PathVariable int postNo, PrjBoardReply prjBoardReply, Model model) {			
		PrjBoard prjBoard = boardService.showPrjBoardbyPostNo(postNo);
		UserInfo user = service.showUserbyNo(prjBoard.getUserNo().getUserNo());
		prjBoard.setUserNo(user);		

		if (prjBoard.getPostFile() != null && prjBoard.getPostFile().length > 0) {
			try {
				byte[] imagefile = prjBoard.getPostFile();
				byte[] encodeBase64 = Base64.encodeBase64(imagefile);
				String base64DataString = new String(encodeBase64, "UTF-8");
				model.addAttribute("img", base64DataString);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("prjBoard", prjBoard);
		
		List<PrjBoardReply> boardReply = boardService.showPrjBoardReplyPostNo(postNo);
		for(PrjBoardReply reply : boardReply) {
			UserInfo userInfo = service.showUserbyNo(reply.getUserNo().getUserNo());
			reply.setUserNo(userInfo);
		}				
		model.addAttribute("boardReply", boardReply);
		return "/prjBoard/prjBoard-detail";		
	}
	
	@PostMapping("/prjBoard/{postNo}")
	public String prjBoard(@PathVariable int postNo, PrjBoardReply prjBoardReply, RedirectAttributes rttr, HttpSession session, Model model) {
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		UserInfo userInfo = service.showUserbyNo(authInfo.getUserNo());
		if(userInfo == null) {
			return "redirect:/prjBoard/"+ postNo;
		}
		prjBoardReply.setUserNo(userInfo);		
		try {
			boardService.registPrjBoardReply(prjBoardReply);
		}catch (NullPointerException e) {
			rttr.addFlashAttribute("err","전달하고 싶은 내용을 적어주세요.");
		}
		return "redirect:/prjBoard/"+ postNo;
	}
	
	// 프로젝트 게시판 글쓰기
	@GetMapping("/prjBoard/prjBoard-write")
	public String write(PrjBoard prjBoard, HttpSession session, Model model, MultipartFile postFile) {
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		model.addAttribute("authInfo", authInfo);
		return "prjBoard/prjBoard-write";
	}

	@PostMapping("/prjBoard/prjBoard-write")
	public String write(@Valid PrjBoard prjBoard, Errors errors, Model model, MultipartFile postFile) {

		try {
			boardService.registPrjBoard(prjBoard, postFile);
			String complet = "등록되었습니다.";
			model.addAttribute("complet", complet);
		} catch (NullPointerException e) {
			errors.rejectValue("postContent", "nullContent");
			return "prjBoard/prjBoard-write";
		}
		return "prjBoard/prjBoard-write";
	}

	@RequestMapping("/fundingProject")
	public ModelAndView funding(@Valid UserLogin userLogin, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		UserAuthInfo uai;
		int prjNo = (int) session.getAttribute("prjNo");
		try {
			uai = (UserAuthInfo) session.getAttribute("authInfo");
			System.out.println(request.getParameter("price"));
			System.out.println(request.getParameter("optNo"));
			String userId = uai.getUserId();
			UserInfo ui = userService.showUserInfoById(userId);
//		System.out.println(ui);
			int price = Integer.parseInt(request.getParameter("price"));
			int optNo = Integer.parseInt(request.getParameter("optNo"));
			ProjectJoin prjInfo = joinService.showProjectJoinByPrjNo(prjNo);
			PrjOption buyOption = optionService.showPrjOptionByOptNo(optNo);
			ModelAndView mav = new ModelAndView("funding/fundingScreen", "price", price);
			mav.addObject("price", price);
			mav.addObject("buyOption", buyOption);
			mav.addObject("prjInfo", prjInfo);
			mav.addObject("ui", ui);
			return mav;
		} catch (NullPointerException e) {
			return new ModelAndView("redirect:/login");
		}
	}

	// 창작자에게 문의하기
	@GetMapping("/project/question-write")
	public String Question(Message message) {
		return "project/question-write";
	}

	@PostMapping("/project/question-write")
	public String Question1(@Valid Message message, Errors errors, Model model) {
		if (message.getSendUser().equals("")) {
			String complet = "로그인이 필요합니다.";
			model.addAttribute("complet", complet);
			return "project/question-write";
		}
		try {
			service.sendMessage(message);
			String complet = "전송되었습니다.";
			model.addAttribute("complet", complet);
		} catch (NullPointerException e) {
			errors.rejectValue("msgContent", "nullContent");
		}
		return "project/question-write";
	}

}
