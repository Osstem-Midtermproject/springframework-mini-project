package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Team;

import lombok.extern.log4j.Log4j2;

@Mapper

public interface TeamDao {

	public List<Team> selectTeamSales();
	
	//팀의 카테고리 id를 기반으로 매출 등등의 정보를 가져온다
	public List<Team> selectTeamInformation(String detailTeamId);
}
