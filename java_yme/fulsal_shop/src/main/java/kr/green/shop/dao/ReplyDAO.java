package kr.green.shop.dao;

import java.util.ArrayList;

import kr.green.shop.vo.ReplyVO;

public interface ReplyDAO {

	void insertReply(ReplyVO reply);

	ArrayList<ReplyVO> getReply(Integer rp_bd_num);

}
