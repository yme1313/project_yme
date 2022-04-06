package kr.enteritech.homepage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.pagination.PageMaker;
import kr.enteritech.homepage.service.CartService;
import kr.enteritech.homepage.service.FutsalService;
import kr.enteritech.homepage.service.MemberService;
import kr.enteritech.homepage.service.OptionService;
import kr.enteritech.homepage.service.OrderService;
import kr.enteritech.homepage.service.ReviewService;
import kr.enteritech.homepage.vo.CartVO;
import kr.enteritech.homepage.vo.FutsalVO;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.OptionVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class GoodsController {
	FutsalService futsalService;
	OptionService optionService;
	MemberService memberService;
	CartService cartService;
	OrderService orderService;
	ReviewService reviewService;
	
	@GetMapping("/goods/newGoods/list")
	public ModelAndView newGoodsGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getNewGoodsList(cri);
		int totalCount = futsalService.getNewGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","신상품");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.setViewName("/template/goods/list3");
		return mv;
	}
	@GetMapping("/goods/shoes/list")
	public ModelAndView shoesGet(ModelAndView mv, Criteria cri) {
		cri.setFu_type("풋살화");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getGoodsList(cri);
		int totalCount = futsalService.getGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","풋살화");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("type", "/shoes");
		mv.setViewName("/template/goods/list");
		return mv;
	}
	@GetMapping("/goods/cloth/list")
	public ModelAndView clothGet(ModelAndView mv, Criteria cri) {
		cri.setFu_type("의류");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getGoodsList(cri);
		int totalCount = futsalService.getGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("title","의류");
		mv.addObject("type", "/cloth");
		mv.setViewName("/template/goods/list");
		return mv;
	}	
	@GetMapping("/goods/ball/list")
	public ModelAndView ballGet(ModelAndView mv, Criteria cri) {
		cri.setFu_type("풋살공");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getGoodsList(cri);
		int totalCount = futsalService.getGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("title","풋살공");
		mv.addObject("type", "/ball");
		mv.setViewName("/template/goods/list");
		return mv;
	}	
	@GetMapping("/goods/hands/list")
	public ModelAndView handsGet(ModelAndView mv, Criteria cri) {
		cri.setFu_type("골키퍼장갑");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getGoodsList(cri);
		int totalCount = futsalService.getGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("title","골키퍼장갑");
		mv.addObject("type", "/hands");
		mv.setViewName("/template/goods/list");
		return mv;
	}	
	@GetMapping("/goods/bag/list")
	public ModelAndView bagGet(ModelAndView mv, Criteria cri) {
		cri.setFu_type("스포츠가방");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getGoodsList(cri);
		int totalCount = futsalService.getGoodsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("title","스포츠가방");
		mv.addObject("type", "/bag");
		mv.setViewName("/template/goods/list");
		return mv;
	}	
	@GetMapping("/goods/nike/list2")
	public ModelAndView nikeGet(ModelAndView mv, Criteria cri) {
		cri.setFu_brand("나이키");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getBrandList(cri);
		int totalCount = futsalService.getBrandTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","풋살화");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("brand", "/nike");
		mv.setViewName("/template/goods/list2");
		return mv;
	}
	@GetMapping("/goods/adidas/list2")
	public ModelAndView adidasGet(ModelAndView mv, Criteria cri) {
		cri.setFu_brand("아디다스");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getBrandList(cri);
		int totalCount = futsalService.getBrandTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","풋살화");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("brand", "/adidas");
		mv.setViewName("/template/goods/list2");
		return mv;
	}
	@GetMapping("/goods/puma/list2")
	public ModelAndView pumaGet(ModelAndView mv, Criteria cri) {
		cri.setFu_brand("푸마");
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getBrandList(cri);
		int totalCount = futsalService.getBrandTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","풋살화");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.addObject("brand", "/puma");
		mv.setViewName("/template/goods/list2");
		return mv;
	}
	@GetMapping("/goods/all")
	public ModelAndView searchGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(6);
		ArrayList<FutsalVO> list = futsalService.getSearchList(cri);
		int totalCount = futsalService.getSearchTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount , 6, cri);
		mv.addObject("title","검색상품");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.setViewName("/template/goods/all");
		return mv;
	}
	@GetMapping("/goods/detail")
	public ModelAndView detailGet(ModelAndView mv, Integer num) {
		FutsalVO futsal = futsalService.getFutsal(num);
		ArrayList <OptionVO> list = optionService.getOptionList(num);
		mv.addObject("futsal", futsal);
		mv.addObject("title","풋살화 상세");
		mv.addObject("list", list);
		mv.setViewName("/template1/goods/detail");
		return mv;
	}	
	@ResponseBody
	@PostMapping("/goods/review")
	public String reviewPost(String or_me_id, int fu_num , String rv_star, String rv_contents, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		String Num = String.valueOf(fu_num);
		ArrayList <String> or_fuNums = orderService.getOrderFuNumsList(or_me_id);
		String str = "";
		for (String fu_num_str : or_fuNums) {
			str += fu_num_str+" ";
		}
		str = str.replace(',', ' ');
		if(user == null) {
			return "LOGIN";
		}
		if(str.matches("(.*)"+Num+"(.*)")) {
			reviewService.insertReview(fu_num, or_me_id, rv_star, rv_contents);
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	@GetMapping("/cart/list")
	public ModelAndView listGet(ModelAndView mv, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList <CartVO> list = cartService.getCartList(user);
		mv.addObject("title","장바구니 목록");
		mv.addObject("list", list);
		if(user == null) {
			mv.setViewName("/template/member/signin");
		} else {
			mv.setViewName("/template1/cart/list");
		}
		return mv;
	}	

	@ResponseBody
	@PostMapping("/cart/add")
	public String cartInsertPost(@RequestBody CartVO cart, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return cartService.insertCart(cart, user);
	}
	@ResponseBody
	@PostMapping("/cart/del")
	public String cartDelPost(@RequestBody CartVO cart, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		CartVO dbCart = cartService.getCartNum(cart.getCa_num()); 
		return cartService.deleteCart(dbCart, user);
	}	
	@ResponseBody
	@PostMapping("/cart/selectDel")
	public String cartDelPost(CartVO cart, HttpServletRequest request, @RequestParam(value = "chbox[]") List<String> chArr) {
		MemberVO user = memberService.getMemberByRequest(request);
		int ca_num =0;
		if(user == null) {
			return "FAIL";
		} else {
		  for(String i : chArr) {   
			   ca_num = Integer.parseInt(i);
			   cart.setCa_num(ca_num);
			   cartService.selectDelCart(cart);
		  }
		  return "OK";
		}
	}

	
}
