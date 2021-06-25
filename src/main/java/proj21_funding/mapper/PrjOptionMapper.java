package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.project.AddPrjOption;

@Component
public interface PrjOptionMapper {
	//프로젝트 옵션등록(프로젝트 등록+ 프로젝트 옵션 transaction)
	int insertPrjOption(PrjOption prjOption);
	//추가적인 아이템등록
	int insertAddPrjOption(AddPrjOption addPrjOption);
	//프로젝트옵션 수정
	int updatePrjOption(PrjOption prjoption);
	//프로젝트 삭제
	int removePrjOption(int prjNo);
	
	PrjOption selectPrjOptionByOptNo(int optNo);
	
	List<PrjOption> selectPrjOptionByAll();
	List<PrjOption>	selectPrjOptionByPrjNo(int prjNo);
	
	List<PrjOption>	selectSimpleOptionByPrjNo(int prjNo);
	
}
