package kr.enteritech.homepage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.ReviewVO;

public interface ReviewDAO {

	void insertReview(@Param("fu_num")int fu_num, @Param("or_me_id")String or_me_id, @Param("rv_star")String rv_star, @Param("rv_contents")String rv_contents);

	ArrayList<ReviewVO> getReviewList(@Param("fu_num")Integer fu_num, @Param("cri")Criteria cri);

	int getTotalCount(Integer fu_num);

	void deleteReview(@Param("review")ReviewVO review, @Param("user")MemberVO user);

	ReviewVO getReview(int rv_num);

	void erase(String me_id);


}
