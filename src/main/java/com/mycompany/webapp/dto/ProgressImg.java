package com.mycompany.webapp.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProgressImg {
	private int pimgId;				//시퀀스
	private String pimgDln;			//병원번호
	private String pimgOname;		//원래 이름
	private String pimgSname;		//저장이름
	private String pimgType;		//img 타입
	private String pimgContent;		//내용
	private String pimgCategory;		//시공 카테고리		
	private String pimgAddress;			//병원주소
	private Date pimgDate;				//날짜
	private List<MultipartFile> pimgAttach;	//img 파일
	private String pimgHospitalName;	//병원이름
}
