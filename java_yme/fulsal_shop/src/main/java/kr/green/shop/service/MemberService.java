package kr.green.shop.service;

import kr.green.shop.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	MemberVO signin(MemberVO user);

}
