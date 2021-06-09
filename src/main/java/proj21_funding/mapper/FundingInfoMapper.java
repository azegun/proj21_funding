package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.FundingInfo;

@Component
public interface FundingInfoMapper {
	int selectCountByPrjNo(int PrjNo);
	int selectSumByPrjNo(int PrjNo);
	List<FundingInfo> selectFundingInfoByUserNo(int userNo);

}
