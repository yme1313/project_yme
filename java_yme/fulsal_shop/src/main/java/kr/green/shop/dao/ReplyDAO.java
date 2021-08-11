package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.ReplyVO;

public interface ReplyDAO {

	void insertReply(ReplyVO reply);

	ArrayList<ReplyVO> getReplyList(Integer rp_bd_num);

	ReplyVO getReply(Integer rp_num);

	void deleteReply(ReplyVO dbReply);

}
