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
   
   public List<Progress> getProgress(Pager pager) {
      log.info(progressDao);
      return progressDao.selectByPager(pager);
   }

   public int getTotalProgressNum() {
      return progressDao.count();
   }
   
   public List<Progress> getProgressNopaging() {
      return progressDao.selectAll();
   }
   
}