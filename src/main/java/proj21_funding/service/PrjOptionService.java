package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.project.AddPrjOption;
@Service
public interface PrjOptionService {
	List<PrjOption> showPrjOptionListAll();
	
	List<PrjOption> showPrjOptionByPrjNo(int prjNo);
	PrjOption showPrjOptionByOptNo(int optNo);
	
	//옵션추가 + 여러개추가
	int insertPrjOption(PrjOption prjOption);
	int insertAddPrjOption(AddPrjOption addPrjOption);
	
	//옵션만 리스트
	List<PrjOption> selectSimplePrjOptionByPrjNo(int prjNo);
		
	//옵션수정 
	int updatePrjOption(PrjOption prjoption);
	//프로젝트 추가옵션 수정
	int updateAddOption(AddPrjOption addprjoption);
}
