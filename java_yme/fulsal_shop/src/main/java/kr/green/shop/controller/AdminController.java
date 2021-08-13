package kr.green.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.service.BoardService;
import kr.green.shop.service.MemberService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	
	private MemberService memberService;
	private BoardService boardService;
	
	@GetMapping("/user/list")
	public ModelAndView signupGet(ModelAndView mv) {
		mv.addObject("title", "회원목록");
		mv.setViewName("/template/admin/user/list");
		return mv;
	}
}
