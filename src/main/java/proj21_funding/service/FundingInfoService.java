package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.FundingInfo;

@Service
public interface FundingInfoService {
	int showCountByPrjNo(int prjNo);
	int showSumByPrjNo(int prjNo);
	int addFundingInfo(FundingInfo fundingInfo);
	List<FundingInfo> showFundingInfoByUserNo(int userNo);
}
