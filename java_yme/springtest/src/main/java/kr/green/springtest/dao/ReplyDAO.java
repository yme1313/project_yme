package kr.green.springtest.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.vo.MemberVO;
import kr.green.springtest.vo.ReplyVO;

public interface ReplyDAO {

	void insertReply(@Param("rvo")ReplyVO rvo);

	ArrayList<ReplyVO> getReplyList(@Param("rp_bd_num")int rp_bd_num, @Param("cri")Criteria cri);

	int getTotalCount(@Param("rp_bd_num")int rp_bd_num);

	int updateReply(@Param("rvo")ReplyVO rvo, @Param("user")MemberVO user);

}
