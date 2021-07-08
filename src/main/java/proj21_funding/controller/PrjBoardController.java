package proj21_funding.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import proj21_funding.dto.PrjBoard;
import proj21_funding.dto.PrjBoardReply;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.service.MessageService;
import proj21_funding.service.PrjBoardService;

@Controller
public class PrjBoardController {
	@Autowired
	private MessageService service;
	@Autowired
	private PrjBoardService boardService;
	
	
	@ResponseBody
	@PostMapping("/registerReply")
	public String prjBoard(@RequestBody int postNo,String replyContent, PrjBoardReply prjBoardReply, RedirectAttributes rttr, HttpSession session, Model model) {
		System.out.println("postNo" + postNo);
		System.out.println("replyContent"+ replyContent);
		System.out.println(prjBoardReply);
		UserAuthInfo authInfo = (UserAuthInfo) session.getAttribute("authInfo");
		UserInfo userInfo = service.showUserbyNo(authInfo.getUserNo());
		if(userInfo == null) {
			return "redirect:/project/project_detail";
		}
		prjBoardReply.setUserNo(userInfo);		
		try {
			boardService.registPrjBoardReply(prjBoardReply);
		}catch (NullPointerException e) {
			rttr.addFlashAttribute("err","전달하고 싶은 내용을 적어주세요.");
		}
		return "redirect:/project/project_detail";
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
}
