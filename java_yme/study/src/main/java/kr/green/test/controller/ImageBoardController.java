package kr.green.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.test.pagination.Criteria;
import kr.green.test.pagination.PageMaker;
import kr.green.test.service.BoardService;
import kr.green.test.service.MemberService;
import kr.green.test.vo.BoardVO;
import kr.green.test.vo.FileVO;
import kr.green.test.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/board/image")
public class ImageBoardController {
	private BoardService boardService;
	private MemberService memberService;
	
	@GetMapping("/list")
		public ModelAndView listGet(ModelAndView mv, Criteria cri) {
			cri.setType("IMAGE");
			ArrayList <BoardVO> list = boardService.getBoardList(cri);
			int totalCount = boardService.getTotalCount(cri);
			PageMaker pm = new PageMaker(totalCount,10,cri);
			boardService.getThumbnail(list);
			mv.addObject("pm", pm);
			mv.addObject("title", "이미지게시판");
			mv.addObject("list", list);
			mv.addObject("type","/image");
			mv.setViewName("/template/board/image/list");
			return mv;
	}
	@GetMapping("/detail")
	public ModelAndView detailPost(ModelAndView mv, Integer num) {
		mv.setViewName("redirect:/board/image/list");
		return mv;
	}
	@PostMapping("/detail")
	public ModelAndView detailGet(ModelAndView mv, BoardVO tmpBoard) {
		if(boardService.checkBoardPw(tmpBoard)) {
			boardService.updateViews(tmpBoard.getNum());
			BoardVO board = boardService.getBoard(tmpBoard.getNum());
			ArrayList <FileVO> fList = boardService.getFileList(tmpBoard.getNum());
			mv.addObject("fList", fList);
			mv.addObject("title", "이미지 상세");
			mv.addObject("board",board);
			mv.addObject("type","/image");
			mv.setViewName("/template/board/image/detail");
		} else {
			mv.setViewName("redirect:/board/image/list");
		}
		return mv;
	}
	@GetMapping("/register")
	public ModelAndView registerGet(ModelAndView mv) {
		mv.addObject("title", "이미지 등록");
		mv.setViewName("/template/board/image/register");
		return mv;
	}
	@PostMapping("/register")
	public ModelAndView registerPost(ModelAndView mv, BoardVO board, MultipartFile[] fileList, 
			HttpServletRequest request, MultipartFile mainImage) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		board.setType("IMAGE");
		boardService.insertBoard(board, fileList, user, mainImage);
		mv.setViewName("redirect:/board/image/list");
		return mv;
	}
	//게시글에 대한 답글
	@GetMapping("/reply/register")
	public ModelAndView replyRegisterGet(ModelAndView mv,Integer oriNo) {
		mv.addObject("oriNo",oriNo);
		mv.addObject("title","답변 등록");
		mv.setViewName("/template/board/image/replyregister");
		return mv;
	}
	@PostMapping("/reply/register")
	public ModelAndView replyRegisterPost(ModelAndView mv,BoardVO board, HttpServletRequest request ) {
		MemberVO user = memberService.getMemberByRequest(request);
		board.setType("IMAGE");
		boardService.insertReplyBoard(board, user);
		mv.setViewName("redirect:/board/image/list");
		return mv;
	}
	@GetMapping("/modify")
	public ModelAndView boardModifyGet(ModelAndView mv,Integer num) {
		BoardVO board = boardService.getBoard(num);
		ArrayList <FileVO> fList = boardService.getFileList(num);
		mv.addObject("fList", fList);
		mv.addObject("board", board);
		mv.addObject("title","게시판 수정");
		mv.addObject("type","/image");
		mv.setViewName("/template/board/image/modify");
		return mv;
	}
	@PostMapping("/modify")
	public ModelAndView boardModifyPost(ModelAndView mv,BoardVO board,
			HttpServletRequest request, MultipartFile[] fileList, Integer[] fileNumList,
			MultipartFile mainImage, Integer thumbnailNum) throws Exception {
		MemberVO user = memberService.getMemberByRequest(request);
		boardService.updateBoard(board,user,fileList, fileNumList, mainImage,thumbnailNum);
		mv.addObject("num", board.getNum());
		mv.setViewName("redirect:/board/image/detail");
		return mv;
	}
	@GetMapping("/delete")
	public ModelAndView boardDeleteGet(ModelAndView mv,Integer num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		boardService.deleteBoard(num,user);
		mv.setViewName("redirect:/board/image/list");
		return mv;
	}
	@ResponseBody
	@PostMapping("/check")
	public String checkPost(@RequestBody BoardVO board) {
		return "" + boardService.checkBoardPw(board);

	}
}
