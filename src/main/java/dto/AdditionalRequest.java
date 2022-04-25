package dto;

import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
//추가요청
public class AdditionalRequest {
	Date arDate;	//날짜와 시간
	int arContId;	//계약식별번호
	Clob arContent;	//내용
	int arAdAmount;	//추가금액
}
