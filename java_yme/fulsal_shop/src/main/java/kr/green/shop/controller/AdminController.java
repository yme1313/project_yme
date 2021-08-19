package kr.green.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.pagination.PageMaker;
import kr.green.shop.service.BoardService;
import kr.green.shop.service.FutsalService;
import kr.green.shop.service.MemberService;
import kr.green.shop.service.OptionService;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OptionVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	
	private MemberService memberService;
	private BoardService boardService;
	private FutsalService futsalService;
	private OptionService optionService;
	
	@GetMapping("/user/list")
	public ModelAndView userListGet(ModelAndView mv, HttpServletRequest request, Criteria cri) {
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList<MemberVO> list = memberService.getMemberList(cri);
		int totalCount = memberService.getTotalCount(user , cri);
		PageMaker pm = new PageMaker(totalCount , 5, cri);
		mv.addObject("title","회원관리");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.setViewName("/template4/admin/user/list");
		return mv;
	}
	@GetMapping("/user/detail")
	public ModelAndView userDetailGet(ModelAndView mv) {
		mv.addObject("title", "회원 정보 수정");
		mv.setViewName("/template4/admin/user/detail");
		return mv;
	}
	@GetMapping("/board/list")
	public ModelAndView boardListGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(8);
		ArrayList <BoardVO> list = boardService.getBoardList(cri);
		int totalCount = boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);;
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("title", "1:1문의 관리");
		mv.setViewName("/template4/admin/board/list");
		return mv;
	}
	@PostMapping("/user/modify")
	public ModelAndView userModifyPost(ModelAndView mv, MemberVO user, HttpServletRequest request) {
		MemberVO nowUser = memberService.getMemberByRequest(request);
		MemberVO updateUser = memberService.updateMemberAdmin(user, nowUser);
		if(updateUser != null)
			request.getSession().setAttribute("user", updateUser);
		mv.setViewName("redirect:/admin/user/list");
		return mv;
	}
	@GetMapping("/goods/list")
	public ModelAndView goodsListGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(8);
		ArrayList <FutsalVO> list = futsalService.getFutsalList(cri);
		int totalCount = futsalService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);;
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("title", "상품관리");
		mv.setViewName("/template4/admin/goods/list");
		return mv;
	}
	@GetMapping("/goods/register")
	public ModelAndView goodsRegisterGet(ModelAndView mv, Criteria cri) {
		mv.addObject("title", "상품등록");
		mv.setViewName("/template4/admin/goods/register");
		return mv;
	}
	@PostMapping("/goods/register")
	public ModelAndView goodsRegisterPost(ModelAndView mv, HttpServletRequest request, FutsalVO futsal) {
		MemberVO user = memberService.getMemberByRequest(request);
		futsalService.insertGoods(user, futsal);
		mv.setViewName("redirect:/admin/goods/list");
		return mv;
	}
	@GetMapping("/goods/detail")
	public ModelAndView goodsDetailGet(ModelAndView mv, Integer num) {
		FutsalVO futsal = futsalService.getFutsal(num);
		mv.addObject("title", "상품상세");
		mv.addObject("futsal", futsal);
		mv.setViewName("/template4/admin/goods/detail");
		return mv;		
	}
	@GetMapping("/goods/count")
	public ModelAndView goodsCountGet(ModelAndView mv, Integer num) {
		FutsalVO futsal = futsalService.getFutsal(num);
		ArrayList <OptionVO> list = optionService.getOptionList(num);
		mv.addObject("title", "수량확인");
		mv.addObject("list", list);
		mv.addObject("futsal", futsal);
		mv.setViewName("/template4/admin/goods/count");
		return mv;		
	}	
	
	@GetMapping("/goods/optionadd")
	public ModelAndView goodsOptionaddGet(ModelAndView mv, Integer num) {
		FutsalVO futsal = futsalService.getFutsal(num);
		mv.addObject("title", "수량추가");
		mv.addObject("futsal", futsal);
		mv.setViewName("/template4/admin/goods/optionadd");
		return mv;		
	}
	@PostMapping("/goods/optionadd")
	public ModelAndView goodsOptionAddPost(ModelAndView mv, FutsalVO futsal, OptionVO option) {
		optionService.addOption(futsal, option);
		mv.setViewName("redirect:/admin/goods/list");
		return mv;
	}
	@GetMapping("/goods/modify")
	public ModelAndView goodsModifyGet(ModelAndView mv, Integer num, HttpServletRequest request) { 
		FutsalVO futsal = futsalService.getFutsal(num);
		mv.addObject("futsal", futsal);
		mv.addObject("title", "게시글 수정");
		mv.setViewName("/template4/admin/goods/modify");
		MemberVO user = memberService.getMemberByRequest(request);
		if(futsal == null || user == null) {
			mv.setViewName("redirect:/admin/goods/list");
		}
		return mv;
	}
	@PostMapping("/goods/modify")
	public ModelAndView goodsModufyPost(ModelAndView mv, HttpServletRequest request, FutsalVO futsal) {
		MemberVO user = memberService.getMemberByRequest(request);
		if(user == null || futsal == null) {
			mv.setViewName("redirect:/admin/goods/register");
		} else {
			futsalService.updateGoods(futsal);
			mv.setViewName("redirect:/admin/goods/detail");
		}	
		mv.addObject("num",futsal.getFu_num());	
		return mv;
	}	
	@GetMapping("/goods/delete")
	public ModelAndView boardDeleteGet(ModelAndView mv, HttpServletRequest request, Integer num) {
		MemberVO user = memberService.getMemberByRequest(request);
		futsalService.deleteGoods(num,user);
		mv.setViewName("redirect:/admin/goods/list");
		return mv;
	}

}
