package kr.green.shop.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("user")MemberVO user);

	MemberVO getMember(String me_id);

}
