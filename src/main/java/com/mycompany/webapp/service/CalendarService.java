package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ConstructionScheduleDao;
import com.mycompany.webapp.dto.ConstructionSchedule;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CalendarService {
	
	@Resource
	ConstructionScheduleDao constructionScheduleDao;
	
	
	  public List<ConstructionSchedule> getSchedule() {
	  
		  return constructionScheduleDao.selectAll();
	  }
	  public int  updateSchedule(ConstructionSchedule constructionSchedule) {
		  
		  return constructionScheduleDao.updateSchedule(constructionSchedule);
	  }
	 
	
}
