package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.webapp.dao.ConstructionScheduleDao;
import com.mycompany.webapp.dao.CounselingScheduleDao;
import com.mycompany.webapp.dao.ProgressDao;
import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.Progress;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CalendarService {
	
	@Resource
	ConstructionScheduleDao constructionScheduleDao;
	@Resource
	ProgressDao progressDao;
	@Resource
	CounselingScheduleDao counselingScheduleDao;
	  public List<ConstructionSchedule> getSchedule() {
	  
		  return constructionScheduleDao.selectAll();
	  }
	  public int  updateSchedule(ConstructionSchedule constructionSchedule) {
		  
		  return constructionScheduleDao.updateSchedule(constructionSchedule);
	  }
	  @Transactional 
	 public void  updateCalTransaction(ConstructionSchedule schedule)  {
		 int row=constructionScheduleDao.updateSchedule(schedule);	
		 if(row==0) {
			
		 }
		 int row2= constructionScheduleDao.updateProgress(schedule);
		
		  if(row2==0) {
			 
		  }
		  log.info(row);
		  log.info(row2);
	 }
	 @Transactional
	 public void insertCalTransaction(ConstructionSchedule schedule,Progress progress) {
			  
		 Contract con=constructionScheduleDao.selectConidDln(schedule.getConsScheAddress());
		 if(con==null) {
			 log.info(1);
		 }
		 schedule.setConsScheContractId(con.getContIdentificationNumber());
		 schedule.setConsScheDln(con.getContDln());
		 progress.setPdln(con.getContDln());
		 int row=constructionScheduleDao.insertSchedule(schedule);
		 if(row==0) {
			 log.info(2);
		 }
		 int row2=progressDao.insertProgress(progress);
		 if(row2==0) {
			 log.info(3);
		 }
	  }
	 @Transactional 
	 public void  updateConCalTransaction(CounselingSchedule schedule)  {
		 Contract con=constructionScheduleDao.selectConidDln(schedule.getCounScheAddress());
		 if(con==null) {
			 log.info("에러"+1);
		 }
		 schedule.setCounScheDln(con.getContDln());
		 int row=counselingScheduleDao.updateSchedule(schedule);
		 if(row==0) {
			 log.info("에러"+2);
		 }
		 int row2= counselingScheduleDao.updateProgress(schedule);
		
		  if(row2==0) {
			  log.info("에러"+3);
		  }
		  log.info(row);
		  log.info(row2);
	 }
	 @Transactional
	 public void insertConCalTransaction(CounselingSchedule schedule,Progress progress) {
			  
		 Contract con=constructionScheduleDao.selectConidDln(schedule.getCounScheAddress());
		 if(con==null) {
			 log.info(1);
		 }
		 schedule.setCounScheDln(con.getContDln());
		 progress.setPdln(con.getContDln());
		 int row= counselingScheduleDao.insertCounselingSchedule(schedule);
		 if(row==0) {
			 log.info(2);
		 }
		 int row2=progressDao.insertProgressconsult(progress);
		 if(row2==0) {
			 log.info(3);
		 }
	  }
	
}
