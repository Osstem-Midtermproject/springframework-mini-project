package com.mycompany.webapp.dto;

import lombok.Data;


//시공카테고리
@Data
public class ConstructionCategory {
	String consCateId;		//시공카테고리 식별 코드
	String consCateType;	//분류(전기/설비/도배/가구)
}
