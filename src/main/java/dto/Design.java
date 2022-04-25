package dto;

import java.sql.Blob;

import lombok.Data;

//Design 테이블의 DTO
@Data
public class Design {

	private String Did; //디지안의 아이디(해당 이름 디자인의 고유 코드)
	private String DName; //디자인 이름
	private Blob DImg; //해당 디자인의 이미지
	private String DTt; //디자인의 타입(화이트, 블랙, 우드, 기타 등)
	
}
