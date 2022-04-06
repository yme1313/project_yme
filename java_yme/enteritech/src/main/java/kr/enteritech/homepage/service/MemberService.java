package kr.enteritech.homepage.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.enteritech.homepage.pagination.Criteria;
import kr.enteritech.homepage.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	MemberVO signin(MemberVO user);

	void keepLogin(String me_id, String session_id, Date session_limit);

	MemberVO getMemberByCookie(String value);

	void signout(HttpServletRequest request, HttpServletResponse response);

	MemberVO getMemberByRequest(HttpServletRequest request);

	Object getMember(String id);

	MemberVO updateMember(MemberVO user, MemberVO nowUser);
	
	MemberVO updateMemberAdmin(MemberVO user, MemberVO admin);

	String memberOut(MemberVO user, MemberVO nowUser, HttpServletRequest request , HttpServletResponse response);

	int getTotalCount(MemberVO user, Criteria cri);

	ArrayList<MemberVO> getMemberList(Criteria cri);

	String findPw(String id);

	MemberVO getMemberAdmin(String me_id);

	String updateGrade(MemberVO user, MemberVO admin);

}
