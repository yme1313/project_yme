package kr.green.test.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.test.pagination.Criteria;
import kr.green.test.pagination.PageMaker;
import kr.green.test.service.MemberService;
import kr.green.test.vo.MemberVO;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	
	MemberService memberService;
	
	@GetMapping("/user/list")
	public ModelAndView testGet(ModelAndView mv, HttpServletRequest request, Criteria cri) {
		MemberVO user = memberService.getMemberByRequest(request);
		cri.setPerPageNum(2);
		ArrayList<MemberVO> list = memberService.getMemberList(user, cri);
		int totalCount = memberService.getTotalCount(user);
		PageMaker pm = new PageMaker(totalCount , 2, cri);
		mv.addObject("title","회원관리");
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.setViewName("/template/admin/user/list");
		return mv;
	}
	@ResponseBody
	@PostMapping("/user/mod")
	public String userModPost(@RequestBody MemberVO user, HttpServletRequest request) {
		MemberVO loginUser = memberService.getMemberByRequest(request);
		return memberService.updateAuthority(user,loginUser)? "OK" : "FAIL";
	}
}
