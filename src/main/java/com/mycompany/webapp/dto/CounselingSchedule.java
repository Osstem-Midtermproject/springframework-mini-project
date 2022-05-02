package com.mycompany.webapp.dto;

import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
//상담스케줄
public class CounselingSchedule {
	int counScheId;
	String counScheStartdate;
	String counScheEnddate;
	String counScheDln;
	String counScheAddress;
	String counScheContent;
}
