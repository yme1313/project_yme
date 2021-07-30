package kr.green.test.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.test.service.BoardService;
import kr.green.test.vo.BoardVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/board")
public class BoardController {
	private BoardService boardService;
	
	@GetMapping("/list")
		public ModelAndView listGet(ModelAndView mv) {
			ArrayList <BoardVO> list = boardService.getBoardList();
			mv.addObject("title", "일반게시판");
			mv.addObject("list", list);
			mv.setViewName("/template/board/list");
			return mv;
	}
	@GetMapping("/detail")
	public ModelAndView detailGet(ModelAndView mv, Integer num) {
		BoardVO board = boardService.getBoard(num);
		mv.addObject("title", "상세내용");
		mv.addObject("board",board);
		mv.setViewName("/template/board/detail");
		return mv;
}
}
