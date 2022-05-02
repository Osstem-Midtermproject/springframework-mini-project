package com.mycompany.webapp.dto;


import java.sql.Date;

import lombok.Data;

@Data
//추가요청
public class AdditionalRequest {
	int arId; 		//추가요청 시퀀스 번호
	Date arDate;		//날짜와 시간
	String arContId;	//계약식별번호
	String arContent;	//내용
	int arAdAmount;	//추가금액
}
