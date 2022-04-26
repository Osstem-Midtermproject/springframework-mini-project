package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	private String userId;
	private String upassword;
	private String uphoneNumber;
	private Date umembershipDate;
	private String uname;
	private String urole;
	private String udln;
	private String uaddress;
	private Hospital hospital;
}
