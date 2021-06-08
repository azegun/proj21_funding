package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
@Service
public interface ProjectAndPrjOptionService {	
	void trJoinPrjAndPrjOpt(Project project, PrjOption prjoption);	
	
}
