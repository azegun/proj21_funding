package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Board;
import proj21_funding.dto.paging.Criteria;
import proj21_funding.dto.paging.Pagination;
@Component
public interface BoardMapper {
	
	List<Board> selectBoardAll();
	
//	페이징 시도중
	
	List<Board> selectBoardList(Criteria criteria);
	
	int selectBoardTotalCount(Criteria criteria);
	
	List<Map<String, Object>> SelectAllList (Pagination pagination);
	
	int BoardCount();
	
//	여기까지
	
	Board selectBoardByNo(int boardNo);
	
	Board selectBoardByCNo(int CategoryNo);
	
	Board selectBoardByTitle(String title);
	
	int insertBoard (Board board);
	
	int updateBoard (Board board);
	
	int deleteBoard (int boardNo);
}
