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

import proj21_funding.dto.Message;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;

	@RequestMapping("/message/message-receive")
	public String receive(Message message, HttpSession session, Model model) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<Message> messages = service.showByreceiveUser(userAuthInfo.getUserId());

		model.addAttribute("messages", messages);
		return "message/message-receive";
	}

	@RequestMapping("/message/dels")
	public String receive(String[] check, HttpSession session) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");

		if (check == null) {
			return "redirect:/message/message-receive";
		}
		Message message = null;
		
		for (int i = 0; i < check.length; i++) {
			message = service.showByMsgNo(Integer.parseInt(check[i]));			
			if(message.getReceiveUser().equals(userAuthInfo.getUserId())) {
				service.removeReceiveMessage(message);
			}else {
				service.removeSendMessage(message);
			}
			
		}
		
		if(message.getReceiveUser().equals(userAuthInfo.getUserId())) {
			return "redirect:/message/message-receive";
		}else {
			return "redirect:/message/message-send";
		}
		
	}

	@GetMapping("/message/message-receive/{msgNo}")
	public String receiveDetail(@PathVariable("msgNo") int msgNo, Message message, Model model) {
		message = service.showByMsgNo(msgNo);

		service.readMessage(message);
		model.addAttribute("msgNo", message.getMsgNo());
		model.addAttribute("rcUser", message.getReceiveUser());
		model.addAttribute("seUser", message.getSendUser());
		model.addAttribute("content", message.getMsgContent());

		return "message/message-detail";
	}

	@PostMapping("/message/message-receive/{msgNo}")
	public String receiveReply(@PathVariable("msgNo") int msgNo, Message message, Errors errors, Model model) {
		if (message == null) {
			throw new UserNotFoundException();
		}
		try {
			Message message1 = new Message(message.getReceiveUser(), message.getSendUser(), message.getMsgContent());
			service.sendMessage(message1);

			return "redirect:/message/message-receive";
		} catch (UserNotFoundException e) {
			errors.rejectValue("UserName", "notSearching");
			return "message/message-detail";
		}

	}

	@GetMapping("/message/message-receive/delete/{msgNo}")
	public String delete(@PathVariable("msgNo") int msgNo, Message message, Errors errors, HttpSession session) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		
		if (errors.hasErrors()) {
			return "redirect:/message/message-detail/{msgNo}";
		}
		
		message = service.showByMsgNo(message.getMsgNo());
		
		if(message.getReceiveUser().equals(userAuthInfo.getUserId())) {
			service.removeReceiveMessage(message);
			return "redirect:/message/message-receive";
		}else {
			service.removeSendMessage(message);
			return "redirect:/message/message-send";
		}		
	
	}

	@RequestMapping("/message/message-unRead")
	public String unRead(Message message, HttpSession session, Model model) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<Message> messages = service.showByreceiveUserUnRead(userAuthInfo.getUserId());

		model.addAttribute("messages", messages);
		return "message/message-unRead";
	}

	@RequestMapping("/message/message-send")
	public String send(Message message, HttpSession session, Model model) {
		UserAuthInfo userAuthInfo = (UserAuthInfo) session.getAttribute("authInfo");
		List<Message> messages = service.showBySendUser(userAuthInfo.getUserId());

		model.addAttribute("messages", messages);
		return "message/message-send";
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
			return "redirect:/message/message-receive";
		} catch (UserNotFoundException e) {
			errors.rejectValue("UserName", "notSearching");
			return "message/message-write";
		}

	}

}
