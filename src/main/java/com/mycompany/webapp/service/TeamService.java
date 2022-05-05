package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.TeamDao;
import com.mycompany.webapp.dto.ConstructionSchedule;
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
	
	//team 스케쥴 상세 페이지에서 팀의 id를 통해 해당 팀의 상세 스케쥴을 모두 가져온다. - jbc
		public List<Team> getTeamInformationDetailSchedule(String detailTeamId) {
			// TODO Auto-generated method stub
			log.info(detailTeamId);
			return teamdao.selectTeamInformationByTidDetailSchedule(detailTeamId);
						   
		}
		
		//team 스케쥴 상세 페이지에서 팀의 id를 통해 해당 팀의 이름을 가져온다. - jbc
	public List<Team> getTeamInformationDetailTeamName(String detailTeamId) {
		// TODO Auto-generated method stub
		return teamdao.selectTeamInformationByTidDetailTeamName(detailTeamId);
						   
	}
	
	//team 스케쥴 상세 페이지에서 상담팀의 정보를 가져온다. - jbc
		public List<Team> selectCounselingTeamInformation() {
			// TODO Auto-generated method stub
			return teamdao.selectCounselingTeamInformationc();
							   
		}


	//team 스케쥴 상세페이지에서 버튼을 누르면 해당 버튼의 기간 만큼 값을 출력한다. -jbc
	public List<Team> getLocationHospitalWithDuration(Team team) {
		// TODO Auto-generated method stub
		return teamdao.selectdetailTeamInformationWith(team);
	}


}
