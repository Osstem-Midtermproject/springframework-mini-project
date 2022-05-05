package com.mycompany.webapp.dto;

import lombok.Data;

@Data
public class AsSchedule {
	private int asNo;
	private String asDln;
	private String asAddress;	
	private String asStartDate;
	private String asEndDate;
	private String asContent;
	
	Hospital hospital;
}
