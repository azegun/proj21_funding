package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjOption;

@Component
public interface PrjOptionMapper {
	//프로젝트 옵션등록(프로젝트 등록+ 프로젝트 옵션 transaction)
	int insertPrjOption(PrjOption prjOption);
	
	List<PrjOption> selectPrjOptionByAll();
	List<PrjOption>	selectPrjOptionByPrjNo(int prjNo);
	
}
