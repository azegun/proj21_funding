package proj21_funding.service.impl;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.Project;
import proj21_funding.dto.project.UpdateProject;
import proj21_funding.exception.DateTimeOverException;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	static final Log log = LogFactory.getLog(ProjectServiceImpl.class);
	
	//web.xml에 있는 multipart-config 주소랑 동일시하게 
	
	@Autowired
	private ProjectMapper mapper;
	

	@Override
	public List<Project> showProjectListAll() {
		List<Project> list = mapper.selectProjectListAll();
		return list;
	}

	@Override
	public Project showProjectByNo(int prjNo) {
		Project prj = mapper.selectProjectByNo(prjNo);
		return prj;
	}

	@Override
	public int insertProject(Project project) {
		System.out.println("ProjectImpl >> " +project);
		return mapper.insertProject(project);
	}

	@Override
	public int updateProject(Project project, MultipartFile uploadfile) {		
		return mapper.updateProject(project);
	}

	@Override
	public int joinUpdateProjectAndPrjoptionByNo(Map<String, Object> map) {
//		System.out.println("map >> " + map);
		/*
		 * System.out.println("eDate map>> " + map.get("eDate"));
		 * System.out.println("pDate map>>" + map.get("pDate") );
		 */
		
		LocalDate EndDate =  (LocalDate) map.get("eDate");
		LocalDate PayDate = (LocalDate) map.get("pDate");
		
		int compareEtoP = EndDate.compareTo(PayDate);
		
		if(compareEtoP <= 0) {
			return mapper.joinUpdateProjectAndPrjoptionByPrjNo(map);
		}else {
			throw new DateTimeOverException("결제일이 마감일보다 빠를 수 없습니다.");
		}
		
	
	}

	@Override
	public Project showJoinPrjAndCategory(int prjNo) {
		return mapper.showJoinPrjAndCategory(prjNo);
	}

}
