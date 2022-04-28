package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TeamHistoryDao;
import com.mycompany.webapp.dto.TeamHistory;
import com.mycompany.webapp.dto.ThtidAndStartDateAndEndDate;

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
	public List<TeamHistory> getTeamHis(){
		
		return teamHistoryDao.selectTeamHis();
	}
	
	public long getSumByThdidAndDate(ThtidAndStartDateAndEndDate tsd) {
		return teamHistoryDao.selectTeamSalesByTeamId(tsd);
	}
}
