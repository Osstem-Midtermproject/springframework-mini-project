package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.HosptialAndCategory;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

@Mapper
public interface ProgressDao {

   //페이저로 특정 병원의 진행내역(progress) 리스트 불러오기
   List<Progress> selectProgressListByPager(Pager pager);
   public int count(String hdln, String haddress);
   
   //체크박스로 해당 카테고리의 리스트 불러오기
   int countByCheckBox(HosptialAndCategory hac);
   List<Progress> selectProgressListByCheckBox(Pager pager);
}

