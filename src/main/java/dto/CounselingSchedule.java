package dto;

import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
//상담스케줄
public class CounselingSchedule {
	int counScheId;
	Date counScheStartdate;
	Date counScheEnddate;
	String counScheDln;
	String counScheAddress;
	Clob counScheContent;
}
