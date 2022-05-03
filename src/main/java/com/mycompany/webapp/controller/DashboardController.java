package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.RequestDetails;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.CounselingScheduleService;
import com.mycompany.webapp.service.HospitalService;
import com.mycompany.webapp.service.RequestDetailsService;

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

	@Resource private HospitalService hospitalService;
	
	@Resource
	RequestDetailsService requestDetailsService;

	
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("실행");
		Contract con=new Contract();
		CounselingSchedule cous=new CounselingSchedule();
		ConstructionSchedule cons=new ConstructionSchedule();
		
		
		///WEB-INF/views/dashboard/dashboard.jsp
		return "dashboard/dashboard";
	}
	
	//schedule/constructionList : 체크박스가 클릭되거나 또는 서치박스의 검색 버튼이 눌릴 때 호출되는
	@PostMapping(value = "dashNotification", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String dashNotification(Model model) {

		int totalCount = requestDetailsService.getCount();
		List<RequestDetails> requestDetailsList = requestDetailsService.getrequestDetailsList();
		model.addAttribute("requestDetailsList", requestDetailsList);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("totalCount", totalCount);
		jsonObject.put("requestDetailsList", requestDetailsList);

		String json = jsonObject.toString();
		return json;

	}
	
}
