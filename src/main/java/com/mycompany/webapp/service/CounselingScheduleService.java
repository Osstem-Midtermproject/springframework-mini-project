package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CounselingScheduleDao;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CounselingScheduleService {

	@Resource
	CounselingScheduleDao counselingScheduleDao;
	
	public void setSchedule(CounselingSchedule counselingSchedule) {
		
		counselingScheduleDao.insertCounselingSchedule(counselingSchedule);
	}
	
	public int getCounselingScheduleTotalNum(Pager p) {
		return counselingScheduleDao.selectCounselingScheduleCount(p);
	}

	public List<CounselingSchedule> getCounselingSchedule(Pager pager) {
		return counselingScheduleDao.selectCounselingScheduleList(pager);
	}

	
}
