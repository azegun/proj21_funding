package proj21_funding.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import proj21_funding.dto.Project;

@Controller
public class MyListController {

		@GetMapping("/myUploadedlist")
		public String myUploadedList() {			
			
			return "mylist/myuploaded_list";
		}
		
		@GetMapping("/homeToMyList/{authInfo.userNo}")
		public String homeTomyUploadedList(@PathVariable("authInfo.userNo") int userNo) {	
			System.out.println("authInfo >> " + userNo );
			
			return "mylist/myuploaded_list";
		}

}
