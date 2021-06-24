package proj21_funding.service;

import java.util.List;

import proj21_funding.dto.project.ProjectJoin;

public interface ProjectJoinService {
	List<ProjectJoin> showProjectJoinAll();
	List<ProjectJoin> showProjectSuccessImbak();
	List<ProjectJoin> showProjectJoinByPrjName(String prjName);
	List<ProjectJoin> showProjectJoinByPrjManager(String prjManager);
	List<ProjectJoin> showProjectJoinByPcategoryno(int pcategoryno);
	
	ProjectJoin showProjectJoinByPrjNo(int prjNo);
	
	List<ProjectJoin> showSumCountGroupByUserNo();
	List<ProjectJoin> showProjectGroupByUserNo();
	List<ProjectJoin> showSucessProjectGroupByUserNo();
	List<ProjectJoin> showSponsorListByPrjNo(int prjNo);
	
}
