package kr.green.test.service;

import kr.green.test.vo.MemberVO;
import kr.green.test.vo.ReplyVO;

public interface ReplyService {

	String insertReply(ReplyVO reply, MemberVO user);

}
