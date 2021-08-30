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
	public ModelAndView directPost(ModelAndView mv, FutsalVO futsal, OptionVO option) {
		System.out.println(futsal);
		System.out.println(option);
		FutsalVO directBuy = futsalService.getDirectBuy(futsal, option);
		mv.addObject("futsal", directBuy);
		mv.addObject("title", "주문서 작성");
		mv.setViewName("/template1/order/direct");
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
		mv.setViewName("/template1/order/cart_order");
		return mv;
	}
	@PostMapping("/order/orderOk")
	public ModelAndView OrdeOkPost(ModelAndView mv, OrderVO order,HttpServletRequest request, 
			Integer[] ca_num) {
		MemberVO user = memberService.getMemberByRequest(request);
		orderService.insertOrder(order,user);
		cartService.deletdOrderCart(ca_num);
		mv.addObject("user", user);
		mv.addObject("title", "주문서 확인");
		mv.setViewName("/template/order/orderOk");
		return mv;
	}
	@GetMapping("/order/list")
	public ModelAndView listGet(ModelAndView mv, Criteria cri, HttpServletRequest request) {
		cri.setPerPageNum(2);
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList <OrderVO> list = orderService.getOrderList(cri, user);
		int total = orderService.getTotalCount(cri, user);
		PageMaker pm = new PageMaker(total, 10, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		if(user == null) {
			mv.setViewName("/template/member/signin");
		} else {
			mv.setViewName("/template5/order/list");
		}
		return mv;
	}
	@GetMapping("/order/cancle_list")
	public ModelAndView cancle_listGet(ModelAndView mv, Criteria cri, HttpServletRequest request) {
		cri.setPerPageNum(2);
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList <OrderVO> list = orderService.getOrderCancleList(cri, user);
		int total = orderService.getCancleTotalCount(cri, user);
		PageMaker pm = new PageMaker(total, 10, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		if(user == null) {
			mv.setViewName("/template/member/signin");
		} else {
			mv.setViewName("/template5/order/cancle_list");
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/order/cancle")
	public String canclePost(@RequestBody OrderVO ord) {
		OrderVO order = orderService.getOrder(ord.getOr_num());
		return orderService.cancleOrder(order);
	}

}
