package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.Message;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	@RequestMapping("/message/message-receive")
	public String receive(HttpSession session, Model model ) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<Message> messages = service.showByreceiveUser(userAuthInfo.getUserId());
		
		model.addAttribute("messages", messages );
		return "message/message-receive";
	}
	
	@RequestMapping("/message/message-receive/{msgNo}")
	public ModelAndView receiveDetail(@PathVariable("msgNo") int msgNo) {
		Message message = service.showByMsgNo(msgNo);		
		
		if (message == null) {
			throw new UserNotFoundException();
		}
		
		service.readMessage(message);		
		ModelAndView mav = new ModelAndView();
		mav.addObject("message", message);
		mav.setViewName("message/message-detail");		
		return mav;		
		
	}
	
	@RequestMapping("/message/message-unRead")
	public String unRead(HttpSession session, Model model ) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<Message> messages = service.showByreceiveUserUnRead(userAuthInfo.getUserId());
				
		model.addAttribute("messages", messages );
		return "message/message-unRead";
	}
		
	@RequestMapping("/message/message-unRead/{msgNo}")
	public ModelAndView unReadDetail(@PathVariable("msgNo") int msgNo) {
		Message message = service.showByMsgNo(msgNo);
		
		if (message == null) {
			throw new UserNotFoundException();
		}
		
		service.readMessage(message);	
		ModelAndView mav = new ModelAndView();		
		mav.addObject("message", message);
		mav.setViewName("message/message-detail");	
		
		return mav;		
		
	}
	
	@RequestMapping("/message/message-send")
	public String send(HttpSession session, Model model ) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<Message> messages = service.showBySendUser(userAuthInfo.getUserId());
		
		model.addAttribute("messages", messages );
		return "message/message-send";
	}
	
	@RequestMapping("/message/message-send/{msgNo}")
	public ModelAndView sendDetail(@PathVariable("msgNo") int msgNo) {
		Message message = service.showByMsgNo(msgNo);
		
		if (message == null) {
			throw new UserNotFoundException();
		}
		
		ModelAndView mav = new ModelAndView();		
		mav.addObject("message", message);
		mav.setViewName("message/message-detail");	
		
		return mav;				
	}
	
	@GetMapping("/message/message-write")
	public String write(Message message) {
		return "message/message-write";
	}
	
	@PostMapping("/message/message-write")
	public String write(@Valid Message message, Errors errors) {
		if (errors.hasErrors()) {
			return "message/message-write";
		}
		
		try {
			service.sendMessage(message);
			return "message/message-receive";
		} catch (UserNotFoundException  e) {
			errors.rejectValue("UserName", "notSearching");
			return "message/message-write";
		}		
		
	}
}
