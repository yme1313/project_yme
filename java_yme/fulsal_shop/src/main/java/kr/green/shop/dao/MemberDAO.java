package kr.green.shop.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("user")MemberVO user);

	MemberVO getMember(String me_id);

	void keepLogin(@Param("me_id")String me_id, @Param("session_id")String session_id, @Param("session_limit")Date session_limit);

	MemberVO getMemberBySession(@Param("session_id")String session_id);

}
