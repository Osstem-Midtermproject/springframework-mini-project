package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;

@Data
//팀
public class Team {
	 String tid;		//팀식별번호
	 int tsales;		//매출
	 float tscore;		//점수
	 String tcategory;	//분류(부서-AS/상담/전기/설비/도배/가구)
	 Date tdate; //팀의 일자
	 int thn; //계약 순서 rownum의 역활
	 
	 int tmonthWork; //팀 목록에 보여질 해당 팀의 이번달 작업 예정 건수 -jbc
	 int tweekWork; //팀 목록에 보여질 해당 팀의 이번주 작업 예정 건수 - jbc
	 String tnowWork; //팀 목록에 보여질 해당 팀의 현재 작업 진행 여부(작업 중 or 휴게)
	 
	 ConstructionSchedule constructionschedule; //시공 기간을 가져와서 디테일 페이지에 표시한다. - jbc
	 CounselingSchedule counselingSchedule; // jbc
	 
}
