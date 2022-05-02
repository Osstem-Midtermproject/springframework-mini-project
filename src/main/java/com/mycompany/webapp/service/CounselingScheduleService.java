package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CounselingScheduleDao;
import com.mycompany.webapp.dto.CounselingSchedule;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CounselingScheduleService {

	@Resource
	CounselingScheduleDao counselingScheduleDao;
	
	public void setSchedule(CounselingSchedule counselingSchedule) {
		
		counselingScheduleDao.insertCounselingSchedule(counselingSchedule);
	}
	
}
