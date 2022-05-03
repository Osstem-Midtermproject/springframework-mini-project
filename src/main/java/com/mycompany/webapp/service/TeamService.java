package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TeamDao;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Team;

import lombok.extern.log4j.Log4j2;
@Service
@Log4j2
public class TeamService {
	
	
	@Resource
	TeamDao teamdao;
	
	public List<Team> getTeams(){
		
		return teamdao.selectTeamSales();
	}


	public List<Team> getTeamInformation(String detailTeamId) {
		// TODO Auto-generated method stub
		log.info(detailTeamId);
		return teamdao.selectTeamInformation(detailTeamId);
					   
	}
	
	//team 스케쥴 페이지에서 팀의 id를 통해 일자, 점수 등의 정보를 가져온다 - jbc
	public List<Team> getTeamInformationSchedule() {
		// TODO Auto-generated method stub
		return teamdao.selectTeamInformationPage();
					   
	}

}
