package kr.green.springtest.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.springtest.dao.MemberDAO;
import kr.green.springtest.vo.MemberVO;
 
@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDAO memberDao;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    
    @Override
	public MemberVO signin(MemberVO user) {
		if(user == null || user.getId() == null || user.getId().trim().length() == 0
			|| user.getPw() ==null || user.getPw().trim().length() == 0)
			return null;
		MemberVO dbUser = memberDao.getMember(user.getId());
		if(dbUser == null)
			return null;
		if(passwordEncoder.matches(user.getPw(), dbUser.getPw()))
			return dbUser;
		return null;
	}

	@Override
	public void signup(MemberVO user) {
		if(user == null) {
			return;
		}
		//필수항목 체크
		if( user.getId() == null || user.getId().trim().length() == 0 ||
			user.getPw() == null || user.getPw().trim().length() == 0 ||
			user.getName() == null || user.getName().trim().length() == 0 ||
			user.getEmail() == null ||	user.getEmail().trim().length() == 0) {
			return;
		}
		//정규표현식 체크는 나중에 할 예정
		
		//암호화
		String ePW = passwordEncoder.encode(user.getPw());
		user.setPw(ePW);
		//회원가입
		memberDao.insertMember(user);
	}

	@Override
	public MemberVO getMember(HttpServletRequest r) {
		if(r == null || r.getSession() == null) {
			return null;
		}
		return (MemberVO)r.getSession().getAttribute("user");
	}

	@Override
	public MemberVO updateMember(MemberVO user, MemberVO sUser) {
		if(user == null || sUser == null || 
			user.getId() == null || !user.getId().equals(sUser.getId()))
			return null;
		if(user.getPw() != null && user.getPw().trim().length() != 0) {
			String ePw = passwordEncoder.encode(user.getPw());
			sUser.setPw(ePw);
		}
		sUser.setEmail(user.getEmail());
		sUser.setGender(user.getGender());
		sUser.setName(user.getName());
		memberDao.updateMember(sUser);
		return sUser;
	}
}



