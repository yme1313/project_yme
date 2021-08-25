package kr.green.shop.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.service.CartService;
import kr.green.shop.service.FutsalService;
import kr.green.shop.service.MemberService;
import kr.green.shop.service.OptionService;
import kr.green.shop.vo.CartVO;
import kr.green.shop.vo.FutsalVO;
import kr.green.shop.vo.OptionVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class OrderController {
	FutsalService futsalService;
	OptionService optionService;
	MemberService memberService;
	CartService cartService;
	
	@PostMapping("/order/direct")
	public ModelAndView directPost(ModelAndView mv, FutsalVO futsal, OptionVO option, CartVO cart) {
		FutsalVO buyFutsal = futsalService.getDirectBuy(futsal, option, cart);
		mv.addObject("futsal", buyFutsal);
		mv.addObject("title", "주문서 작성");
		mv.setViewName("/template/order/direct");
		return mv;
	}	
	@PostMapping("/order/cart_order")
	public ModelAndView Cart_orderPost(ModelAndView mv, Integer[] ca_num) {
		System.out.println(ca_num);
		ArrayList <CartVO> list = cartService.getOrderCart(ca_num);
		mv.addObject("list", list);
		mv.addObject("title", "주문서 작성");
		mv.setViewName("/template/order/cart_order");
		return mv;
	}

}
