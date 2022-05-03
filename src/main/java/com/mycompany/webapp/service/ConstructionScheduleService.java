package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ConstructionScheduleDao;
import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ConstructionScheduleService {
	
	@Resource
	private ConstructionScheduleDao constructionScheduleDao;
	
	public void setConstructionSchedule(ConstructionSchedule constructionSchedule) {
		
		constructionScheduleDao.insertSchedule(constructionSchedule);
	}
	
    //시공 스케쥴 리스트 페이저(검색 + 체크박스)
	public int getTotalNum(Pager p) {
		return constructionScheduleDao.selectConstructionScheduleNum(p);
	}
	public List<ConstructionSchedule> getConstructionSchedule(Pager pager) {
		return constructionScheduleDao.selectConstructionSchedule(pager);
	}
	
}
