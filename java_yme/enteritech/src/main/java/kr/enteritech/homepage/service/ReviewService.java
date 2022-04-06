package kr.enteritech.homepage.service;

import java.util.ArrayList;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.ReviewVO;

public interface ReviewService {

	void insertReview(int fu_num, String or_me_id, String rv_star, String rv_contents);

	ArrayList<ReviewVO> getReviewList(Integer fu_num, Criteria cri);

	int getTotalCount(Integer fu_num);

	ReviewVO getReview(ReviewVO rev);

	String deleteReview(ReviewVO review, MemberVO user);



}
