package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Team;

@Mapper
public interface TeamDao {

	public List<Team> selectTeamSales();
}