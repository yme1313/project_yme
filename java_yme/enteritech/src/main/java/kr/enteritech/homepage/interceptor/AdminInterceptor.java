package kr.enteritech.homepage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.enteritech.homepage.service.MemberService;
import kr.enteritech.homepage.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Autowired
	MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();	
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null || user.getMe_authority().equals("USER")) {
			response.sendRedirect(request.getContextPath() +"/");
			return false;
		}
		return true;
	}
}
