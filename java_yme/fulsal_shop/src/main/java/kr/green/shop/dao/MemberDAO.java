package kr.green.shop.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("user")MemberVO user);

	MemberVO getMember(String me_id);

	void keepLogin(@Param("me_id")String me_id, @Param("session_id")String session_id, @Param("session_limit")Date session_limit);

	MemberVO getMemberBySession(@Param("session_id")String session_id);

	public int updateMember(@Param("user")MemberVO nowUser);

	void memberOut(@Param("user")MemberVO nowUser);

	int getTotalCount(@Param("me_authority")String me_authority, @Param("cri")Criteria cri);

	ArrayList<MemberVO> getMemberList(@Param("cri")Criteria cri);

	void updateMemberAdmin(@Param("user")MemberVO user);

}
