package kr.green.springtest.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.green.springtest.vo.MemberVO;

public interface MemberService {
	
	public MemberVO signin(MemberVO user);

	public void signup(MemberVO user);

	public MemberVO getMember(HttpServletRequest r);

	public MemberVO updateMember(MemberVO user, MemberVO sUser);

	public MemberVO getMember(String id);

	public void keepLogin(String id, String session_id, Date session_limit);

	public MemberVO checkLoginBefore(String session_id);

	public String findPw(String id);

}
 