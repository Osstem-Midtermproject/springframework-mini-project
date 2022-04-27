package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

@Mapper
public interface ProgressDao {
   //페이지네이션 추가한 list
   public List<Progress> selectByPager(Pager pager);
   public int count();
   
   //페이지네이션 없는 list
   //진행상황
   public List<Progress> selectAll();
   
   
}