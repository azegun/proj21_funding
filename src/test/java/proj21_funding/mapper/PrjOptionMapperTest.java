package proj21_funding.mapper;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import proj21_funding.config.ContextRoot;
import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {ContextRoot.class})
@WebAppConfiguration
public class PrjOptionMapperTest {
	
	private static final Log log = LogFactory.getLog(PrjOptionMapperTest.class);
	
	@Autowired
	private PrjOptionMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void testInsertPrjOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
	PrjOption prjOption = new PrjOption(new Project(4), "프로젝트옵션", 4000000, "옵션d" );
				
		int res = mapper.insertPrjOption(prjOption);
	
		Assert.assertEquals(1, res);		
	}

}
