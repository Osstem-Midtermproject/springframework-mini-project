package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CounselingSchedule;

@Mapper
public interface CounselingScheduleDao {
	
	void insertCounselingSchedule(CounselingSchedule counselingSchedule);
}
