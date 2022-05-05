package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProgressDao;
import com.mycompany.webapp.dto.HosptialAndCategory;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class ProgressService {
	
	@Resource
	private ProgressDao progressDao;
	
	//페이저로 리스트
	public List<Progress> showProgressList(Pager pager) {		
		return progressDao.selectProgressListByPager(pager);
	}
	//총개수
	public int getTotalProgressNum(String hdln, String haddress) {
		return progressDao.count(hdln, haddress);
	}

	//user : 체크박스
	public int getTotalProgressNumByCheckBox(HosptialAndCategory hac) {
		return progressDao.countByCheckBox(hac);
	}
	//user : 체크박스
	public List<Progress> showProgressListByCheckBox(Pager pager) {
		return progressDao.selectProgressListByCheckBox(pager);
	}

}
