package kr.green.shop.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.green.shop.service.BoardService;
import kr.green.shop.service.MemberService;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/reply")
public class ReplyController {
	
	private MemberService memberService;
	private BoardService boardService;
	
}
