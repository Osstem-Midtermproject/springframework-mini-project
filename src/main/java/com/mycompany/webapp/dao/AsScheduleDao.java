package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.AsSchedule;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface AsScheduleDao {
	int selectAsScheduleCount(Pager p);

	List<AsSchedule> selectAsScheduleList(Pager pager);
}
