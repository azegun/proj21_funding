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
	
	//프로젝트옵션 수정
	int updatePrjOption(PrjOption prjoption);
	//프로젝트 추가옵션1 수정
	int updateOptionByMap(Map<String, Object> map);
	//프로젝트 추가옵션1,2  수정
	int updateAllAddOptionsByMap(Map<String, Object> map);
	
	//프로젝트 삭제
	int removePrjOption(int prjNo);
	
	PrjOption selectPrjOptionByOptNo(int optNo);
	
	List<PrjOption> selectPrjOptionByAll();
	List<PrjOption> selectPrjOptionByPrjNo(int prjNo);
	//옵션만 리스트
	List<PrjOption> selectSimplePrjOptionByPrjNo(int prjNo);
	
	List<PrjOption>	selectSimpleOptionByPrjNo(int prjNo);
	
}
