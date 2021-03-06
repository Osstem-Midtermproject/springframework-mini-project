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
	 String duration; //버튼을 눌렀을 때 받아올 기간 - jbc
	 int sccount; //이 팀의 모든 스케쥴 개수
	 String month; //원한느 달로 이동하기 위한 월 - jbc
	 String sdate; //달려에서 검색 할 날짜의 시작 -jbc
	 String edate; //달력에서 검색이 종료되는 일 - jbc
	 
	 ConstructionSchedule constructionschedule; //시공 기간을 가져와서 디테일 페이지에 표시한다. - jbc
	 CounselingSchedule counselingSchedule; // jbc
	 
	 
}
