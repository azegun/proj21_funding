package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.mapper.PrjOptionMapper;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.service.ProjectAndPrjOptionService;
@Service
public class ProjectAndPrjOptionServiceImpl implements ProjectAndPrjOptionService {

	@Autowired
	private ProjectMapper pMapper;
	
	@Autowired
	private PrjOptionMapper prjOptMapper;

	@Override
	public void trJoinPrjAndPrjOpt(Project project, PrjOption prjoption) {
		int res = pMapper.insertProject(project);
		prjoption.setPrjNo(project);
		res += prjOptMapper.insertPrjOption(prjoption);
		
		if(res != 2) throw new RuntimeException();		
		
	}
	


}
