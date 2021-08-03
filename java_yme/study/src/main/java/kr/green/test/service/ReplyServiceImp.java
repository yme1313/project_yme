package kr.green.test.service;

import org.springframework.stereotype.Service;

import kr.green.test.dao.BoardDAO;
import kr.green.test.dao.ReplyDAO;
import kr.green.test.vo.BoardVO;
import kr.green.test.vo.MemberVO;
import kr.green.test.vo.ReplyVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImp implements ReplyService{
	
	private ReplyDAO replyDao;
	private BoardDAO boardDao;
	
	@Override
	public String insertReply(ReplyVO reply, MemberVO user) {
		if(reply == null || reply.getRp_bd_num() <=0 || user == null)
			return "FAIL";
		BoardVO board = boardDao.selectBoard(reply.getRp_bd_num());
		if(board == null || board.getType().equals("IMAGE"))
			return "FAIL";
		reply.setRp_me_id(user.getId());
		replyDao.insertReply(reply);
		return "OK";
	}
}
