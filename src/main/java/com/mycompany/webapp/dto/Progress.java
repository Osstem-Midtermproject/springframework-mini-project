package com.mycompany.webapp.dto;

import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
public class Progress {
	private Date pDate;			//날짜
	private String pDln;		//의사면허번호
	private String pAddress;	//주소
	private String pCategory;	//진행카테고리
	private Blob pImage;		//이미지
	private Clob pContent;		//내용
}
