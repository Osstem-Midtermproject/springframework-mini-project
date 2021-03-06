package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface ConstructionScheduleDao {
	
	public List<ConstructionSchedule> selectAll();
	
    public int updateSchedule(ConstructionSchedule constructionSchedule);
    
    int insertSchedule(ConstructionSchedule constructionSchedule);

    //시공 스케쥴 리스트 페이저(검색 + 체크박스)
	public int selectConstructionScheduleNum(Pager p);
	public List<ConstructionSchedule> selectConstructionSchedule(Pager pager);
	public int updateProgress(ConstructionSchedule constructionSchedule);
	
	public Contract selectConidDln(String address);

	public List<ConstructionSchedule> selectTodayConstructionSchedule();

	public List<ConstructionSchedule> selectTodayConstructionScheduleAll();
	
}
