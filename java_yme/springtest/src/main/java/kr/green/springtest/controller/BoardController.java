package kr.green.springtest.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.pagination.PageMaker;
import kr.green.springtest.service.BoardService;
import kr.green.springtest.vo.BoardVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/board/*")
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(ModelAndView mv, Criteria cri) {
		PageMaker pm = new PageMaker();
		cri.setPerPageNum(2);
		pm.setCriteria(cri);
		pm.setDisplayPageNum(2);
		int totalCount = boardService.getTotalCount(cri);
		pm.setTotalCount(totalCount);
		pm.calcData();
		ArrayList<BoardVO> list = boardService.getBoardList(cri);
		mv.addObject("list", list);
		mv.setViewName("board/list");
		return mv;
	}
	@RequestMapping(value="/detail")
	public ModelAndView detail(ModelAndView mv, Integer num, String msg) {
		boardService.updateViews(num);
		BoardVO board = boardService.getBoard(num);
		mv.addObject("msg",msg);
		mv.addObject("board",board);
		mv.setViewName("board/detail");
		return mv;
	}
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv) {
		mv.setViewName("board/register");
		return mv;
	}
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView registerPost(ModelAndView mv, BoardVO board) {
		boardService.insertBoard(board);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView modifyGet(ModelAndView mv, Integer num ) {
		BoardVO board = boardService.getBoard(num);
		mv.addObject("board",board);
		mv.setViewName("board/modify");
		return mv;
	}
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView modifyPost(ModelAndView mv, BoardVO board) {
		int res = boardService.updateBoard(board);
		String msg = res != 0 ? board.getNum() + "번 게시글이 수정되었습니다." : "없는게시글입니다.";
		mv.addObject("msg", msg);
		mv.addObject("num",board.getNum());
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView deletePost(ModelAndView mv, Integer num) {
		int res = boardService.deleteBoard(num);
		if(res != 0) {
			mv.addObject("msg",num+"번 게시글을 삭제 했습니다.");
		} else {
			mv.addObject("msg", "게시글이 없거나 이미 삭제 되었습니다.");
		}
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	
}