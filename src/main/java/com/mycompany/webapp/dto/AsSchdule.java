package com.mycompany.webapp.dto;

import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
public class AsSchdule {
	private String asDln;
	private String asAddress;
	private Date asStartDate;
	private Date asEndDate;
	private Clob asContent;
}
