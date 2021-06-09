package proj21_funding.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.service.ProjectAndPrjOptionService;

@Controller
public class UploadController {
	

	private static final String UPLOAD_PATH = "C:\\workspace_web\\proj21_funding\\src\\main\\webapp\\images";
	
	@Autowired
	private ProjectAndPrjOptionService service;
	
	//home에서 프로젝트 올리기 광고페이지
	@RequestMapping(value = "/upload/upload_main", method = RequestMethod.GET)
	public String uploadMain() {
		return "upload/upload_main";
	}
	
	//광고페이지에서 등록 html
	@RequestMapping(value = "/upload/register", method = RequestMethod.GET)
	public String uploadRegister() {
		return "upload/register";
	}
	
	@PostMapping("/ListSuccess")
	public String registerSuccess(Project project, PrjOption prjoption, MultipartFile uploadfile) {
		System.out.println("upload() POST");
		System.out.println("filename >>" + uploadfile);
		System.out.println("파일 이름: {}" + uploadfile.getOriginalFilename());
		System.out.println("파일 크기: {}"+ uploadfile.getSize());
		
		saveFile(uploadfile);
		
	try {
		service.trJoinPrjAndPrjOpt(project, prjoption);
		return "upload/register_success";
	
		}catch (Exception e) { 
			e.printStackTrace();
		 
		 return "upload/register"; 
		 }
				
	}

	private String saveFile(MultipartFile file) {
		
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		
		System.out.println("saveName: {}"+ saveName);
		
		File saveFile = new File(UPLOAD_PATH, saveName);
		
		try {
			file.transferTo(saveFile);
		}catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
		}
	
}
