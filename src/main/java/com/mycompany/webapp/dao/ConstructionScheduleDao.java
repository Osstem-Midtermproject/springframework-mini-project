package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ConstructionSchedule;

@Mapper
public interface ConstructionScheduleDao {
	
	public List<ConstructionSchedule> selectAll();
	
    public int updateSchedule(ConstructionSchedule constructionSchedule);
	
}
