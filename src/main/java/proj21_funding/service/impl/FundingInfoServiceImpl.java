package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.mapper.FundingInfoMapper;
import proj21_funding.service.FundingInfoService;

@Service
public class FundingInfoServiceImpl implements FundingInfoService {
	@Autowired
	FundingInfoMapper mapper;

	@Override
	public int showCountByPrjNo(int prjNo) {
		return mapper.selectCountByPrjNo(prjNo);
	}

	@Override
	public int showSumByPrjNo(int prjNo) {
		return mapper.selectSumByPrjNo(prjNo);
	}

}
