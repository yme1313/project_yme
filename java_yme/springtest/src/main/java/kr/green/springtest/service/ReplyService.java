package kr.green.springtest.service;

import java.util.ArrayList;

import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.vo.MemberVO;
import kr.green.springtest.vo.ReplyVO;

public interface ReplyService {

	int insertReply(ReplyVO rvo);

	ArrayList<ReplyVO> getReplyList(int rp_bd_num, Criteria cri);

	int getTotalCount(int rp_bd_num);

	String deleteReply(ReplyVO rvo, MemberVO user);

	int updateReply(ReplyVO rvo, MemberVO user);



}
