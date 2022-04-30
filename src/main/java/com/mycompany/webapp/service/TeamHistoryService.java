package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TeamHistoryDao;
import com.mycompany.webapp.dto.TeamHistory;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class TeamHistoryService {
	
	@Resource
	TeamHistoryDao teamHistoryDao;
	
	
	public void setTeamHis(TeamHistory teamhistory){
		log.info("실행");
		teamHistoryDao.insertTeamHis(teamhistory);
	}

	
	public List<TeamHistory> getTeamSales(String param1, String param2){
		
		return teamHistoryDao.selectSales(param1, param2);
	}
	public List<Long> getYearSales(){
		
		return teamHistoryDao.selectYearSales();
	}
	public List<TeamHistory> getMonthSales(String param1,String param2){
		
		return teamHistoryDao.selectMonthSales(param1, param2);
	}
}
