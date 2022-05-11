package com.mycompany.webapp.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UserDao;
import com.mycompany.webapp.dto.Users;

@Service
public class Ch17UserDetailsService implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(Ch17UserDetailsService.class);
	
	@Resource
	private UserDao userDao;	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		Users user = userDao.selectByUserId(username); 
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(user.getUrole()));
		
		Ch17UserDetails userDetails = new Ch17UserDetails(
				user.getUserid(),
				user.getUpassword(),
				authorities,
				user //usersdetail에서 사용 할 수 있도록 선언
		);
			
		
		return userDetails;
	}
}

