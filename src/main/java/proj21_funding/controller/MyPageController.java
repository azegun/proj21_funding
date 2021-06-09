package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.FundingInfo;
import proj21_funding.service.FundingInfoService;

@Controller
public class MyPageController {

	@Autowired
	private  FundingInfoService fundingService;
	
	@RequestMapping("/user/funding_status/{authInfo.userNo}")
	public ModelAndView showFundingStatus(@PathVariable("authInfo.userNo") int userNo) {
		List<FundingInfo> fundingList = fundingService.showFundingInfoByUserNo(userNo);
		ModelAndView mav = new ModelAndView("/user/funding_status");
		mav.addObject("fundingList",fundingList);
		return mav;
	}
}
