package proj21_funding.mapper;

import org.springframework.stereotype.Component;

@Component
public interface FundingInfoMapper {
	int selectCountByPrjNo(int PrjNo);
	int selectSumByPrjNo(int PrjNo);
}
