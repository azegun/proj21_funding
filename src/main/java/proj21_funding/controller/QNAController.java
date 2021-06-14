package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.QNA;
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
	public ModelAndView qnaUser() {
		List<QNA> qna = qnaService.showQNAByUserId(1);
		List<BoardCategory> bc = bcService.showBCByClass("qna");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board_servicecenter/servicecenter_view_user");
		mav.addObject("qna", qna);
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
		System.out.println(bc);
		qna.setCategoryNo(new BoardCategory(bc.getCategoryNo()));
		System.out.println(qna);
		qnaService.uploadQNA(qna);
		System.out.println(qna);
		return "board_servicecenter/servicecenter_write_end";
	
		}catch (Exception e) { 
			e.printStackTrace();
		 
		 return "board_servicecenter/servicecenter_write"; 
		 }
				
	}
}
