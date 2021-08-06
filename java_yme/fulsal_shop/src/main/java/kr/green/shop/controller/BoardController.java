package kr.green.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.service.BoardService;
import kr.green.shop.service.MemberService;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class BoardController {
	
	private MemberService memberService;
	private BoardService boardService;
	
	@GetMapping("/board/list")
	public ModelAndView listGet(ModelAndView mv) {
		ArrayList <BoardVO> list = boardService.getBoardList();
		mv.addObject("title", "고객센터");
		mv.addObject("list", list);
		mv.setViewName("/template/board/list");
		return mv;
	}
	@GetMapping("/board/detail")
	public ModelAndView detailGet(ModelAndView mv, Integer num) {
		BoardVO board = boardService.getBoard(num);
		mv.addObject("title", "게시글 상세");
		mv.addObject("board", board);
		mv.setViewName("/template/board/detail");
		return mv;
	}
	@GetMapping("/board/register")
	public ModelAndView regiterGet(ModelAndView mv) {
		mv.addObject("title", "게시글 등록");
		mv.setViewName("/template/board/register");
		return mv;
	}
	@PostMapping("/board/register")
	public ModelAndView regiterPost(ModelAndView mv, BoardVO board, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		boardService.insertBoard(board, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@GetMapping("/board/modify")
	public ModelAndView modifyGet(ModelAndView mv, Integer num, HttpServletRequest request) {
		BoardVO board = boardService.getBoard(num);
		mv.addObject("borad", board);
		mv.addObject("title", "게시글 수정");
		mv.setViewName("/template/board/modify");
		return mv;
	}
}
