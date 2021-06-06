package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjOption;

@Component
public interface PrjOptionMapper {
	int insertPrjOption(PrjOption prjOption);
	
	List<PrjOption> selectPrjOptionByAll();
	List<PrjOption>	selectPrjOptionByPrjNo(int prjNo);
	
}
