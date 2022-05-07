package com.mycompany.webapp.dto;

import java.sql.Blob;
import java.util.List;

import lombok.Data;

//Design 테이블의 DTO
@Data
public class Design {

	private String did; //디지안의 아이디(해당 이름 디자인의 고유 코드)
	private String dname; //디자인 이름
	private String dimg; //해당 디자인의 이미지
	private String dtt; //디자인의 타입(화이트, 블랙, 우드, 기타 등)

}
