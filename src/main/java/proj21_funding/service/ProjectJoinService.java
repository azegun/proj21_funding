package proj21_funding.service;

import java.util.List;
import java.util.Map;

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
	
	List<ProjectJoin> showProjectJoinByMap(Map<String,Object> listMap);
	ProjectJoin showProjectSumCountAll();
	int showProjectJoinByMapCount(Map<String,Object> listMap);
	
//	프로젝트리스트화면 쓰이는 메소드 검색조건 추가
	List<ProjectJoin> showProjectListByMap(Map<String,Object> listMap);
	int showProjectListByMapCount(Map<String,Object> listMap);

	
}
