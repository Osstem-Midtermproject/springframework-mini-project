package com.mycompany.webapp.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.*;
import com.mycompany.webapp.security.Ch17UserDetails;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.CounselingScheduleService;
import com.mycompany.webapp.service.HospitalService;
import com.mycompany.webapp.service.RequestDetailsService;
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
	RequestDetailsService requestDetailsService;
	
	@Resource
	TeamHistoryService teamHistoryService;

	
	@RequestMapping("/dashboard")
	public String dashboard(Model model,HttpSession session,HttpServletRequest request, Users users, Authentication authentication) {
		
		//session에 security 유저 정보 저장 - jbc
		Ch17UserDetails ch17UserDetails = (Ch17UserDetails) authentication.getPrincipal();
      	Users user2 = new Users();
      	user2 = ch17UserDetails.getUsers();
      	user2.setHospital(ch17UserDetails.getUsers().getHospital());
        session.setAttribute("user", user2);
	
		String userid=(String)session.getAttribute("sessionUserId");	
		log.info("Client IP: " + request.getRemoteAddr());
		model.addAttribute("userid",userid);
		DecimalFormat decFormat = new DecimalFormat("###,###");
		TeamHistory today=contractService.getToday();
		TeamHistory yesterday=contractService.getYesterday();
		double salespercent=Math.round(((double)(today.getTha()-yesterday.getTha())/yesterday.getTha())*100);
		long conpercent=today.getThn()-yesterday.getThn();
		//String todaysales=decFormat.format(today.getTha());
		model.addAttribute("todaySales",today.getTha());
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
		
		List<RequestDetails> requestDetailsList = requestDetailsService.getrequestDetailsList();
		model.addAttribute("requestDetailsList", requestDetailsList);
		
		///WEB-INF/views/dashboard/dashboard.jsp
		return "dashboard/dashboard";
	}
	
	//dashboard - new notification : 1초마다 반복
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
	
	//dashboard - counseling schedule : 1초마다 반복
	@PostMapping(value = "dashCounselingList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String dashCounselingList(Model model) {

		List<CounselingSchedule> counselingScheduleList = counselingScheduleService.getTodayCounselingSchedule();
		model.addAttribute("counselingScheduleList", counselingScheduleList);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("counselingScheduleList", counselingScheduleList);

		String json = jsonObject.toString();
		return json;
	}
	
	//dashboard - construction schedule : 1초마다 반복
	@PostMapping(value = "dashConstructionList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String dashConstructionList(Model model) {

		List<ConstructionSchedule> constructionScheduleList = constructionScheduleService.getTodayConstructionSchedule();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("constructionScheduleList", constructionScheduleList);

		String json = jsonObject.toString();
		return json;
	}
	
	//dashboard - construction schedule : 전체보기 버튼 눌릴 때
	@PostMapping(value = "allConstruction", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String allConstruction(Model model) {

		List<ConstructionSchedule> constructionScheduleList = constructionScheduleService.getTodayConstructionScheduleAll();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("constructionScheduleList", constructionScheduleList);

		String json = jsonObject.toString();
		return json;
	}
}
