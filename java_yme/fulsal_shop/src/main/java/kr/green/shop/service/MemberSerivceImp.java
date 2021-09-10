package kr.green.shop.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Pattern;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.green.shop.dao.BoardDAO;
import kr.green.shop.dao.CartDAO;
import kr.green.shop.dao.MemberDAO;
import kr.green.shop.dao.OrderDAO;
import kr.green.shop.pagination.Criteria;
import kr.green.shop.vo.MemberVO;

@Service
public class MemberSerivceImp implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	@Autowired
	BoardDAO boardDao;
	@Autowired
	CartDAO cartDao;
	@Autowired
	OrderDAO orderDao;	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private JavaMailSender mailSender;

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
		if(user.getMe_phone() == null || !Pattern.matches(phoneRegex, user.getMe_phone())) {
			return false;
		}
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

	@Override
	public MemberVO updateMember(MemberVO user, MemberVO nowUser) {
		if(user == null || nowUser == null || user.getMe_id() == null || !user.getMe_id().equals(nowUser.getMe_id())) {
			return null;
		}
		if(user.getMe_pw() == null && user.getMe_pw().trim().length() == 0) {
			return null;
		}
		String pwRegex = "^[a-zA-Z0-9!@#]{8,16}$";
		if(user.getMe_pw() == null || !Pattern.matches(pwRegex, user.getMe_pw())) {
			return null;
		}
		String phoneRegex = "^010([1-9]{1})([0-9]{3})([1-9]{1})([0-9]{3})$";
		if(user.getMe_phone() == null || !Pattern.matches(phoneRegex, user.getMe_phone())) {
			return null;
		}
		if(user.getMe_birth() == 0) {
			return null;
		}
		String emailRegex = "\\w+@\\w+\\.\\w+(\\.\\w+)?";
		if(user.getMe_email() == null || !Pattern.matches(emailRegex, user.getMe_email())) {
			return null;
		}
		String encodePw = passwordEncoder.encode(user.getMe_pw());
		nowUser.setMe_pw(encodePw);
		nowUser.setMe_phone(user.getMe_phone());
		nowUser.setMe_birth(user.getMe_birth());
		nowUser.setMe_gender(user.getMe_gender());
		nowUser.setMe_email(user.getMe_email());
		nowUser.setMe_postnum(user.getMe_postnum());
		nowUser.setMe_add1(user.getMe_add1());
		nowUser.setMe_add2(user.getMe_add2());
		nowUser.setMe_add3(user.getMe_add3());
		nowUser.setMe_add4(user.getMe_add4());
		memberDao.updateMember(nowUser);
		return nowUser;
	}
	@Override
	public MemberVO updateMemberAdmin(MemberVO user, MemberVO admin) {
		if(user == null || admin.getMe_authority() == "USER") {
			return null;
		}
		System.out.println(user);
		memberDao.updateMemberAdmin(user);
		return user;
	}
	@Override
	public String memberOut(MemberVO user, MemberVO nowUser, HttpServletRequest request,HttpServletResponse response) {
		if(user.getMe_pw() == null || nowUser == null)
			return "";
		nowUser.setAgree(user.getAgree());
		if(nowUser.getAgree() == false)
			return "FAIL2";
		if(!passwordEncoder.matches(user.getMe_pw(), nowUser.getMe_pw()))
			return "FAIL";
		boardDao.erase(nowUser.getMe_id());
		cartDao.erase(nowUser.getMe_id());
		orderDao.erase(nowUser.getMe_id());
		memberDao.memberOut(nowUser);
		signout(request ,response);
		return "OK";
	}

	@Override
	public int getTotalCount(MemberVO user, Criteria cri) {
		if(user == null)
			return 0;
		return memberDao.getTotalCount(user.getMe_authority(), cri);
	}

	@Override
	public ArrayList<MemberVO> getMemberList(Criteria cri) {
		return memberDao.getMemberList(cri);
	}

	@Override
	public String findPw(String id) {
		if(id == null) {
			return "FAIL";
		}
		MemberVO user = memberDao.getMember(id);
		if(user == null) {
			return "FAIL";
		}
		String newPw = newRandomPw(8);
		user.setMe_pw(newPw);
		updateMember(user, user);
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom("yme131313@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(user.getMe_email());     // 받는사람 이메일
	        messageHelper.setSubject("새 비밀번호 입니다."); // 메일제목은 생략이 가능하다
	        messageHelper.setText("","새 비밀번호는 <b>" + newPw + "</b>입니다." );  // 메일 내용

	        mailSender.send(message);
	        return "OK";
	    } catch(Exception e){
	        System.out.println(e);
	    }
		return "FAIL";
	}
	private String newRandomPw(int size) {
		//랜덤숫자 : 0~9 =>  문자열 : 0~9
		//랜덤숫자 : 10~35 => 문자열 : a~z
		//랜덤숫자 : 36~61 => 문자열 : A~Z
		String pw="";
		int max = 61;
		int min = 0;
		for(int i=0 ; i < size ; i++) {
			int r = (int)(Math.random()*(max-min+1)) + min;
			if(r < 10) {
				pw += r;
			} else if(r < 36) {
				pw += (char)('a'+(r-10));
			} else {
				pw += (char)('A'+(r-36));
			}
		}	
		return pw;
	}

	@Override
	public MemberVO getMemberAdmin(String me_id) {
		if(me_id == null) 
			return null;
		return memberDao.getMember(me_id);
	}


}
