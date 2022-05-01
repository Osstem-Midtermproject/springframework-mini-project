package com.mycompany.webapp.dao;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.TeamHistory;

import com.mycompany.webapp.dto.ThtidAndStartDateAndEndDate;




	

import com.mycompany.webapp.dto.ThtidAndStartDateAndEndDate;

@Mapper
public interface TeamHistoryDao {
	

	
	public List<TeamHistory> selectTeamHis();
	public void insertTeamHis(TeamHistory teamhistory);
	
	
	
	public List<TeamHistory> selectSales(String param1,String param2);
	
	public List<Long> selectYearSales();
	
	public List<TeamHistory> selectMonthSales(String param1,String param2);

}