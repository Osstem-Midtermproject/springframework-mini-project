package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.AdditionalRequest;
import com.mycompany.webapp.dto.Contract;
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
	public Hospital selectHospitalContDateByHdln(String hdln);
	
	//hdln으로 계약서 쪽으로 병원정보 가져오기 계약서의 추가요청을 찾음 
	public List<Hospital> selectHospitalArContentByHdln(String hdln);

	//계약서 식별 번호로 추가요청 리스트 띄우기 
	public List<Hospital> selectHospitalArContentByContId(String contId);
	
	//추가요청 내용 추가
	public int insert(AdditionalRequest additionalRequest);
	
	//진행상황 띄우기
	public List<Hospital> selectProgressByHdln(String hdln);
	
	//추가요청 내용 삭제
	public int deleteByArId(int arId);
	
	//추가요청 내용 수정
	public int updateByArId(AdditionalRequest additionalRequests);
}
