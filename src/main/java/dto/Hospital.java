package dto;

import java.util.Date;
import lombok.Data;

//hospital 테이블(병원)의 DTO
@Data
public class Hospital {
	
	private String HDln;//의사면허번호
	private String HAddress;//주소
	private String HName;//병원명
	private String HDirector;//병원장
	private String HPn;//병원 전화번호
	private Date HOd;//병원 개업일(opening day)
	private String HEmail;	//병원 이메일
	
}
