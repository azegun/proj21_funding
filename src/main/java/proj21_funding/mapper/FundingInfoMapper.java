package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.FundingInfo;

@Component
public interface FundingInfoMapper {
	int selectCountByPrjNo(int PrjNo);
	int selectSumByPrjNo(int PrjNo);
	
	int insertFundingInfo(FundingInfo fundingInfo);
	
	List<FundingInfo> selectFundingInfoByUserNo(int userNo);
	// 프로젝트 번호로 펀딩정보 검색
	List<FundingInfo> selectFundingInfoByPrjNo(int prjNo);
	

}
