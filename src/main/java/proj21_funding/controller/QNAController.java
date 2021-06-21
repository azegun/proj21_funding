package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.QNA;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.service.CategoryService;
import proj21_funding.service.MessageService;
import proj21_funding.service.QNAService;

@Controller
public class QNAController {

	@Autowired
	QNAService qnaService;

	@Autowired
	CategoryService bcService;

	@Autowired
	MessageService userService;

	@RequestMapping("/servicecenter/servicecenter_view_all")
	public ModelAndView qnaAll() {
		List<QNA> qna = qnaService.showQNAByUserId(1);
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("servicecenter/servicecenter_view_all");
		mav.addObject("qna", qna);
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/servicecenter/servicecenter_view_admin")
	public ModelAndView qnaAllAdmin(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session)
			throws Exception {
		List<BoardCategory> bc = bcService.showBCByClass("qna");

		ModelAndView mav = new ModelAndView();

		int listCnt = qnaService.QNACount();
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		session.setAttribute("pagination", pagination);

		mav.setViewName("servicecenter/servicecenter_view_admin");
		mav.addObject("pagination", pagination);
		mav.addObject("qna", qnaService.SelectAllList(pagination));
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/servicecenter/servicecenter_view_user")
	public ModelAndView qnaUser(
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, HttpSession session) throws Exception {
		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");
		
		int listCnt = qnaService.QNAUserCount(user.getUserNo());
		Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
		pagination.setTotalRecordCount(listCnt);
		session.setAttribute("pagination", pagination);
		System.out.println(pagination.getTotalRecordCount());
		
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("servicecenter/servicecenter_view_user");
		mav.addObject("pagination", pagination);
		mav.addObject("qna", qnaService.SelectUserList(user.getUserNo(),pagination));
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/servicecenter/servicecenter_view_detail/{qnaNo}")
	public ModelAndView detail(@PathVariable("qnaNo") int qnaNo) {
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		QNA qna = qnaService.showQNAByNo(qnaNo);
		UserInfo user = userService.showUserbyNo(qnaNo);
		System.out.println(user);
		ModelAndView mav = new ModelAndView("servicecenter/servicecenter_view_detail", "qna", qna);
		mav.addObject("bc", bc);
		mav.addObject("user", user);
		return mav;
	}

	@RequestMapping("/servicecenter/servicecenter_write")
	public ModelAndView WriteAll() {
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("servicecenter/servicecenter_write");
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/servicecenter/servicecenter_reply/{qnaNo}")
	public ModelAndView ReplyAll(@PathVariable("qnaNo") int qnaNo) {
		QNA qna = qnaService.showQNAByNo(qnaNo);
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		UserInfo user = userService.showUserbyNo(qnaNo);
		System.out.println(qna);
		System.out.println(user);
		ModelAndView mav = new ModelAndView("servicecenter/servicecenter_write_reply", "qna", qna);
		mav.addObject("user", user);
		mav.addObject("bc", bc);
		return mav;
	}

	@PostMapping("/qnaSuccess")
	public String qnaUpload(QNA qna, BoardCategory bc) {
		try {
			System.out.println(qna);
			qnaService.uploadQNA(qna);
			return "servicecenter/servicecenter_write_end";

		} catch (Exception e) {
			e.printStackTrace();

			return "servicecenter/servicecenter_write";
		}

	}

	@PostMapping("/qnaRpSuccess")
	public ModelAndView qnaReply(QNA qna) {
		try {
			System.out.println(qna);
			qnaService.replyQNA(qna);
			return detail(qna.getQnaNo());

		} catch (Exception e) {
			e.printStackTrace();

			return detail(qna.getQnaNo());
		}

	}

	@GetMapping("/servicecenter_delete/{qnaNo}")
	public String deleteSuccess(@PathVariable("qnaNo") int qnaNo) {
		try {
			System.out.println(qnaNo);
			qnaService.removeQNA(qnaNo);
			return "servicecenter/servicecenter_delete";

		} catch (Exception e) {
			e.printStackTrace();

			return "servicecenter/servicecenter_view_detail/{qnaNo}";
		}
	}
}
