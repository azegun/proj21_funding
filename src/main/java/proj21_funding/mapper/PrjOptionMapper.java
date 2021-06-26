package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.project.AddPrjOption;

@Component
public interface PrjOptionMapper {
	//프로젝트 옵션등록(프로젝트 등록+ 프로젝트 옵션 transaction)
	int insertPrjOption(PrjOption prjOption);
	//프로젝트 옵션들 추가1
	int insertOptionByMap(Map<String, Object> map);
	//프로젝트 옵션들 추가2
	int insertPrjOptionsByMap(Map<String, Object> map);
	
	
	//추가적인 아이템등록
//	int insertAddPrjOption(AddPrjOption addPrjOption);
	//2번쨰 추가 아이템등록
//	int insertAddSecPrjOption(AddPrjOption addPrjOption);
	
	
	//프로젝트옵션 수정
	int updatePrjOption(PrjOption prjoption);
	//프로젝트 추가옵션 수정
	int updateAddOption(AddPrjOption addprjoption);
	//프로젝트 삭제
	int removePrjOption(int prjNo);
	
	PrjOption selectPrjOptionByOptNo(int optNo);
	
	List<PrjOption> selectPrjOptionByAll();
	List<PrjOption> selectPrjOptionByPrjNo(int prjNo);
	//옵션만 리스트
	List<PrjOption> selectSimplePrjOptionByPrjNo(int prjNo);
	
}
