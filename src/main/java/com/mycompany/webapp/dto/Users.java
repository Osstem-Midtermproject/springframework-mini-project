package com.mycompany.webapp.dto;

import java.util.Date;

import com.mycompany.webapp.service.UserService.LoginResult;

import lombok.Data;

@Data
public class Users {
	private String userid;
	private String upassword;
	private String uphonenumber;
	private Date umembershipdate;
	private String uname;
	private String urole;
	private String udln;
	private String uaddress;
	private Hospital hospital;
	
	private LoginResult result;
}
