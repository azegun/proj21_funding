package proj21_funding.service;

import org.springframework.stereotype.Service;

@Service
public interface FundingInfoService {
	int showCountByPrjNo(int prjNo);
	int showSumByPrjNo(int prjNo);
}
