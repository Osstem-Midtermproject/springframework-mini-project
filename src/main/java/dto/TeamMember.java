package dto;

import lombok.Data;

@Data
//팀원
public class TeamMember {
	String tmId;		//팀원식별번호
	String tmTid;		//팀식별번호
	String tmDepart;	//부서(A/B/C)
}
