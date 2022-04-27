package com.mycompany.webapp.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//진행상황
@Data
public class Progress {
   private int pno;
   private Date pdate;         //날짜
   private String pdln;      //의사면허번호
   private String paddress;   //주소
   private String pcategory;   //진행카테고리
   //private Blob pimage;      //이미지
   private String pcontent;   //내용
   
   //이미지
   private String pattachoname;
   private String pattachsname;
   private String pattachtype;
   private MultipartFile pimage;   //이미지
   
   //연관 관계에 있는 객체(Association)
   //병원
   
   private Hospital hospital;
   
   //private List<Hospital> hospital;
}