package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.QNA;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.service.CategoryService;
import proj21_funding.service.QNAService;

@Controller
public class QNAController {
	
	@Autowired
	QNAService qnaService;
	
	@Autowired
	CategoryService bcService;

	@RequestMapping("/board_servicecenter/servicecenter_view_all")
	public ModelAndView qnaAll() {
		List<QNA> qna = qnaService.showQNAByUserId(1);
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board_servicecenter/servicecenter_view_all");
		mav.addObject("qna", qna);
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/board_servicecenter/servicecenter_view_user")
	public ModelAndView qnaUser(HttpSession session) {
		UserAuthInfo user = (UserAuthInfo) session.getAttribute("authInfo");
		List<QNA> qna = qnaService.showQNAByUserId(user.getUserNo());
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board_servicecenter/servicecenter_view_user");
		mav.addObject("qna", qna);
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/board_servicecenter/servicecenter_view_detail/{qnaNo}")
	public ModelAndView detail(@PathVariable("qnaNo") int qnaNo) {
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		QNA qna = qnaService.showQNAByNo(qnaNo);
		ModelAndView mav = new ModelAndView("board_servicecenter/servicecenter_view_detail", "qna", qna);
		mav.addObject("bc", bc);
		return mav;
	}
	
	@RequestMapping("/board_servicecenter/servicecenter_write")
	public ModelAndView WriteAll() {
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board_servicecenter/servicecenter_write");
		mav.addObject("bc", bc);
		return mav;
	}
	
	@PostMapping("/qnaSuccess")
	public String qnaUpload(QNA qna, BoardCategory bc) {
	try {
		System.out.println(qna);
		qnaService.uploadQNA(qna);
		return "board_servicecenter/servicecenter_write_end";
	
		}catch (Exception e) { 
			e.printStackTrace();
		 
		 return "board_servicecenter/servicecenter_write"; 
		 }
				
	}
}
