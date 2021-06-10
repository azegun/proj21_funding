package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Board;
import proj21_funding.mapper.BoardMapper;
import proj21_funding.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<Board> showBoardAll() {
		List<Board> list = mapper.selectBoardAll();
		return list;
	}

	@Override
	public Board showBoardByNo(int boardNo) {
		return mapper.selectBoardByNo(boardNo);
	}

	@Override
	public Board showBoardByCNo(int CategoryNo) {
		return mapper.selectBoardByCNo(CategoryNo);
	}

	@Override
	public Board showBoardByTitle(String title) {
		return mapper.selectBoardByTitle(title);
	}

	@Override
	public int uploadBoard(Board board) {
		Board newboard = new Board(board.getCategoryNo(), board.getBoardTitle(), board.getBoardContent());
		return mapper.insertBoard(newboard);
	}

	@Override
	public int modifyBoard(Board board) {
		return 0;
	}

	@Override
	public int removeBoard(int boardNo) {
		return mapper.deleteBoard(boardNo);
	}

}
