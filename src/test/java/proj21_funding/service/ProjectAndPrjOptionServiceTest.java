package proj21_funding.service;

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
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.mapper.ProjectOptionMapper;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class ProjectAndPrjOptionServiceTest {
    protected static final Log log = LogFactory.getLog(ProjectAndPrjOptionServiceTest.class);
	
	@Autowired
	private ProjectMapper pMapper;
	
	@Autowired
	private ProjectOptionMapper prjOptMapper;
	
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	@Test
	public void testTrJoinPrjAndPrjOpt_Success() {
        log.debug(Thread.currentThread().getStackTrace()[1].getMethodName()+"()");
        
    	Project project = new Project(new UserInfo(2), "트렌젝션성공", "제발,,,,", 3000000);
    	int res = pMapper.insertProject(project);
    	System.out.println(" res" + res);
    	PrjOption prjoption = new PrjOption(new Project(4), "분식2", 4000000, "옵션d");
    	res += prjOptMapper.insertPrjOption(prjoption);
    	Assert.assertEquals(2, res);
    	System.out.println("final res" +res);
    	
        
        
	}

}
