package kr.green.shop.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.shop.dao.BoardDAO;
import kr.green.shop.dao.ReplyDAO;
import kr.green.shop.vo.BoardVO;
import kr.green.shop.vo.MemberVO;
import kr.green.shop.vo.ReplyVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImp implements ReplyService{
	
	ReplyDAO replyDao;
	BoardDAO boardDao;

	@Override
	public String insertReply(ReplyVO reply, MemberVO user) {
		if(reply == null || reply.getRp_bd_num() <=0 || user == null)
			return "FAIL";
		BoardVO board = boardDao.getBoard(reply.getRp_bd_num());
		if(board == null)
			return "FAIL";
		boardDao.setAnswer(board);
		reply.setRp_me_id(user.getMe_id());
		replyDao.insertReply(reply);
		return "OK";
	}
	@Override
	public ArrayList<ReplyVO> getReply(Integer num) {
		if(num == null)
			return null;
		return replyDao.getReply(num);
	}
}
