package proj21_funding.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import proj21_funding.dto.project.AddPrjOption;
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
	public void testInsertOptionByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 5);
		map.put("addOptName1", "test1");
		map.put("addOptPrice1", 10000);
		map.put("addOptContent1", "map1");
		int res = mapper.insertOptionByMap(map);
		Assert.assertEquals(1, res);		
	}
	
	@Test
	public void testInsertPrjOptionsByMap() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pNo", 5);
		map.put("addOptName1", "test1");
		map.put("addOptPrice1", 10000);
		map.put("addOptContent1", "map1");
		map.put("addOptName2", "test2");
		map.put("addOptPrice2", 20000);
		map.put("addOptContent2", "map2");
		int res = mapper.insertPrjOptionsByMap(map);
		Assert.assertEquals(2, res);		
	}

//	@Test
	public void testInsertPrjOption() {
	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
	PrjOption prjOption = new PrjOption(new Project(4), "프로젝트옵션", 4000000, "옵션d" );
				
		int res = mapper.insertPrjOption(prjOption);
	
		Assert.assertEquals(1, res);		
	}
	
////	@Test
//	public void testInsertAddPrjOption() {
//	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//		
//    	AddPrjOption prjOption = new AddPrjOption(new Project(4), "프로젝트옵션222", 22222, "옵션d222" );
//				
//		int res = mapper.insertAddPrjOption(prjOption);
//	
//		Assert.assertEquals(1, res);		
//	}
//	
////	@Test
//	public void testInsertAddSecPrjOption() {
//	log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
//		
//		AddPrjOption prjOption = new AddPrjOption(new Project(4), "프로젝트옵션3333", 3333, "옵션d222" );
//				
//		int res = mapper.insertAddSecPrjOption(prjOption);
//	
//		Assert.assertEquals(1, res);		
//	}
	
//	@Test
	public void testupdateProjectOption() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		PrjOption prjoption = new PrjOption(147, "문방구", 399999, "색종이");
		int res = mapper.updatePrjOption(prjoption);
		
		Assert.assertEquals(1, res);		
	}
	
//	@Test
	public void testupdateAddProjectOption() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		AddPrjOption addprjoption = new AddPrjOption(148, "양말셋트", 3004432, "두셋트");
		int res = mapper.updateAddOption(addprjoption);
		Assert.assertEquals(1, res);		
	}
	
	
	
	
//	@Test
	public void testremoveProjectOption() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		int res = mapper.removePrjOption(9);
		
		Assert.assertEquals(1, res);		
	}
//	@Test
	public void testselectPrjAndPrjOpt() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		
		List<PrjOption> list = mapper.selectSimplePrjOptionByPrjNo(14);
		Assert.assertNotNull(list);
		System.out.println("list >> " + list);
	}

}
