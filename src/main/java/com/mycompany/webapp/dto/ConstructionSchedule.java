package com.mycompany.webapp.dto;

import java.util.Date;

import lombok.Data;
@Data
public class ConstructionSchedule {
	int consNo;
	int consScheId;
	String  consScheTeamId;
	int  consScheContractId;
	String  consScheStartdate;
	String  consScheEnddate;
	String  consScheContent;
	String  consScheCategoryId;
	String  consScheHospitalName;//병원명
	String  consScheDln;
	String  consScheAddress;
	Hospital hospital;
	
	ConstructionCategory constructionCategory;
	Team team;
}
