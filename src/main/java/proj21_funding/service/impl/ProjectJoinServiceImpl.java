package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.project.ProjectJoin;
import proj21_funding.mapper.ProjectJoinMapper;
import proj21_funding.service.ProjectJoinService;

@Service
public class ProjectJoinServiceImpl implements ProjectJoinService {

	@Autowired
	private ProjectJoinMapper mapper;
	
	@Override
	public List<ProjectJoin> showProjectJoinAll() {
		return mapper.selectProjectJoinAll();
	}

	@Override
	public List<ProjectJoin> showProjectSuccessImbak() {
		return mapper.selectProjectSuccessImbak();
	}

	@Override
	public List<ProjectJoin> showProjectJoinByPrjName(String prjName) {
		return mapper.selectProjectJoinByPrjName(prjName);
	}

	@Override
	public List<ProjectJoin> showProjectJoinByPrjManager(String prjManager) {
		return mapper.selectProjectJoinByPrjManager(prjManager);
	}

	@Override
	public ProjectJoin showProjectJoinByPrjNo(int prjNo) {
		return mapper.selectProjectJoinByPrjNo(prjNo);
	}


	@Override
	public List<ProjectJoin> showSumCountGroupByUserNo() {
		return mapper.selectSumCountGroupByUserNo();
	}

	@Override
	public List<ProjectJoin> showProjectGroupByUserNo() {
		return mapper.selectProjectGroupByUserNo();
	}

	@Override
	public List<ProjectJoin> showSucessProjectGroupByUserNo() {
		return mapper.selectSuccessProjectGroupByUserNo();
	}

}
