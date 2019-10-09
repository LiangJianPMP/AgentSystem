package com.csdj.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SysInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (false) {
			response.sendRedirect(request.getContextPath()+"/JSP/erorr.jsp");
			response.sendRedirect(request.getContextPath()+"/JSP/401.jsp");
			return false;
		}else {
			return true;
		}
	}

}
