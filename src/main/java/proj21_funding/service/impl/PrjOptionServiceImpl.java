package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.AddPrjOption;
import proj21_funding.dto.PrjOption;
import proj21_funding.mapper.PrjOptionMapper;
import proj21_funding.service.PrjOptionService;

@Service
public class PrjOptionServiceImpl implements PrjOptionService {
	
	@Autowired
	private PrjOptionMapper mapper;
	

	@Override
	public List<PrjOption> showPrjOptionListAll() {
		return mapper.selectPrjOptionByAll();
	}

	@Override
	public List<PrjOption> showPrjOptionByPrjNo(int prjNo) {
		return mapper.selectPrjOptionByPrjNo(prjNo);
	}

	@Override
	public int insertPrjOption(PrjOption prjOption) {
		System.out.println("ProjectoptionService1 Impl >>  "+prjOption );
		return mapper.insertPrjOption(prjOption);
	}

	@Override
	public int insertAddPrjOption(AddPrjOption addPrjOption) {
		//사용해야됨 옵션 추가할때, 잠시 주석
		/* addPrjOption.setPrjNo(); */
		System.out.println("ProjectoptionService2 Impl >>  "+ addPrjOption );
		return mapper.insertAddPrjOption(addPrjOption);
	}



}
