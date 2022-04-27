package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TeamDao;
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

}
