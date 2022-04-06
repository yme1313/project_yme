package kr.enteritech.homepage.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.enteritech.homepage.dao.FutsalDAO;
import kr.enteritech.homepage.dao.ReviewDAO;
import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.ReviewVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewServiceImp implements ReviewService{
	
	FutsalDAO futsalDao;
	ReviewDAO reviewDao;
	
	@Override
	public void insertReview(int fu_num, String or_me_id, String rv_star, String rv_contents) {
		if(fu_num <= 0 || or_me_id == null || rv_star == null || rv_contents == null) {
			return;
		}
		reviewDao.insertReview(fu_num, or_me_id, rv_star, rv_contents);
		
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Integer fu_num, Criteria cri) {
		if(fu_num <= 0 ) {
			return null;
		}
		return reviewDao.getReviewList(fu_num, cri);
	}

	@Override
	public int getTotalCount(Integer fu_num) {
		if(fu_num <= 0 ) {
			return 0;
		}
		return reviewDao.getTotalCount(fu_num);
	}

	@Override
	public ReviewVO getReview(ReviewVO rev) {
		if(rev == null) {
			return null;
		}
		return reviewDao.getReview(rev.getRv_num());
	}

	@Override
	public String deleteReview(ReviewVO review, MemberVO user) {
		if(review == null || user == null || !review.getRv_me_id().equals(user.getMe_id())) {
			return "FAIL";
		}
		reviewDao.deleteReview(review,user);
		return "OK";
	}



}
