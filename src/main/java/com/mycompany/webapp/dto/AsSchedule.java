package com.mycompany.webapp.dto;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AsSchedule {
	private int asNo;
	private String asDln;
	private String asAddress;	
	private Date asStartDate;
	private Date asEndDate;
	private String asContent;
	
	Hospital hospital;
}
