package kr.green.shop.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.green.shop.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	MemberVO signin(MemberVO user);

	void keepLogin(String me_id, String session_id, Date session_limit);

	MemberVO getMemberByCookie(String value);

	void signout(HttpServletRequest request, HttpServletResponse response);

	MemberVO getMemberByRequest(HttpServletRequest request);

}
