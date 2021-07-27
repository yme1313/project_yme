package kr.green.springtest.service;

import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
    @Autowired
    private JavaMailSender mailSender;
    
    @Override
	public MemberVO signin(MemberVO user) {
		if(user == null || user.getId() == null || user.getId().trim().length() == 0
			|| user.getPw() ==null || user.getPw().trim().length() == 0)
			return null;
		MemberVO dbUser = memberDao.getMember(user.getId());
		if(dbUser == null)
			return null;
		if(passwordEncoder.matches(user.getPw(), dbUser.getPw())) {
			dbUser.setUseCookie(user.getUseCookie());
			return dbUser;
		}
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

	@Override
	public MemberVO getMember(String id) {
		if(id == null || id.length() ==0) {
			return null;
		}
		return memberDao.getMember(id);
	}

	@Override
	public void keepLogin(String id, String session_id, Date session_limit) {
		memberDao.keepLogin(id, session_id, session_limit);
	}
		
		

	@Override
	public MemberVO checkLoginBefore(String session_id) {
		if(session_id == null) {
			return null;
		}
		return memberDao.getMemberBySessionId(session_id);
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
		user.setPw(newPw);
		updateMember(user, user);
	    try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom("yme131313@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(user.getEmail());     // 받는사람 이메일
	        messageHelper.setSubject("새 비밀번호 입니다."); // 메일제목은 생략이 가능하다
	        messageHelper.setText("","새 비밀번호는 <b>" + newPw + "</b>입니다." );  // 메일 내용

	        mailSender.send(message);
	        return "SUCCESS";
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
			// int r = (int)(Math.random()*62);
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
}



