package com.mycompany.webapp.dto;

import java.util.Date;
import lombok.Data;

//hospital 테이블(병원)의 DTO
@Data
public class Hospital {
	
	private String hdln;//의사면허번호
	private String haddress;//주소
	private String hname;//병원명
	private String hdirector;//병원장
	private String hpn;//병원 전화번호
	private Date hod;//병원 개업일(opening day)
	private String hemail;	//병원 이메일
	
	private int hno;
	
	private String Hadress; //임시
	
	//요청내역
	private RequestDetails requestDetails;
	//진행상황
	private Progress progress;
	
}
