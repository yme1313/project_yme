package kr.enteritech.homepage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.enteritech.homepage.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv) {
		mv.addObject("title","엔터정보기술");
		mv.setViewName("/template/main/home");
		return mv;
	}
	@GetMapping("/findPw")
	public ModelAndView findPwGet(ModelAndView mv) {
		mv.addObject("title","비밀번호 찾기");
		mv.setViewName("/template/main/findpw");
		return mv;
	}
	@ResponseBody
	@GetMapping("/find/pw/{id}")
	public String findPwGet(@PathVariable("id") String id) {
		return memberService.findPw(id);
	}
}
