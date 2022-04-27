package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.HospitalDao;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class HospitalService {
	@Resource
	private HospitalDao hospitalDao;
	
	//리스트 페이지 with 페이징
	public List<Hospital> getHospitals(Pager pager) {
		return hospitalDao.selectByPager(pager);
	}
	
	//리스트 페이지 총 게시물 수
	public int getTotalHospitalNum() {
		return hospitalDao.count();
	}

	/*public Hospital getHospital(String hdln) {
		return hospitalDao.selectByHdln(hdln);
	}*/
	
	//hdln으로 detail 페이지 들어가기
	public Hospital getHospital(String hdln) {
		return hospitalDao.selectHospitalDetailByHdln(hdln);
	}
	
	//hdln으로 진행상태 확인하기
	public Hospital getHospitalState(String hdln) {
		return hospitalDao.selectHospitalStateByHdln(hdln);
	}
	
	public Hospital getHospitalContDate(String hdln, String contIdentificationNumber) {
		return hospitalDao.selectHospitalContDateByHdln(hdln, contIdentificationNumber);
	}
	
}
