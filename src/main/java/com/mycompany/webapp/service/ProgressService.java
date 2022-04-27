package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProgressDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class ProgressService {
	
	@Resource
	private ProgressDao progressDao;
	
	public List<Progress> showProgressList(Pager pager) {		
		return progressDao.selectProgressListByPager(pager);
	}
	
	public int getTotalProgressNum(String hdln, String haddress) {
		return progressDao.count(hdln, haddress);
	}

}
