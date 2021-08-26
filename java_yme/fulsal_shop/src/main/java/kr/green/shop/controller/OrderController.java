package kr.green.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.service.CartService;
import kr.green.shop.service.FutsalService;
import kr.green.shop.service.MemberService;
import kr.green.shop.service.OptionService;
import kr.green.shop.service.OrderService;
import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.OptionVO;
import kr.green.shop.vo.OrderVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class OrderController {
	FutsalService futsalService;
	OptionService optionService;
	MemberService memberService;
	CartService cartService;
	OrderService orderService;
	
	@PostMapping("/order/direct")
	public ModelAndView directPost(ModelAndView mv, FutsalVO futsal, OptionVO option, CartVO cart) {
		FutsalVO buyFutsal = futsalService.getDirectBuy(futsal, option, cart);
		mv.addObject("futsal", buyFutsal);
		mv.addObject("title", "주문서 작성");
		mv.setViewName("/template/order/direct");
		return mv;
	}	
	@PostMapping("/order/cart_order")
	public ModelAndView Cart_orderPost(ModelAndView mv, Integer[] ca_num, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList <CartVO> list = new ArrayList<CartVO>(); 
		if(ca_num != null) {
			for(Integer num : ca_num) {
				list.add(cartService.getCartNum(num));
			}
		}
		mv.addObject("list", list);
		mv.addObject("user", user);
		mv.addObject("title", "주문서 작성");
		mv.setViewName("/template/order/cart_order");
		return mv;
	}
	@PostMapping("/order/order_sheet")
	public ModelAndView Order_sheetPost(ModelAndView mv, OrderVO ord, HttpServletRequest request, Integer[] ca_num) {
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList <CartVO> list = new ArrayList<CartVO>(); 
		if(ca_num != null) {
			for(Integer num : ca_num) {
				list.add(cartService.getCartNum(num));
			}
		}
		orderService.insertOrder(ord , user);
		mv.addObject("list", list);
		mv.addObject("user", user);
		mv.addObject("title", "주문서 확인");
		mv.setViewName("/template/order/order_sheet");
		return mv;
	}

}
