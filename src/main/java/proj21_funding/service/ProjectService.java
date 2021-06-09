package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.Project;
@Service
public interface ProjectService {
//	프로젝트 전체검색
	List<Project> showProjectListAll();
//	프로젝트 번호로 검색
	Project showProjectByNo(int prjNo);
//	프로젝트 등록
	int insertProject(Project project);
}
