package com.mycompany.webapp.dto;

import java.util.List;

import com.mycompany.webapp.controller.UserController;

import lombok.Data;

@Data
public class HosptialAndCategory{
	String hdln;
	String haddress;
	List<String> category;
}
