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
	 
}
