package kr.green.springtest.dao;
 
import org.apache.ibatis.annotations.Param;

import kr.green.springtest.vo.MemberVO;
 
public interface MemberDAO {
   
	public MemberVO getMember(@Param("id")String id);

	void insertMember(@Param("user")MemberVO user);
}
