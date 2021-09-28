package kr.green.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView directPost(ModelAndView mv, FutsalVO futsal, OptionVO option, CartVO cart) {
		FutsalVO directBuy = futsalService.getDirectBuy(futsal, option);
		mv.addObject("cart", cart);
		mv.addObject("futsal", directBuy);
		mv.addObject("title", "주문서 작성");
		mv.setViewName("/template6/order/direct");
		return mv;
	}	
	@ResponseBody
	@PostMapping("/order/buyGoods")
	public String buyGoodsPost(			
			@RequestParam(value = "ca_num[]") String[] checkArr, 
			@RequestParam(value = "ca_count[]") String[] countArr,
			@RequestParam(value = "ca_price[]") String[] priceArr) {
			return cartService.updateCount(checkArr,countArr, priceArr);
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
		mv.setViewName("/template6/order/cart_order");
		return mv;
	}
	@PostMapping("/order/orderDirectOk")
	public ModelAndView OrdeDirectOkPost(ModelAndView mv, OrderVO order,HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		orderService.insertOrder(order,user);
		mv.addObject("user", user);
		mv.addObject("title", "주문서 확인");
		mv.setViewName("/template/order/orderOk");
		return mv;
	}
	@PostMapping("/order/orderOk")
	public ModelAndView OrdeOkPost(ModelAndView mv, OrderVO order,HttpServletRequest request, 
			Integer[] ca_num) {
		MemberVO user = memberService.getMemberByRequest(request);
		orderService.insertOrder(order,user);
		cartService.deletdOrderCart(ca_num);
		mv.addObject("order", order);
		mv.addObject("user", user);
		mv.addObject("title", "주문서 확인");
		mv.setViewName("/template/order/orderOk");
		return mv;
	}
	@GetMapping("/order/list")
	public ModelAndView listGet(ModelAndView mv, Criteria cri, HttpServletRequest request) {
		cri.setPerPageNum(8);
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
	@GetMapping("/order/detail")
	public ModelAndView orderDetailGet(ModelAndView mv, Integer num) {
		OrderVO order = orderService.getOrder(num);
		mv.addObject("title", "주문서 상세");
		mv.addObject("order",order);
		mv.setViewName("/template5/order/detail");
		return mv;
	}
	@GetMapping("order/return")
	public ModelAndView returnGet(ModelAndView mv) {
		mv.setViewName("/order/return");
		return mv;
	}
	@GetMapping("/order/return_list")
	public ModelAndView return_listGet(ModelAndView mv, Criteria cri, HttpServletRequest request) {
		cri.setPerPageNum(8);
		MemberVO user = memberService.getMemberByRequest(request);
		ArrayList <OrderVO> list = orderService.getOrderReturnList(cri, user);
		int total = orderService.getReturnTotalCount(cri, user);
		PageMaker pm = new PageMaker(total, 10, cri);
		mv.addObject("list", list);
		mv.addObject("pm", pm);
		if(user == null) {
			mv.setViewName("/template/member/signin");
		} else {
			mv.setViewName("/template5/order/return_list");
		}
		return mv;
	}
	@PostMapping("order/cancle")
	public ModelAndView orderCanclePost(ModelAndView mv, OrderVO order) {
		orderService.cancleOrder(order);
		mv.setViewName("redirect:/order/list");
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
}
