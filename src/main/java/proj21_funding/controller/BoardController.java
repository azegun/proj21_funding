package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj21_funding.dto.Board;
import proj21_funding.dto.BoardCategory;
import proj21_funding.dto.paging.Pagination;
import proj21_funding.service.BoardService;
import proj21_funding.service.CategoryService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CategoryService bcService;

	@RequestMapping("/board/notice_write")
	public ModelAndView WriteAll() {
		List<BoardCategory> bc = bcService.showBCByClass("board");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice_write");
		mav.addObject("bc", bc);
		return mav;
	}
	
	@PostMapping("/noticesuccess")
	public ModelAndView registerSuccess(Board board, BoardCategory bc, HttpSession session) {
		try {
			System.out.println(board);
			boardService.uploadBoard(board);
			Pagination pagination = new Pagination();
			pagination.setCurrentPage(1);
			pagination.setCntPerPage(10);
			pagination.setPageSize(10);
			return noticeAll(pagination.getCurrentPage(), pagination.getCntPerPage(), pagination.getPageSize(), session);

		} catch (Exception e) {
			e.printStackTrace();

			return WriteAll();
		}
	}
	
	@RequestMapping("/board/notice_detail/{boardNo}&{categoryNo}")
	public ModelAndView detail(@PathVariable("boardNo") int boardNo, @PathVariable("categoryNo") int categoryNo, HttpSession session) {
		session.getAttribute("pagination");
		List<BoardCategory> bc = bcService.showBCByClass("board");
		Board board = boardService.showBoardByNo(boardNo);
		board.setCategoryNo(new BoardCategory(categoryNo));
		ModelAndView mav = new ModelAndView("board/notice_detail", "board", board);
		mav.addObject("bc", bc);
		mav.addObject("pagination", session.getAttribute("pagination"));
		return mav;
	}

	@RequestMapping("/noticeupdate/{boardNo}&{categoryNo}")
	public ModelAndView UpdateAll(@PathVariable("boardNo") int boardNo, @PathVariable("categoryNo") int categoryNo) {
		Board board = boardService.showBoardByNo(boardNo);
		List<BoardCategory> bc = bcService.showBCByClass("board");
		board.setCategoryNo(new BoardCategory(categoryNo));
		System.out.println(board);
		ModelAndView mav = new ModelAndView("board/notice_update", "board", board);
		mav.addObject("bc", bc);
		return mav;
	}
	
	@PostMapping("/noticeupsuccess")
	public ModelAndView updateSuccess(Board board, BoardCategory bc, HttpSession session) {
		Pagination pagination = new Pagination();
		pagination.setCurrentPage(1);
		pagination.setCntPerPage(10);
		pagination.setPageSize(10);
		try {
			System.out.println(board);
			boardService.modifyBoard(board);
			return detail(board.getBoardNo(), board.getCategoryNo().getCategoryNo(), session);

		} catch (Exception e) {
			e.printStackTrace();

			return UpdateAll(board.getBoardNo(), board.getCategoryNo().getCategoryNo());
		}
	}
	
	@GetMapping("/noticedelete/{boardNo}&{categoryNo}")
	public ModelAndView deleteSuccess(@PathVariable("boardNo") int boardNo, @PathVariable("categoryNo") int categoryNo, HttpSession session) {
		Pagination pagination = new Pagination();
		pagination = (Pagination) session.getAttribute("pagination");
		
		try {
			System.out.println(boardNo);
			boardService.removeBoard(boardNo);
			return noticeAll(pagination.getCurrentPage(), pagination.getCntPerPage(), pagination.getPageSize(), session);

		} catch (Exception e) {
			e.printStackTrace();

			return detail(boardNo, categoryNo, session);
		}
	}

    @RequestMapping(value = "/board/list")
    public ModelAndView noticeAll(
            @RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
            @RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage,
            @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize,
            HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        
        int listCnt = boardService.BoardCount();
        Pagination pagination = new Pagination(currentPage, cntPerPage, pageSize);
        pagination.setTotalRecordCount(listCnt);
		List<BoardCategory> bc = bcService.showBCByClass("board");
        session.setAttribute("pagination", pagination);
 
        mav.addObject("pagination",pagination);
        mav.addObject("board",boardService.SelectAllList(pagination));
		mav.addObject("bc", bc);
        mav.setViewName("/board/list");
        return mav;
    }
}
