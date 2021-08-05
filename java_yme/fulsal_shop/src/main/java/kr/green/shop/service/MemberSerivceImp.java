package kr.green.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shop.dao.MemberDAO;
import kr.green.shop.vo.MemberVO;

@Service
public class MemberSerivceImp implements MemberService{
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public boolean signup(MemberVO user) {
		if(user == null)
			return false;
		memberDao.insertMember(user);
		return true;
	}

	@Override
	public MemberVO signin(MemberVO user) {
		if(user == null || user.getMe_id() == null)
			return null;
		MemberVO dbUser = memberDao.getMember(user.getMe_id());
		if(dbUser == null) 
			return null;
		if(user.getMe_pw() == null)
			return null;
		return dbUser;
	}

}
