package proj21_funding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UploadController {
	//home에서 프로젝트 올리기
	@RequestMapping("/upload/upload_main")
	public String uploadMain() {
		return "upload/upload_main";
	}
	
}
