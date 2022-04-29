package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Mapper

public interface HospitalDao {
	//페이지네이션과 함께 list 목록 띄우기
	public List<Hospital> selectByPager(Pager pager);
	public int count();
	
	//hdln으로 detail 페이지 들어가기
	public Hospital selectByHdln(String pdln);
	
	//hospital location 리스트(주소 별로)
	public List<Hospital> selectByLocation(Pager pager);
	
	//병원 상세 지도 별(지역)에 맞는 병원 리스트 전체 출력
	public List<Hospital> selectByLocation2(String addfressHospital );
	
	
}
