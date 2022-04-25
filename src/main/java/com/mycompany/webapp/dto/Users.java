package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	private String userId;
	private String uPassword;
	private String uPhoneNumber;
	private Date uMembershipDate;
	private String uName;
	private String uRole;
	private String uDln;
	private String uAddress;
}
