package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Contract;

@Mapper
public interface ContractDao {
	
	public List<Contract> selectSales();

}
