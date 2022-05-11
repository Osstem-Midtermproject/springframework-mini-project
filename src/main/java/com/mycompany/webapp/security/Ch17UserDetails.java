package com.mycompany.webapp.security;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.webapp.dto.Users;

public class Ch17UserDetails extends User {
	private Users users;
	
	public Ch17UserDetails(
			String mid, 
			String mpassword,
			List<GrantedAuthority> mauthorities,
			Users users //users dto를 선언한다. 
			) {
			super(mid, mpassword, mauthorities);
			this.users = users;
	
	}
	
	public Users getUsers() {
		return users;
	}	
}

