package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.AsScheduleDao;
import com.mycompany.webapp.dto.AsSchedule;
import com.mycompany.webapp.dto.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class AsScheduleService {
	@Resource
	AsScheduleDao asScheduleDao;

	public int getAsScheduleTotalNum(Pager p) {
		return asScheduleDao.selectAsScheduleCount(p);
	}

	public List<AsSchedule> getAsSchedule(Pager pager) {
		return asScheduleDao.selectAsScheduleList(pager);
	}
}
