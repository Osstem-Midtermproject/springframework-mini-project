package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UserDao;
import com.mycompany.webapp.dto.Users;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class UserService {
	public enum LoginResult {
		SUCCESS, FAIL_MID, FAIL_MPASSWORD
	}
	
	@Resource
	private UserDao userDao;

	public Users login(Users user) {
		Users dbUser = userDao.selectByUserId(user.getUserid());
		
		if(dbUser==null) {
			dbUser.setResult(LoginResult.FAIL_MID);
		}else {
			if(user.getUpassword().equals(dbUser.getUpassword())) {
				dbUser.setResult(LoginResult.SUCCESS);
			}else {
				dbUser.setResult(LoginResult.FAIL_MPASSWORD);
			}
			/*			PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
						String str = passwordEncoder.encode(user.getUpassword());
						
						log.info(str);
			
						if(passwordEncoder.matches(user.getUpassword(), dbUser.getUpassword())) {
							dbUser.setResult(LoginResult.SUCCESS);
						}else {
							dbUser.setResult(LoginResult.FAIL_MPASSWORD);
						}*/
		}
		
		log.info(dbUser);
		return dbUser;
	}
	
	public Users getMember(String userId) {
		return userDao.selectByUserId(userId);
	}
}
