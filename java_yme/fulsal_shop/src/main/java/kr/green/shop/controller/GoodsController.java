package kr.green.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.pagination.PageMaker;
import kr.green.shop.service.CartService;
import kr.green.shop.service.FutsalService;
import kr.green.shop.service.MemberService;
import kr.green.shop.service.OptionService;
import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OptionVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class GoodsController {
	FutsalService futsalService;
	OptionService optionService;
	MemberService memberService;
	CartService cartService;
	
	@GetMapping("/goods/shoes")
	public ModelAndView shoesGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getShoesList(cri);
		int totalCount = futsalService.getShoesTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","풋살화");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.setViewName("/template/goods/shoes");
		return mv;
	}
	@GetMapping("/goods/cloth")
	public ModelAndView clothGet(ModelAndView mv, Criteria cri) {
		mv.addObject("title","의류");
		mv.setViewName("/template/goods/cloth");
		return mv;
	}	
	@GetMapping("/goods/detail")
	public ModelAndView detailGet(ModelAndView mv, Integer num) {
		FutsalVO futsal = futsalService.getFutsal(num);
		ArrayList <OptionVO> list = optionService.getOptionList(num);
		mv.addObject("futsal", futsal);
		mv.addObject("title","풋살화 상세");
		mv.addObject("list", list);
		mv.setViewName("/template/goods/detail");
		return mv;
	}	
	
	
	@GetMapping("/cart/list")
	public ModelAndView listGet(ModelAndView mv) {
		ArrayList <CartVO> list = cartService.getCartList();
		mv.addObject("title","장바구니 목록");
		mv.addObject("list", list);
		mv.setViewName("/template/cart/list");
		return mv;
	}	

	@ResponseBody
	@PostMapping("/cart/add")
	public String cartInsertPost(@RequestBody CartVO cart, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return cartService.insertCart(cart, user);
	}
}
