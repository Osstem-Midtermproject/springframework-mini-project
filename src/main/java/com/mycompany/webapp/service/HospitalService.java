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
	
	public List<Hospital> getHospitals(Pager pager) {
		return hospitalDao.selectByPager(pager);
	}

	public int getTotalHospitalNum() {
		return hospitalDao.count();
	}

	public Hospital getHospital(String hdln) {
		return hospitalDao.selectByHdln(hdln);
	}
}
