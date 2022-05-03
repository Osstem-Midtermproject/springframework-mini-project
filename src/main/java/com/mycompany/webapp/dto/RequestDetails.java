package com.mycompany.webapp.dto;


import java.sql.Date;

import lombok.Data;

@Data
//요청내역
public class RequestDetails {
	
	String rdDln; 				//의사면허번호
	String rdAddress;			//주소
	int rdState;				//상태(확정/불확정)
	Date rdApplicationdate;		//신청일
	String rdTitle;				//제목
	int rdBudget;				//예산
	int rdFloor;				//건물층
	String rdDesign;			//디자인
	Date rdCounDate;			//상담일
	String rdSpace;				//공간
	Byte[] rdRefeImg;				//참고인테리어(이미지)
	Date rdRequestConsPeriod;	//요청시공기간
	String rdSid;				//진행상황 

}
