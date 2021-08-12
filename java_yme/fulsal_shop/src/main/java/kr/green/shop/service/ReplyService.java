package kr.green.shop.service;

import java.util.ArrayList;

import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.ReplyVO;

public interface ReplyService {

	String insertReply(ReplyVO reply, MemberVO user);

	ArrayList<ReplyVO> getReply(Integer num);

	String deleteReply(Integer rp_num, MemberVO user);

	String modifyReply(ReplyVO reply, MemberVO user);

}
