package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.RequestDetails;

@Mapper
public interface RequestDetailsDao {
	public List<RequestDetails> selectByPager(Pager pager);

	//알림 내역 리스트 페이저
	public int selectNotificationTotalNum(Pager p);
	public List<RequestDetails> selectNotificationList(Pager pager);
	public int updateRdstate(String dln);

	//의사면허번호에 해당하는 요청내역 가져오기
	public RequestDetails selectRD(String dln);

	//dashboard 알림 : 총 알림 수
	public int selectCount();

	//dashboard 알림 : 알림 리스트
	public List<RequestDetails> selectRequestDetailsList();
}
