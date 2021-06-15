package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.AddPrjOption;
import proj21_funding.dto.PrjOption;
@Service
public interface PrjOptionService {
	List<PrjOption> showPrjOptionListAll();
	
	List<PrjOption> showPrjOptionByPrjNo(int prjNo);
	
	PrjOption showPrjOptionByOptNo(int optNo);
	
	
	int insertPrjOption(PrjOption prjOption);
	int insertAddPrjOption(AddPrjOption addPrjOption);
}
