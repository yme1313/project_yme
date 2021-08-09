package kr.green.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.pagination.PageMaker;
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
	public ModelAndView listGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(12);
		ArrayList <BoardVO> list = boardService.getBoardList(cri);
		int totalCount = boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 10, cri);;
		mv.addObject("title", "1:1문의");
		mv.addObject("pm", pm);
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
		board.setBd_type("ENQUIRY");
		boardService.insertBoardPw(board, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
	@GetMapping("/board/modify")
	public ModelAndView modifyGet(ModelAndView mv, Integer num, HttpServletRequest request) { 
		BoardVO board = boardService.getBoard(num);
		mv.addObject("board", board);
		mv.addObject("title", "게시글 수정");
		mv.setViewName("/template/board/modify");
		MemberVO user = memberService.getMemberByRequest(request);
		if(board == null || !board.getBd_me_id().equals(user.getMe_id())) {
			mv.setViewName("redirect:/board/list");
		}
		return mv;
	}
	@PostMapping("/board/modify")
	public ModelAndView modifyPost(ModelAndView mv, BoardVO board, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		if(!board.getBd_me_id().equals(user.getMe_id())){
			mv.setViewName("redirect:/board/list");
		} else {
			boardService.updateBoard(board, user);
			mv.setViewName("redirect:/board/detail");	
		}
		mv.addObject("num",board.getBd_num());	
		return mv;
	}
	@GetMapping("/board/delete")
	public ModelAndView deleteGet(ModelAndView mv, Integer num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		boardService.deleteBoard(num, user);
		mv.setViewName("redirect:/board/list");
		return mv;
	}
}
