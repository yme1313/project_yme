package kr.enteritech.homepage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.pagination.PageMaker;
import kr.enteritech.homepage.service.MemberService;
import kr.enteritech.homepage.service.ReviewService;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.ReviewVO;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	
	private ReviewService reviewService;
	private MemberService memberService;
	
	@GetMapping("/list/{rv_fu_num}/{page}")
	public HashMap<String, Object> reviewListGet(@PathVariable("rv_fu_num") Integer fu_num, @PathVariable("page") Integer page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 3);
		ArrayList<ReviewVO> list = reviewService.getReviewList(fu_num,cri);
		int totalCount = reviewService.getTotalCount(fu_num);
		PageMaker pm = new PageMaker(totalCount, 10, cri);
		map.put("list", list);
		map.put("pm", pm);
		return map;
	}
	
	@PostMapping("/delete")
	public String reviewDelPost(@RequestBody ReviewVO rev, HttpServletRequest request) {
		MemberVO user = memberService.getMemberByRequest(request);
		ReviewVO review = reviewService.getReview(rev);
		return reviewService.deleteReview(review,user);
	}
	
	
}
