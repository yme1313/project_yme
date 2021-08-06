package kr.green.shop.service;

import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.green.shop.dao.MemberDAO;
import kr.green.shop.vo.MemberVO;

@Service
public class MemberSerivceImp implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public boolean signup(MemberVO user) {
		if(user == null)
			return false;
		//아이디 유효상 검사
		String idRegex = "^[a-z0-9_-]{5,12}$";
		if(user.getMe_id() == null || !Pattern.matches(idRegex, user.getMe_id())) {
			return false;
		}
		//비밀번호 유효성 검사
		String pwRegex = "^[a-zA-Z0-9!@#]{8,16}$";
		if(user.getMe_pw() == null || !Pattern.matches(pwRegex, user.getMe_pw())) {
			return false;
		}
		//이름 유효성 검사
		String nameRegex = "^[^ㄱ-ㅎㅏ-ㅣ!@#\\s]+$";
		if(user.getMe_name() == null || !Pattern.matches(nameRegex, user.getMe_name())) {
			return false;
		}
		//전화번호 유효성 검사
		String phoneRegex = "^010([1-9]{1})([0-9]{3})([1-9]{1})([0-9]{3})$";
		if(user.getMe_phone() == null || !Pattern.matches(phoneRegex, user.getMe_phone()))
		//생년월일 유효성 검사
		if(user.getMe_birth() == 0) {
			return false;
		}
		//성별 유효성 검사
		if(user.getMe_gender() == null) {
			return false;
		}
		//이메일 유효성 검사, xx@yy.zz or xx@yy.zz.cc
		String emailRegex = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		if(user.getMe_email() == null || !Pattern.matches(emailRegex, user.getMe_email())) {
			return false;
		}
		//주소 유효성 검사
		if(user.getMe_postnum() == 0) {
			return false;
		}
		String encodePw = passwordEncoder.encode(user.getMe_pw());
		user.setMe_pw(encodePw);
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
		if(dbUser.getMe_pw() == null || !passwordEncoder.matches(user.getMe_pw(), dbUser.getMe_pw()))
			return null;
		dbUser.setUseCookie(user.getUseCookie());
		return dbUser;
	}

	@Override
	public void keepLogin(String me_id, String session_id, Date session_limit) {
		if(me_id == null) {
			return;
		}
		memberDao.keepLogin(me_id, session_id, session_limit);
	}

	@Override
	public MemberVO getMemberByCookie(String session_id) {
		if(session_id == null) {
			return null;
		}
		return memberDao.getMemberBySession(session_id);
	}

	@Override
	public void signout(HttpServletRequest request, HttpServletResponse response) {
		if(request == null || response == null) {
			return;
		}
		MemberVO user = getMemberByRequest(request);
		if(user == null) {
			return;
		}
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie == null) {
			return;
		}
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
		keepLogin(user.getMe_id(), "none", new Date());
	}
	@Override
	public MemberVO getMemberByRequest(HttpServletRequest request) {
		if(request == null ) {
			return null;
		}
		return (MemberVO)request.getSession().getAttribute("user");
	}

	@Override
	public Object getMember(String me_id) {
		if(me_id == null) 
			return null;
		return memberDao.getMember(me_id);
	}

}
