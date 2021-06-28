package proj21_funding.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.project.AddPrjOption;
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
	public PrjOption showPrjOptionByOptNo(int optNo) {
		return mapper.selectPrjOptionByOptNo(optNo);
	}
	
	@Override
	public int updatePrjOption(PrjOption prjoption) {
		return mapper.updatePrjOption(prjoption);
	}

	@Override
	public List<PrjOption> showSimpleOptionByPrjNo(int prjNo) {
		return mapper.selectSimpleOptionByPrjNo(prjNo);
	}
	
	public List<PrjOption> selectSimplePrjOptionByPrjNo(int prjNo) {
		return mapper.selectSimplePrjOptionByPrjNo(prjNo);
	}


	@Override
	public int insertPrjOptionsByMap(Map<String, Object> map) {
		return mapper.insertPrjOptionsByMap(map);
	}

	@Override
	public int insertOptionByMap(Map<String, Object> map) {
		return mapper.insertOptionByMap(map);
	}

	@Override
	public int updateOptionByMap(Map<String, Object> map) {
		return mapper.updateOptionByMap(map);
	}

	@Override
	public int updateAllAddOptionsByMap(Map<String, Object> map) {
		return mapper.updateAllAddOptionsByMap(map);
	}

	@Override
	public int updateAddOption(AddPrjOption addprjoption) {
		// TODO Auto-generated method stub
		return 0;
	}

}
