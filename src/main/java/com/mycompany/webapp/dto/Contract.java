package com.mycompany.webapp.dto;

import java.sql.Blob;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

//contract (계약서)의 DTO
@Data
public class Contract {
	private int cno;
	private String contIdentificationNumber; //계약서 식별 번호
	private byte[] cont; //계약서(pdf)
	private String contDesignIdentification;//디자인식별번호
	private int contDownPayment; //계약금 
	private Date contDate;//계약일
	private String contDetails; //계약 내용
	private String contArea; //면적
	private String contDln; //의사면허번호
	private String contAddress;	//병원주소
	private String contPeriod; //시공기간
	private int contCompletionStatus; //시공완료여부
	private int contStatus; //계약 여부
	private int contAdditionalAmount; //추가 금액
	
	private Hospital hospital;
	private AdditionalRequest additionalRequest;
	
}
