package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface CounselingScheduleDao {
	
	int selectCounselingScheduleCount(Pager p);

	List<CounselingSchedule> selectCounselingScheduleList(Pager pager);
	
	
	void insertCounselingSchedule(CounselingSchedule counselingSchedule);
	
	List<CounselingSchedule> selectCountAll();
	 public void updateSchedule(CounselingSchedule counselingSchedule);
	 public void updateProgress(CounselingSchedule counselingSchedule);
	
}
