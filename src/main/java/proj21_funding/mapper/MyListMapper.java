package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Project;
@Component
public interface MyListMapper {
//	고객번호로 마이리스트 검색
	List<Project> showAllMyList(int userNo);
// 프로젝트 번호로 디테일하게 검색
	Project showDetailListByprjNo(int prjNo);	

}
