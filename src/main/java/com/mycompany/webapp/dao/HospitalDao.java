package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface HospitalDao {
	//페이지네이션과 함께 list 목록 띄우기
	public List<Hospital> selectByPager(Pager pager);
	public int count();
	
	//hdln으로 detail 페이지 들어가기
	public Hospital selectByHdln(String hdln);
	public Hospital selectHospitalDetailByHdln(String hdln);
	
	//hdln으로 진행상태 확인하기
	public Hospital selectHospitalStateByHdln(String hdln);
	
	//hdln과 contIdentificationNumber 으로 계약일 가져오기
	public Hospital selectHospitalContDateByHdln(String hdln, String contIdentificationNumber);
	
	
}
