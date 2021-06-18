package proj21_funding.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Board;
import proj21_funding.dto.paging.Criteria;
import proj21_funding.dto.paging.Pagination;
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
		return mapper.updateBoard(board);
	}

	@Override
	public int removeBoard(int boardNo) {
		return mapper.deleteBoard(boardNo);
	}
	
//	페이징
	@Override
	public List<Board> getBoardList(Criteria criteria) {
		List<Board> boardList = Collections.emptyList();

		int boardTotalCount = mapper.selectBoardTotalCount(criteria);

		if (boardTotalCount > 0) {
			boardList = mapper.selectBoardList(criteria);
		}

		return boardList;
	}
// 끝

	@Override
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception {
		return mapper.SelectAllList(pagination);
	}

	@Override
	public int BoardCount() throws Exception {
		return mapper.BoardCount();
	}
}
