package proj21_funding.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import proj21_funding.dto.Message;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService service;
	
	@RequestMapping("/message/message-receive")
	public String receive() {
		return "message/message-receive";
	}
	
	@RequestMapping("/message/message-send")
	public String send() {
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
			return "message/message-receive";
		} catch (UserNotFoundException  e) {
			errors.rejectValue("UserName", "notSearching");
			return "message/message-write";
		}
		
		
	}
}
