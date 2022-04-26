package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.mycompany.webapp.dao.ManagementDao;
import com.mycompany.webapp.dto.Users;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class managementService {
	
	
	@Resource
	private ManagementDao managementDao;
	
//	public int getTotalBoardNum2() {
//		log.info("test");
//		return  managementDao.count();		
//	}

	public List<Users> getTotalBoardNum() {
		log.info("test");
		return  managementDao.selectByUserId();
		
	}
	
	
}
