package proj21_funding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import proj21_funding.dto.QNA;
import proj21_funding.service.QNAService;

@Controller
public class QNAController {
	
	@Autowired
	QNAService service;
	
	@PostMapping("/qnaSuccess")
	public String qnaUpload(QNA qna) {
	try {
		System.out.println(qna);
		service.uploadQNA(qna);
		System.out.println(qna);
		return "board_servicecenter/servicecenter_write_end";
	
		}catch (Exception e) { 
			e.printStackTrace();
		 
		 return "board_servicecenter/servicecenter_write"; 
		 }
				
	}
}
