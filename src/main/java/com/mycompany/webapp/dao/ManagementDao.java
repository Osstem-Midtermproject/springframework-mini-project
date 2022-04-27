package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;
import com.mycompany.webapp.dto.Users;

@Mapper
public interface ManagementDao {
	
	public List<Users> selectByUserId(Pager pager);
	public int count();
	public void deleteByHdln(String hdln);
	
}
