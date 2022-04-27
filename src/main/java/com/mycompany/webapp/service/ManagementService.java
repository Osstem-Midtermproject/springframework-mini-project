package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ManagementDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Users;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ManagementService {
	
	
	@Resource
	private ManagementDao managementDao;
	
	public int getTotalBoardNum() {
		log.info("test");
		return  managementDao.count();		
	}

	public List<Users> getTotalUserList(Pager pager) {
		log.info("test");
		return  managementDao.selectByUserId(pager);
		
	}
	
	public void deleteUser(String hdln) {
		// TODO Auto-generated method stub
		managementDao.deleteByHdln(hdln);
		
	}
	
	
}
