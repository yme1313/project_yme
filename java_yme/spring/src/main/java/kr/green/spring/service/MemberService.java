package kr.green.spring.service;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import kr.green.spring.vo.MemberVO;
public interface MemberService {

	public MemberVO signin(MemberVO user);

	public boolean signup(MemberVO user);

	public MemberVO getMember(String id);

	public MemberVO updateMember(MemberVO user);

	public MemberVO getMember(HttpServletRequest request);

	public ArrayList<MemberVO> getMemberEmail(String email);

	public void keeplogin(String id, String session_id, Date session_limit);

	public MemberVO checkLoginBefore(String session_id);


}