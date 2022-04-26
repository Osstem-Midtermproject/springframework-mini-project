package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Progress;
import com.mycompany.webapp.dto.Users;

@Mapper
public interface ManagementDao {
	
	public List<Users> selectByUserId();
	//public int count();
	//public Users selectByUserId();
}
