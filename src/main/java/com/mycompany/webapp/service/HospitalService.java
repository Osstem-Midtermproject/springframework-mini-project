package com.mycompany.webapp.service;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.mycompany.webapp.dao.HospitalDao;
import com.mycompany.webapp.dto.AdditionalRequest;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.RequestDetails;

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
	
	public Hospital getHospitalContDate(String hdln) {
		return hospitalDao.selectHospitalContDateByHdln(hdln);
	}
	
	//hdln으로 계약서 쪽으로 병원정보 가져오기 계약서의 추가요청을 찾음 
	public List<Hospital> getHospitalArContent(String hdln) {
		return hospitalDao.selectHospitalArContentByHdln(hdln);
	}
	
	//contId로 계약서의 추가요청 찾기
	public List<Hospital> getHospitalArContentByContId(String contId) {
		log.info(hospitalDao.selectHospitalArContentByContId(contId));
		return hospitalDao.selectHospitalArContentByContId(contId);
	}
	
	//추가요청 내용 추가
	public void writeContent(AdditionalRequest additionalRequest) {
		hospitalDao.insert(additionalRequest);
	}
	
	//진행상황 띄우기
	public List<Hospital> getHospitalProgress(String hdln) {
		return hospitalDao.selectProgressByHdln(hdln);
	}
	
	//추가요청 내용 삭제
	public void removeArContent(int arId) {
		hospitalDao.deleteByArId(arId);
	}
	
	//추가요청 내용 수정
	public void updateArContent(AdditionalRequest additionalRequest) {
		hospitalDao.updateByArId(additionalRequest);
	}

	public void updateState(RequestDetails newState) {
		hospitalDao.updateByHdln(newState);
	}

	//지역 병원 목록 전체출력
	public List<Hospital> getLocationHospital(Pager pager) {
		log.info("tlfgod");
		return hospitalDao.selectByLocation(pager); 
	}
	
	//지역 병원 지역별로 출력
	
	public List<Hospital> getLocationHospital2(Pager pager) {
		log.info(pager);
		return hospitalDao.selectByLocation2(pager); 
	}
	
	//지역 병원 지역별로 출력 - jbc
	public int selectByLocationcount(String addfressHospital) {
		log.info(addfressHospital);
		return hospitalDao.selectByLocationcount(addfressHospital); 
	}

}
