package proj21_funding.service;

import java.util.List;

import proj21_funding.dto.PrjOption;

public interface PrjOptionService {
	List<PrjOption> showPrjOptionListAll();
	
	List<PrjOption> showPrjOptionByPrjNo(int prjNo);
}
