package com.mycompany.webapp.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.TeamHistory;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.CounselingScheduleService;
import com.mycompany.webapp.service.HospitalService;
import com.mycompany.webapp.service.TeamHistoryService;

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
	TeamHistoryService teamHistoryService;

	
	@RequestMapping("/dashboard")
	public String dashboard(Model model,HttpSession session,HttpServletRequest request) {
		String userid=(String)session.getAttribute("sessionUserId");	
		model.addAttribute("userid",userid);
		DecimalFormat decFormat = new DecimalFormat("###,###");
		TeamHistory today=contractService.getToday();
		TeamHistory yesterday=contractService.getYesterday();
		double salespercent=Math.round(((double)(today.getTha()-yesterday.getTha())/yesterday.getTha())*100);
		long conpercent=today.getThn()-yesterday.getThn();
		String todaysales=decFormat.format(today.getTha());
		model.addAttribute("todaySales",todaysales);
		model.addAttribute("todayCon",today.getThn());
		model.addAttribute("salespercent",salespercent);
		model.addAttribute("conpercent",conpercent);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
		Date date=new Date();
		List<TeamHistory> history=teamHistoryService.getTeamSales(sdf.format(date)+"-01-01",sdf.format(date)+"-12-31");
		List<Long> yearSales=teamHistoryService.getYearSales();
		List<Contract> designcon=contractService.getMainDesign();
		log.info(history);
		model.addAttribute("history",history);
		model.addAttribute("designcon",designcon);
		model.addAttribute("yearSales",yearSales);
		///WEB-INF/views/dashboard/dashboard.jsp
		return "dashboard/dashboard";
	}
	
	
	
}
