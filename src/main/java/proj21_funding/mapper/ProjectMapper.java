package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Project;

@Component
public interface ProjectMapper {
//	프로젝트 전체검색
	List<Project> selectProjectListAll();
//	프로젝트 번호로 검색
	Project selectProjectByNo(int prjNo);
}
