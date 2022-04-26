package com.mycompany.webapp.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

@Mapper
public interface ProgressDao {
	//페이지네이션과 함께 list 목록 띄우기
	public List<Progress> selectByPager(Pager pager);
	public int count();
	
	//hdln으로 detail 페이지 들어가기
	public Progress selectByPdln(String pdln);
	
	
	
	
}
