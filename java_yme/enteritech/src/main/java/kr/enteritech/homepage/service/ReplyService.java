package kr.enteritech.homepage.service;

import java.util.ArrayList;

import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.ReplyVO;

public interface ReplyService {

	String insertReply(ReplyVO reply, MemberVO user);

	ArrayList<ReplyVO> getReply(Integer num);

	String deleteReply(Integer rp_num, MemberVO user);

	String modifyReply(ReplyVO reply, MemberVO user);

}
