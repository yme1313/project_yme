package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.ReviewVO;

public interface ReviewService {

	void insertReview(int fu_num, String or_me_id, String rv_star, String rv_contents);

	ArrayList<ReviewVO> getReviewList(Integer fu_num, Criteria cri);

	int getTotalCount(Integer fu_num);

	ReviewVO getReview(ReviewVO rev);

	String deleteReview(ReviewVO review, MemberVO user);



}
