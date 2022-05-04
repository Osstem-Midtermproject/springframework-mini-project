package com.mycompany.webapp.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface CounselingScheduleDao {
	
	int selectCounselingScheduleCount(Pager p);

	List<CounselingSchedule> selectCounselingScheduleList(Pager pager);
	
	
	void insertCounselingSchedule(CounselingSchedule counselingSchedule);

	//dashboard - counseling schedule : 1초마다 반복ㅙ서 리스트 가져오기
	List<CounselingSchedule> selectTodayCounselingSchedule();

}
