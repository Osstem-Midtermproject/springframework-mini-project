package com.mycompany.webapp.dto;

import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
//상담스케줄
public class CounselingSchedule {
	int counNo;
	int counScheId;
	String counScheStartdate;
	String counScheDln;
	String counScheAddress;
	String counScheContent;
	
	Hospital hospital;
	
	//팀 스케쥴 정보에 보여줄 상담팀의 이번주, 이번달, 오늘 상담 개수 - jbc
	int ctodaywork;
	int cweekwork;
	int cmonthwork;
}
