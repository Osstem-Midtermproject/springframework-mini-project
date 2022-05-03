package com.mycompany.webapp.dto;

import lombok.Data;

//진행상황
@Data
public class Progress {
	   private int pno;
	   private String pdate;		//시작일자
	   private String penddate;		//종료일자
	   private String pdln;			//의사면허번호
	   private String paddress;		//주소
	   private String pcategory;	//진행카테고리
	   private String pcontent;		//내용
	   
	   //이미지
	   private String pimg;
	   
	   //카테고리 필요해서 추가함 (상담/계약/시공/AS)
	   private String category;
	   
	   //연관 관계에 있는 객체(Association)
	   //병원
	   private Hospital hospital;

}
