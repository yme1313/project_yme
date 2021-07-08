package kr.green.springtest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.springtest.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test(ModelAndView mv) {
		System.out.println(memberService.getEmail("abc123"));
		return mv;
	}
}