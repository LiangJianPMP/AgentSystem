package com.csdj.servlet;



import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SysInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = Logger.getLogger(SysInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
	/*	User user = (User)request.getSession().getAttribute("user_session");
		logger.debug("------------------------->方法进入了");
		logger.debug("SysInterceptor preHandle ==========================");
		if (null==user) {
			response.sendRedirect(request.getContextPath()+"/Jsp/401.jsp");
			return false;
		}*/
		return true;
	}
}
