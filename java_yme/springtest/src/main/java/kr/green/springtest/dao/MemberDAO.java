package kr.green.springtest.dao;
 
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.springtest.vo.MemberVO;
 
public interface MemberDAO {
   
	public MemberVO getMember(@Param("id")String id);

	void insertMember(@Param("user")MemberVO user);

	public int updateMember(@Param("user")MemberVO dbUser);

	public void keepLogin(@Param("id")String id, @Param("session_id")String session_id, @Param("session_limit")Date session_limit);

	public MemberVO getMemberBySessionId(@Param("session_id")String session_id);
}
