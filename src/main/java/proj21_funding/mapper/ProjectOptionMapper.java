package proj21_funding.mapper;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjOption;
@Component
public interface ProjectOptionMapper {
	
		//프로젝트 옵션등록(프로젝트 등록+ 프로젝트 옵션 transaction)
		int insertPrjOption(PrjOption prjOption);
}
