package com.mycompany.webapp.dto;

import java.sql.Blob;

import lombok.Data;

//Design 테이블의 DTO
@Data
public class Design {

	private String dId; //디지안의 아이디(해당 이름 디자인의 고유 코드)
	private String dName; //디자인 이름
	private Blob dImg; //해당 디자인의 이미지
	private String dTt; //디자인의 타입(화이트, 블랙, 우드, 기타 등)
	
}
