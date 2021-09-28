package kr.green.shop.controller;

import java.util.ArrayList;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.pagination.PageMaker;
import kr.green.shop.service.BoardService;
import kr.green.shop.service.MemberService;
import kr.green.shop.utils.SendSMS;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MemberController {
	private MemberService memberService;
	private BoardService boardService;
	
	@GetMapping("/member/signup")
	public ModelAndView signupGet(ModelAndView mv) {
		mv.addObject("title", "회원가입");
		mv.setViewName("/template/member/signup");
		return mv;
	}
	@PostMapping("/member/signup")
	public ModelAndView signupPost(ModelAndView mv, MemberVO user) {
		boolean signupOk = memberService.signup(user);
		if(signupOk) 
			mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("/member/signin")
	public ModelAndView signinGet(ModelAndView mv) {
		mv.addObject("title", "로그인");
		mv.setViewName("/template/member/signin");
		return mv;
	}
	@GetMapping("member/confirmSMS")
	public ModelAndView confirmSMSGet(ModelAndView mv) {
		mv.addObject("title","SMS인증");
		mv.setViewName("/member/confirmSMS");
		return mv;
	}
	@ResponseBody
	@PostMapping("member/sendSMS")
	public String sendSMSPost(String toPhone,String ranNum) {
		String phoneRegex = "^010([1-9]{1})([0-9]{3})([1-9]{1})([0-9]{3})$";
		if(toPhone == null) {
			return "FAIL";
		} else if(!Pattern.matches(phoneRegex, toPhone)) {
			return "FAIL";
		}		
		SendSMS.sendSMS(toPhone, ranNum);
		return "OK";
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
		mv.setViewName("/template3/member/mypage");
		return mv;
	}
	@PostMapping("member/mypage")
	public ModelAndView mypagePost(ModelAndView mv, MemberVO user, HttpServletRequest request) {
		MemberVO nowUser = memberService.getMemberByRequest(request);
		MemberVO updateUser = memberService.updateMember(user, nowUser);
		if(updateUser != null)
			request.getSession().setAttribute("user", updateUser);
		mv.setViewName("redirect:/");
		return mv;
	}
	@GetMapping("member/boardlist")
	public ModelAndView listGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(8);
		ArrayList <BoardVO> list = boardService.getBoardList(cri);
		int totalCount = boardService.getTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 5, cri);;
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("title", "1:1문의 내역");
		mv.setViewName("/template3/member/boardlist");
		return mv;
	}
	@GetMapping("member/memberout")
	public ModelAndView memberoutGet(ModelAndView mv) {
		mv.addObject("title", "회원탈퇴");
		mv.setViewName("/template3/member/memberout");
		return mv;
	}
	@PostMapping("member/memberout")
	public ModelAndView memberoutPost(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		MemberVO nowUser = memberService.getMemberByRequest(request);
		if(nowUser == null) 
			mv.setViewName("redirect:/");	
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/id/check")
	public boolean idCheck(String me_id) {
		return memberService.getMember(me_id) != null ? false : true;
	}
	@ResponseBody
	@PostMapping("/member/outcheck")
	public String outCheck(@RequestBody MemberVO user, HttpServletRequest request, HttpServletResponse response) {
		MemberVO nowUser = memberService.getMemberByRequest(request);
		return memberService.memberOut(user, nowUser, request, response);
	}
	
}
