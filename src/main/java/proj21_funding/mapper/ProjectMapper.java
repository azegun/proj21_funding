package proj21_funding.mapper;

import java.util.List;

import proj21_funding.dto.Project;

public interface ProjectMapper {
	List<Project> selectProjectListAll();
	
		
	
	
//	프로젝트 등록
	int insertProject(Project project);
}
