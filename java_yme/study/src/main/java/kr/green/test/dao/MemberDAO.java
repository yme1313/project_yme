package kr.green.test.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.test.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("user")MemberVO user);

	MemberVO selectUser(@Param("id")String id);

	void keepLogin(@Param("id")String id, @Param("session_id")String session_id, @Param("session_limit")Date session_limit);

	MemberVO selectUserBySession(@Param("session_id")String session_id);

}
