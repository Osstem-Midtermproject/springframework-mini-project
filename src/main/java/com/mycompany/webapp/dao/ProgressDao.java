package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;

@Mapper
public interface ProgressDao {
	public List<Progress> selectByPager(Pager pager);
}
