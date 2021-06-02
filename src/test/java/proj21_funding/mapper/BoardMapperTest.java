package proj21_funding.mapper;

import static org.junit.Assert.fail;

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
import proj21_funding.dto.Board;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ContextRoot.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@WebAppConfiguration
public class BoardMapperTest {

	private static final Log log = LogFactory.getLog(BoardMapperTest.class);
	
	@Autowired
	private BoardMapper mapper;
	
	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test07SelectBoardAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");

		List<Board> list = mapper.selectBoardAll();
		Assert.assertNotNull(list);
		list.stream().forEach(s -> log.debug(s.toString()));
	}

	@Test
	public void test01SelectBoardByNo() {
		fail("Not yet implemented");
	}

	@Test
	public void test02SelectBoardByCNo() {
		fail("Not yet implemented");
	}

	@Test
	public void test05SelectBoardByTitle() {
		fail("Not yet implemented");
	}

	@Test
	public void test03InsertBoard() {
		fail("Not yet implemented");
	}

	@Test
	public void test04UpdateBoard() {
		fail("Not yet implemented");
	}

	@Test
	public void test06DeleteBoard() {
		fail("Not yet implemented");
	}

}
