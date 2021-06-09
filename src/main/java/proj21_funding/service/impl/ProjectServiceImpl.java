package proj21_funding.service.impl;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Project;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	static final Log log = LogFactory.getLog(ProjectServiceImpl.class);
	
	@Autowired
	private ProjectMapper mapper;

	@Override
	public List<Project> showProjectListAll() {
		List<Project> list = mapper.selectProjectListAll();
		log.debug("service - showProjectListAll() > " +list.size());
		return list;
	}

	@Override
	public Project showProjectByNo(int prjNo) {
		Project prj = mapper.selectProjectByNo(prjNo);
		return prj;
	}

	@Override
	public int insertProject(Project project) {
		return mapper.insertProject(project);
	}

}
