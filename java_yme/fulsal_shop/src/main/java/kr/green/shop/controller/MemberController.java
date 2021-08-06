package kr.green.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.service.MemberService;
import kr.green.shop.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	@GetMapping("/member/signup")
	public ModelAndView signupGet(ModelAndView mv) {
		mv.addObject("title", "회원가입");
		mv.setViewName("/template/member/signup");
		return mv;
	}
	@PostMapping("/member/signup")
	public ModelAndView signupPost(ModelAndView mv, MemberVO user) {
		boolean signupOk = memberService.signup(user);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/member/signin")
	public ModelAndView signinGet(ModelAndView mv) {
		mv.addObject("title", "로그인");
		mv.setViewName("/template/member/signin");
		return mv;
	}
	@PostMapping("/member/signin")
	public ModelAndView SigninPost(ModelAndView mv, MemberVO user) {
		MemberVO loginUser = memberService.signin(user);
		if(loginUser != null) {
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("redirect:/member/signin");
		}
		mv.addObject("user", loginUser);
		return mv;
	}
	@GetMapping("member/signout")
	public ModelAndView SignoutGet(ModelAndView mv, 
			HttpServletRequest request,
			HttpServletResponse response) {
		memberService.signout(request, response);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("member/mypage")
	public ModelAndView mypageGet(ModelAndView mv) {
		mv.addObject("title", "개인정보수정");
		mv.setViewName("/template/member/mypage");
		return mv;
	}
	@ResponseBody
	@PostMapping("/id/check")
	public String idCheck(String me_id) {
		return memberService.getMember(me_id) != null ? "FAIL" : "OK";
	}
}
