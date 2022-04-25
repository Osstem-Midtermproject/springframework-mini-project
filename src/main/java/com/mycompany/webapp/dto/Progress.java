package com.mycompany.webapp.dto;

import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
public class Progress {
	private Date pDate;
	private String pDln;
	private String pAddress;
	private String pCategory;
	private Blob pImage;
	private Clob pContent;
}
