package com.mycompany.webapp.dto;

import lombok.Data;

@Data
//팀
public class Team {
	 String tId;		//팀식별번호
	 int tSales;		//매출
	 float tScore;		//점수
	 String tCategory;	//분류(부서-AS/상담/전기/설비/도배/가구)
}
