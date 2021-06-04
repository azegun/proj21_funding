package proj21_funding.mapper;

import java.util.List;

import proj21_funding.dto.Board;

public interface BoardMapper {
	
	List<Board> selectBoardAll();
	
	Board selectBoardByNo(int boardNo);
	
	Board selectBoardByCNo(int CategoryNo);
	
	Board selectBoardByTitle(String title);
	
	int insertBoard (Board board);
	
	int updateBoard (Board board);
	
	int deleteBoard (int boardNo);
}
