package kr.green.test.service;

import java.util.regex.Pattern;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.test.dao.MemberDAO;
import kr.green.test.vo.MemberVO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImp implements MemberService{
	
	MemberDAO memberDao;
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean signup(MemberVO user) {
		System.out.println(user);
		if(user == null) {
			return false;
		}
		//아이디 유효상 검사
		String idRegex = "^[a-z0-9_-]{5,20}$";
		if(user.getId() == null || !Pattern.matches(idRegex, user.getId())) {
			return false;
		}
		//비밀번호 유효성 검사
		String pwRegex = "^[a-zA-Z0-9!@#]{8,16}$";
		if(user.getPw() == null || !Pattern.matches(pwRegex, user.getPw())) {
			return false;
		}
		//이메일 유효성 검사, xx@yy.zz or xx@yy.zz.cc
		String emailRegex = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		if(user.getEmail() == null || !Pattern.matches(emailRegex, user.getEmail())) {
			return false;
		}
		//이름 유효성 검사
		if(user.getName() == null || user.getName().trim().length() == 0) {
			return false;
		}
		//성별 유효성 검사
		if(user.getGender() == null) {
			return false;
		}
		//비밀번호 암호화
		String encodePw = passwordEncoder.encode(user.getPw());
		user.setPw(encodePw);
		//없으면 다오에게 회원 정보를 주면서 회원가입하라고 시킨 후 true를 리턴
		memberDao.insertMember(user);
		return true;
	}

	@Override
	public MemberVO signin(MemberVO user) {
		if(user ==null || user.getId() ==null) {
			return null;
		}
		MemberVO dbUser = memberDao.selectUser(user.getId());
		//잘못된 ID = 회원이 아닌 경우
		if(dbUser == null) {
			return null;
		}
		//잘못된 비번 
		if(user.getPw() == null || !passwordEncoder.matches(user.getPw(), dbUser.getPw())) {
			return null;
		}
		//자동로그인 기능을 위해
		dbUser.setUseCookie(user.getUseCookie());
		return dbUser;
	}
}
