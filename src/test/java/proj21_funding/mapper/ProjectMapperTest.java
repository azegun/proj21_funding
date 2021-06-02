package proj21_funding.mapper;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_funding.config.ContextRoot;
import proj21_funding.dto.Project;
import proj21_funding.dto.UserInfo;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class ProjectMapperTest {
	protected static final Log log = LogFactory.getLog(ProjectMapperTest.class);
	
	@Autowired
	private ProjectMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testSelectProjectListAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.selectProjectListAll();
		Assert.assertNotNull(list);
	}
	
	@Test
	public void testinsertProject() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Project project = new Project(new UserInfo(2), "인서트성공", "제발,,,,", 3000000);
		int res = mapper.insertProject(project);
		
		Assert.assertEquals(1, res);
	}
		
	public void testSelectProjjectListByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Project list = mapper.selectProjectByNo(3);
		Assert.assertNotNull(list);
	}

}
