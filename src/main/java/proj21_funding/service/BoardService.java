package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.Board;

@Service
public interface BoardService {
	
	List<Board> showBoardAll();

	Board showBoardByNo(int boardNo);
	
	Board showBoardByCNo(int CategoryNo);
	
	Board showBoardByTitle(String title);
	
	int uploadBoard (Board board);
	
	int modifyBoard (Board board);
	
	int removeBoard (int boardNo);
	
}
