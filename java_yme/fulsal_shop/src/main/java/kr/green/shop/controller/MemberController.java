package kr.green.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.service.MemberService;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/member/signup")
	public ModelAndView home(ModelAndView mv) {
		mv.addObject("title", "회원가입");
		mv.setViewName("/template/member/signup");
		return mv;
	}
}
