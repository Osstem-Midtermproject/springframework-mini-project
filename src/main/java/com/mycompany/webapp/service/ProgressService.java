package com.mycompany.webapp.service;

import java.util.Date;
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
	
	public List<Progress> getProgresses(Pager pager) {
		return progressDao.selectByPager(pager);
	}

	public int getTotalProgressNum() {
		return progressDao.count();
	}

	public Progress getProgress(String pdln) {
		return progressDao.selectByPdln(pdln);
	}
}
