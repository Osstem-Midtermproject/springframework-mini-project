package com.mycompany.webapp.dto;

import java.util.Date;
import lombok.Data;

//hospital 테이블(병원)의 DTO
@Data
public class Hospital {
	
	private String hDln;//의사면허번호
	private String hAddress;//주소
	private String hName;//병원명
	private String hDirector;//병원장
	private String hPn;//병원 전화번호
	private Date hOd;//병원 개업일(opening day)
	private String hEmail;	//병원 이메일
	
}
