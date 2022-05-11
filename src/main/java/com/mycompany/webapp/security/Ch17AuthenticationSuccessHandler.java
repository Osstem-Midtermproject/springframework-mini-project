package com.mycompany.webapp.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j2;

/*
SimpleUrlAuthenticationSuccessHandler
	로그인 성공후에 무조건 defaultTartUrl으로 이동
SavedRequestAwareAuthenticationSuccessHandler
	로그인 성공후에 사용자가 접근하고자 했던 페이지로 이동
*/

@Log4j2
//public class Ch17AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler  {
public class Ch17AuthenticationSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(Ch17AuthenticationSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(
		HttpServletRequest request, 
		HttpServletResponse response,
		Authentication authentication) throws IOException, ServletException {
	
		//super.onAuthenticationSuccess(request, response, authentication);
	
		//사용자 권한 얻기(ROLE_xxx)
		List<String> authorityList = new ArrayList<>();
		for (GrantedAuthority authority : authentication.getAuthorities()) {
			authorityList.add(authority.getAuthority());
		}
	  
		//로그인 한 권한에 따라 접속시 보이는 경로를 다르게 한다. 
		if(authorityList.contains("ROLE_ADMIN")) {
			response.sendRedirect("/springframework-mini-project/dashboard");
			return;
		}
		
		//로그인한 사람이 user일 때 
		if(authorityList.contains("ROLE_USER")) {
			response.sendRedirect("/springframework-mini-project/user/userHome");
			return;
		}
		
		response.sendRedirect("/");
	      
	}
}
