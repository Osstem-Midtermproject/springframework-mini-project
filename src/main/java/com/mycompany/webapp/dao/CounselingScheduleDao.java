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
	
	
	int insertCounselingSchedule(CounselingSchedule counselingSchedule);
	
	List<CounselingSchedule> selectCountAll();
	 public int updateSchedule(CounselingSchedule counselingSchedule);
	 public int updateProgress(CounselingSchedule counselingSchedule);
	
}
