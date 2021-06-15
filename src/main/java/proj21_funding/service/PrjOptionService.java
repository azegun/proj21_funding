package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.AddPrjOption;
import proj21_funding.dto.PrjOption;
@Service
public interface PrjOptionService {
	List<PrjOption> showPrjOptionListAll();
	
	List<PrjOption> showPrjOptionByPrjNo(int prjNo);
	
	//옵션추가 + 여러개추가
	int insertPrjOption(PrjOption prjOption);
	int insertAddPrjOption(AddPrjOption addPrjOption);
	
	//옵션수정
	int updatePrjOption(PrjOption prjoption);
}
