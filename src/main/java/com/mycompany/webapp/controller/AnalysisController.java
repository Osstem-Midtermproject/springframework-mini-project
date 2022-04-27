package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.service.ContractService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/analysis")
public class AnalysisController {
	
	@Resource
	ContractService contractService;
	
	
	
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
}
