package proj21_funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.Board;
import proj21_funding.dto.BoardCategory;
import proj21_funding.service.BoardService;
import proj21_funding.service.CategoryService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CategoryService bcService;

	@RequestMapping("/board/notice_all")
	public ModelAndView noticeAll() {
		List<Board> board = boardService.showBoardAll();
		List<BoardCategory> bc = bcService.showBCByClass("board");
		
		/*
		 * int listCnt = boardService.selectBoardListCnt(board);
		 * 
		 * Pagination pagination = new Pagination(listCnt, curPage);
		 * 
		 * board.setStartIndex(pagination.getStartIndex());
		 * board.setCntPerPage(pagination.getPageSize());
		 */
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice_all");
		mav.addObject("board", board);
		mav.addObject("bc", bc);
		return mav;
	}

	@RequestMapping("/board/notice_write")
	public ModelAndView WriteAll() {
		List<BoardCategory> bc = bcService.showBCByClass("board");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice_write");
		mav.addObject("bc", bc);
		return mav;
	}

	@PostMapping("/noticesuccess")
	public String registerSuccess(Board board, BoardCategory bc) {
		try {
			System.out.println(board);
			boardService.uploadBoard(board);
			return "board/notice_end";

		} catch (Exception e) {
			e.printStackTrace();

			return "board/notice_write";
		}
	}
	
	@RequestMapping("/board/notice_detail/{boardNo}")
	public ModelAndView detail(@PathVariable("boardNo") int boardNo) {
		System.out.println(boardNo);
		Board board = boardService.showBoardByNo(boardNo);
		List<BoardCategory> bc = bcService.showBCByClass("board");
		ModelAndView mav = new ModelAndView("board/notice_detail", "board", board);
		mav.addObject("bc", bc);
		return mav;
	}
}
