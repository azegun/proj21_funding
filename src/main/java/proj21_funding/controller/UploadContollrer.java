package proj21_funding.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadContollrer {
	
	private static final String UPLOAD_PATH = "C:\\workspace_web\\proj21_funding\\src\\main\\webapp\\images";
	
	@PostMapping("/fileUpload")
	public void upload(MultipartFile uploadfile) {
		System.out.println("upload() POST");
		System.out.println("filename >>" + uploadfile);
		System.out.println("파일 이름: {}" + uploadfile.getOriginalFilename());
		System.out.println("파일 크기: {}"+ uploadfile.getSize());
		
		saveFile(uploadfile);
		
		
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
