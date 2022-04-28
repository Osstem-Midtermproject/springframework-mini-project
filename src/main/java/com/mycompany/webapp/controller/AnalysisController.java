package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Contract;
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
	TeamHistoryService teamHistoryServie;
	
	@RequestMapping("/analysis")
	public String analysis(Model model) {
		log.info("실행");
		List<Contract> contract=contractService.getContracts();
		log.info(contract);
		model.addAttribute("contract",contract);
		
		///WEB-INF/views/analysis/analysis.jsp
		return "analysis/analysis";
	}
	@RequestMapping("/hospital")
	public String hospital() {
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
		log.info("실행");
		int n=1;
		for(int i=1; i<=4; i++) {
			
			ThtidAndStartDateAndEndDate tsdA = new ThtidAndStartDateAndEndDate();
			tsdA.setThtid(String.valueOf(n));
			tsdA.setStartDate("2022-01-01");
			tsdA.setEndDate("2022-12-31");
			double sumA = teamHistoryServie.getSumByThdidAndDate(tsdA);
			String name1 = "sumA" +n;
			n++;
			
			ThtidAndStartDateAndEndDate tsdB = new ThtidAndStartDateAndEndDate();
			tsdB.setThtid(String.valueOf(n));
			tsdB.setStartDate("2022-01-01");
			tsdB.setEndDate("2022-12-31");
			double sumB = teamHistoryServie.getSumByThdidAndDate(tsdB);
			String name2 = "sumB" +n;
			n++;
			
			ThtidAndStartDateAndEndDate tsdC = new ThtidAndStartDateAndEndDate();
			tsdC.setThtid(String.valueOf(n));
			tsdC.setStartDate("2022-01-01");
			tsdC.setEndDate("2022-12-31");
			double sumC = teamHistoryServie.getSumByThdidAndDate(tsdC);
			String name3 = "sumC" +n;
			n++;
			
			double sum = sumA + sumB + sumC;
				
			log.info(name1 + ": " + sumA);
			log.info(name2 + ": " + sumB);
			log.info(name3 + ": " + sumC);						
			
			sumA=sumA/sum*100;
			sumB=sumB/sum*100;
			sumC=sumC/sum*100;
			
			log.info(name1 + ": " + sumA);
			log.info(name2 + ": " + sumB);
			log.info(name3 + ": " + sumC);
			
			model.addAttribute(name1, sumA);
			model.addAttribute(name2, sumB);
			model.addAttribute(name3, sumC);
		}

		return "analysis/teamAnalysis";
	}
}
