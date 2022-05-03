package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.CounselingScheduleService;

import com.mycompany.webapp.service.HospitalService;


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

	
	@RequestMapping("/dashboard")
	public String dashboard(Model model,HttpSession session,HttpServletRequest request) {
		String userid=(String)session.getAttribute("sessionUserId");
		
		model.addAttribute("userid",userid);
		///WEB-INF/views/dashboard/dashboard.jsp
		return "dashboard/dashboard";
	}
	
	
	
}
