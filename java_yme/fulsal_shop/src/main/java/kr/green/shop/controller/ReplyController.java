package kr.green.shop.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.green.shop.service.MemberService;
import kr.green.shop.service.ReplyService;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.ReplyVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/reply")
public class ReplyController {
	
	private MemberService memberService;
	private ReplyService replyService;
	
	@PostMapping("/insert")
	public String insertPost(@RequestBody ReplyVO reply, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		System.out.println(reply);
		return replyService.insertReply(reply, user);
	}
	@GetMapping("/show/{num}")
	public HashMap<String, Object> showGet(@PathVariable("num") Integer num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReplyVO> reply = replyService.getReply(num);
		map.put("reply", reply);
		return map;
	}
	@PostMapping("/delete")
	public String deletePost(Integer rp_num , HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		return replyService.deleteReply(rp_num ,user);
	}
	@PostMapping("/modify")
	public String modify(@RequestBody ReplyVO reply , HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		System.out.println(reply);
		return "";
	}
}
