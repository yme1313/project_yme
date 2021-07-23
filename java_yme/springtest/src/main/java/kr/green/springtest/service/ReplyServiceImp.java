package kr.green.springtest.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.green.springtest.dao.ReplyDAO;
import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.vo.MemberVO;
import kr.green.springtest.vo.ReplyVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReplyServiceImp implements ReplyService{
	private ReplyDAO replyDao;

	@Override
	public int insertReply(ReplyVO rvo) {
		if(rvo.getRp_me_id() == null || rvo.getRp_me_id().length() ==0) {
			return 0;
		}
		replyDao.insertReply(rvo);
		return 1;
	}

	@Override
	public ArrayList<ReplyVO> getReplyList(int rp_bd_num, Criteria cri) {
		return replyDao.getReplyList(rp_bd_num, cri);
	}

	@Override
	public int getTotalCount(int rp_bd_num) {
		return replyDao.getTotalCount(rp_bd_num);
	}

	@Override
	public String deleteReply(ReplyVO rvo, MemberVO user) {
		return null;
	}


}
