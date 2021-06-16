package proj21_funding.mapper;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import proj21_funding.dto.account.UserInfo;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@WebAppConfiguration
public class ProjectMapperTest {
	
	protected static final Log log = LogFactory.getLog(ProjectMapperTest.class);
	
//	LocalDate값은 픽스값으로 하는게 좋음
	private LocalDate date =LocalDate.of(2021, 06, 14);
	
	@Autowired
	private ProjectMapper mapper;	
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

//	@Test
	public void testSelectProjectListAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.selectProjectListAll();
		Assert.assertNotNull(list);
	}
	
//	@Test
	public void testSelectProjjectListByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Project list = mapper.selectProjectByNo(3);
		Assert.assertNotNull(list);
	}
	
//	@Test
	public void testselectProjectSuccessImbak() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Project> list = mapper.selectProjectSuccessImbak();
		System.out.println(list);
		
	}
	
	@Test
	public void testinsertProject() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Project project = new Project(new UserInfo(3), 3, "인서트성공", "제발,,,,", 3000000);
		int res = mapper.insertProject(project);
		
		Assert.assertEquals(1, res);		
	}
	
@Test
	public void testupdateProject() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Project project = new Project(3, 2, "업데이트테스트", "제발성공,,,,", 2000000, date,  date);
		int res = mapper.updateProject(project);
		
		Assert.assertEquals(1, res);		
	}

@Test
public void testjoinUpdateProjectAndPrjOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	Map<String, Object> map = new HashMap<String, Object>();
	map.put("pNo",2);
	map.put("pCategoryNo", 2);
	map.put("pName", "맵테스트");
	map.put("pContent", "조인업데이트업데이트");
	map.put("pGoal", 2000000);
	map.put("eDate", date);
	map.put("pDate", date);
	map.put("oName", "제발");
	map.put("oPrice", 30000000);
	map.put("oContent", "진짜");
	System.out.println("map >> "+ map );
	int res = mapper.joinUpdateProjectAndPrjoptionByPrjNo(map);
	Assert.assertEquals(2, res);		
}

@Test
public void testremoveProjectOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
	
	int res = mapper.removeProject(9);
	
	Assert.assertEquals(1, res);		
}
	


}
