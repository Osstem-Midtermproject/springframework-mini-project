package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.CounselingScheduleService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class DashboardController {
	
	@Resource
	ContractService contractService;
	@Resource
	CounselingScheduleService counselingScheduleService;
	@Resource
	ConstructionScheduleService constructionScheduleService;
	
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("실행");
		Contract con=new Contract();
		CounselingSchedule cous=new CounselingSchedule();
		ConstructionSchedule cons=new ConstructionSchedule();
		for(int i=0;i<9;i++) {
			con.setContDesignIdentification("BK50000");
			con.setContDownPayment((int)((Math.random()*100000000)/1000000)*10000000);
			con.setContDate("2022-05-1"+i);
			con.setContDetails("병원 지으러 가자");
			con.setContArea("20평");
			con.setContDln("547938");
			con.setContAddress("서울시 송파구 송파대로 28길 43");
			con.setContPeriod("2년");
			con.setContCompletionStatus(1);
			con.setContStatus(1);
			con.setContAdditionalAmount((int)((Math.random()*100000000)/100000000)*10000000);
			cous.setCounScheStartdate("2022-05-1"+i);
			cous.setCounScheEnddate("2022-05-1"+(i+1));
			cous.setCounScheDln("342573");
			cous.setCounScheAddress("강원 원주시 지정면 신지정로 322 탑프라자 5층 501호 ~ 504호");
			cous.setCounScheContent("시공 ㄱㄱ? ㄴㄴ");
			cons.setConsScheTeamId("1");
			cons.setConsScheContractId(i);
			cons.setConsScheStartdate("2022-05-0"+i);
			cons.setConsScheEnddate("2022-05-0"+(i+1));
			cons.setConsScheContent("다람쥐 키즈 치과 의원 박살내기");
			cons.setConsScheCategoryId("1");
			cons.setConsScheHospitalName("다람쥐키즈치과의원");
			cons.setConsScheDln("342573");
			cons.setConsScheAddress("강원 원주시 지정면 신지정로 322 탑프라자 5층 501호 ~ 504호");
			contractService.setContract(con);
			//counselingScheduleService.setSchedule(cous);
			//constructionScheduleService.setConstructionSchedule(cons);
			
		}
		
		///WEB-INF/views/dashboard/dashboard.jsp
		return "dashboard/dashboard";
	}
	
	
}
