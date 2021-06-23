package proj21_funding.mapper;

import java.util.List;

import proj21_funding.dto.project.ProjectJoin;

public interface ProjectJoinMapper {
	List<ProjectJoin> selectProjectJoinAll();
	List<ProjectJoin> selectProjectSuccessImbak();
	List<ProjectJoin> selectProjectJoinByPrjName(String prjName);
	List<ProjectJoin> selectProjectJoinByPrjManager(String prjManager);
	
	ProjectJoin selectProjectJoinByPrjNo(int prjNo);
	
	List<ProjectJoin> selectSumCountGroupByUserNo();
	
	List<ProjectJoin> selectProjectGroupByUserNo();
	List<ProjectJoin> selectSuccessProjectGroupByUserNo();
}
