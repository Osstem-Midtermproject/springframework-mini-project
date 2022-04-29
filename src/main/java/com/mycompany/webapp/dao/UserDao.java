package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dto.Users;

import lombok.extern.log4j.Log4j2;


@Mapper
public interface UserDao {
	public Users selectByUserId(String userid);
	
}
