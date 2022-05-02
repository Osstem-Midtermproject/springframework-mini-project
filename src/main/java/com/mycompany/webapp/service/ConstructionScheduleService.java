package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ConstructionScheduleDao;
import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ConstructionScheduleService {
	
	@Resource
	private ConstructionScheduleDao constructionScheduleDao;
	
	public void setConstructionSchedule(ConstructionSchedule constructionSchedule) {
		
		constructionScheduleDao.insertSchedule(constructionSchedule);
	}
	
}
