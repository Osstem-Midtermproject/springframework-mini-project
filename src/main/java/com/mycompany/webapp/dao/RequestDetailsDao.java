package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.RequestDetails;

@Mapper
public interface RequestDetailsDao {
	public List<RequestDetails> selectByPager(Pager pager);
}
