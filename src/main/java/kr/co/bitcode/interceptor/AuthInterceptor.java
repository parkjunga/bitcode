package kr.co.bitcode.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.bitcode.repository.domain.User;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User member = (User)session.getAttribute("user");
		if (member != null) {
			return true;
		}
		response.sendRedirect(request.getContextPath()+"/login/loginForm.do");
		return false;
		}
	}
