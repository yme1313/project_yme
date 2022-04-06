package kr.enteritech.homepage.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.enteritech.homepage.dao.BoardDAO;
import kr.enteritech.homepage.dao.ReplyDAO;
import kr.enteritech.homepage.vo.BoardVO;
import kr.enteritech.homepage.vo.MemberVO;
import kr.enteritech.homepage.vo.ReplyVO;
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
		return replyDao.getReplyList(num);
	}
	@Override
	public String deleteReply(Integer rp_num, MemberVO user) {
		if(rp_num == null || user == null)
			return "FAIL";
		ReplyVO dbReply = replyDao.getReply(rp_num);
		if(dbReply == null || !dbReply.getRp_me_id().equals(user.getMe_id()))
			return "FAIL";
		BoardVO board = boardDao.getBoard(dbReply.getRp_bd_num());
		boardDao.noAnswer(board);
		replyDao.deleteReply(dbReply);
		return "OK";
	}
	@Override
	public String modifyReply(ReplyVO reply, MemberVO user) {
		if(reply == null || user == null)
			return "FAIL";
		ReplyVO dbReply = replyDao.getReply(reply.getRp_num());
		if(dbReply == null || !dbReply.getRp_me_id().equals(user.getMe_id()))
			return "FAIL";
		dbReply.setRp_content(reply.getRp_content());
		replyDao.modifyReply(dbReply);
		return "OK";
	}
}
