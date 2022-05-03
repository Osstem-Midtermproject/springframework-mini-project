package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.RequestDetailsDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.RequestDetails;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class RequestDetailsService {
	@Resource RequestDetailsDao requestDetailsDao;

	public int getNotificationTotalNum(Pager p) {
		return requestDetailsDao.selectNotificationTotalNum(p);
	}

	public List<RequestDetails> getNotificationList(Pager pager) {
		return requestDetailsDao.selectNotificationList(pager);
	}

	//schedule/notificationList - 확정하기 버튼 눌릴 때 : 요청 내역 테이블의 상태를 확정(0)으로 updates
	public int updateRequestDetails(String dln) {
		return requestDetailsDao.updateRdstate(dln);
	}

	public RequestDetails getRD(String dln) {
		return requestDetailsDao.selectRD(dln);
	}
	
}
