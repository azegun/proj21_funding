package proj21_funding.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.service.UserInfoService;

@Controller
public class AdminMemberController {
	@Autowired
	private UserInfoService userService;

	@RequestMapping("/searchMember")
	public ModelAndView searchMember(@RequestParam(value="keyword", required = false) String keyword,
			@RequestParam(value="searchKeyword", required = false) String searchKeyword,
			@RequestParam(value="delYn", required = false) String delYn
			/*@RequestParam(value="memberAccount" ,required = false) String memberAccount,
			@RequestParam(value="memberName" ,required = false) String memberName,
			@RequestParam(value="nickname" ,required = false) String nickname*/) {
		System.out.println(keyword);
		System.out.println(searchKeyword);
		int count = userService.userCount();
		int currentCount=userService.currentUserCount();
		int prdCount=userService.prdcount();
		
		Map<String,Object> listMap = new HashMap<String, Object>();
		
		listMap.put("keyword", keyword);
		listMap.put("searchKeyword", searchKeyword);
		listMap.put("delYn", delYn);
		List<UserInfo> userList = userService.showUserListByMap(listMap);
		
		//		if(keyword.equals("total")) {
//			userList = userService.showUserAll();
//		} else if(keyword.equals("memberAccount")) {
//			userList = userService.showUserListbyId(searchKeyword);
//		} else if(keyword.equals("memberName")) {
//			userList = userService.showUserListbyName(searchKeyword);
//		} else if(keyword.equals("nickname")) {
//			userList = userService.showUserListbyNickname(searchKeyword);
//		}
//		System.out.println(userList);
		
		ModelAndView mav= new ModelAndView();
		mav.setViewName("admin/adminMember");
		mav.addObject("userList",userList);
		mav.addObject("count",count);
		mav.addObject("prdCount",prdCount);
		mav.addObject("currentCount", currentCount);
		return mav;
	}
	
}
