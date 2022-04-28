package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.TeamHistory;
import com.mycompany.webapp.dto.ThtidAndStartDateAndEndDate;

@Mapper
public interface TeamHistoryDao {
	
	public void insertTeamHis(TeamHistory teamhistory);
	
	public List<TeamHistory> selectTeamHis();
	
	public long selectTeamSalesByTeamId(ThtidAndStartDateAndEndDate tsd);
}
