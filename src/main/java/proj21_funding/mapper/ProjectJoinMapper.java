package proj21_funding.mapper;

import java.util.List;

import proj21_funding.dto.project.ProjectJoin;

public interface ProjectJoinMapper {
	List<ProjectJoin> selectProjectJoinAll();
	List<ProjectJoin> selectProjectSuccessImbak();
	List<ProjectJoin> selectProjectJoinByPrjName(String prjName);
	List<ProjectJoin> selectProjectJoinByPrjManager(String prjManager);
	List<ProjectJoin> selectProjectJoinByPcategoryno(int pcategoryno);
	
	ProjectJoin selectProjectJoinByPrjNo(int prjNo);
	
	List<ProjectJoin> selectSumCountGroupByUserNo();
	
	List<ProjectJoin> selectProjectGroupByUserNo();
	//제작자별 성공프로젝트리스트
	List<ProjectJoin> selectSuccessProjectGroupByUserNo();
	//프로젝트별 후원자 리스트
	List<ProjectJoin> selectSponsorListByPrjNo(int prjNo);
}
