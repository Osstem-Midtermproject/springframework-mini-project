package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Contract;

import com.mycompany.webapp.dto.TeamHistory;

import com.mycompany.webapp.dto.ThtidAndStartDateAndEndDate;

import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.TeamHistoryService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/analysis")
public class AnalysisController {

	@Resource
	ContractService contractService;

	@Resource
	TeamHistoryService teamHistoryService;


	@RequestMapping("/analysis")
	public String analysis(Model model) {

		log.info("실행");
		List<Contract> contract=contractService.getContracts();

		List<Long> yearSales=teamHistoryService.getYearSales();
		model.addAttribute("contract",contract);
		model.addAttribute("yearSales",yearSales);
		log.info(yearSales);
		///WEB-INF/views/analysis/analysis.jsp
		return "analysis/analysis";
	}
	@PostMapping(value="/yearajax", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String yearAnalysisajax(String sdate,String edate) {
		List<String> day=new ArrayList();
		List<Long> amount=new ArrayList();
		List<TeamHistory> sales=teamHistoryService.getMonthSales(sdate, edate);
		for(int i=0;i<sales.size();i++) {
			day.add(sales.get(i).getThd());
			amount.add(sales.get(i).getTha());
			
		}
		log.info(sales);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("day",day);
		jsonObject.put("amount",amount);
		String json = jsonObject.toString();
		log.info(json);
		return json;

	}
	@RequestMapping("/hospital")
	public String hospital(Model model) {
		log.info("실행");
		


		///WEB-INF/views/analysis/hospital.jsp
		return "analysis/hospital";
	}

	@RequestMapping("/design")
	public String design() {
		log.info("실행");

		///WEB-INF/views/analysis/design.jsp
		return "analysis/design";
	}


	@RequestMapping("/teamAnalysis")
	public String teamAnalysis(Model model) {
		List<TeamHistory> sales=teamHistoryService.getTeamSales("2022-01-01","2022-12-31");
		log.info(sales);
		model.addAttribute("sales",sales);
		///WEB-INF/views/analysis/design.jsp
		return "analysis/teamAnalysis";
	}

	@PostMapping(value="/teamajax", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String teamAnalysisajax(String sdate,String edate) {
		log.info("실행");
		log.info(sdate);
		log.info(edate);		
		List<TeamHistory> sales=teamHistoryService.getTeamSales(sdate,edate);
		log.info(sales);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("sales",sales );
		String json = jsonObject.toString();
		log.info(json);
		return json;

	}
	
}
