package dto;

import java.sql.Clob;
import java.util.Date;

import lombok.Data;

@Data
public class AsSchdule {
	private String AsDln;
	private String AsAddress;
	private Date AsStartDate;
	private Date AsEndDate;
	private Clob AsContent;
}
