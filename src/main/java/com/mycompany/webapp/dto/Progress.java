package com.mycompany.webapp.dto;

import java.sql.Blob;
import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
public class Progress {
	private Date pdate;			//날짜
	private String pdln;		//의사면허번호
	private String paddress;	//주소
	private String pcategory;	//진행카테고리
	private Blob pimage;		//이미지
	private Clob pcontent;		//내용
}
