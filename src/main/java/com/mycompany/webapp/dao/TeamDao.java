package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Team;

import lombok.extern.log4j.Log4j2;

@Mapper

public interface TeamDao {

	public List<Team> selectTeamSales();
	
	//팀의 카테고리 id를 기반으로 매출 등등의 정보를 가져온다
	public List<Team> selectTeamInformation(String detailTeamId);
	
	//팀의 카테고리 id를 기반으로 점수, 날짜 등의 정보를 가져온다.- jbc
	public List<Team> selectTeamInformationPage();
	
	//팀의 카테고리 상세 페이지에서 사용 될 해당 팀의 상세 스케쥴을 가져온다..- jbc
	public List<Team> selectTeamInformationByTidDetailSchedule(String detailTeamId);
		
	//팀의 카테고리 상세 페이지에서 사용 될 해당 팀의 이름을 가져온다..- jbc
	public List<Team> selectTeamInformationByTidDetailTeamName(String detailTeamId);
	
	//팀 스케쥴 페이지에 상담팀 정보 출력
	public List<Team> selectCounselingTeamInformationc();

	//팀 스케쥴 상세 페이지에서 해당 기간만큼 출력 - jbc
	public List<Team> selectdetailTeamInformationWith(Team team);
	

}
