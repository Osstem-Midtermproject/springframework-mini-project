package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/hospital")
@Log4j2
public class HospitalController {
	@RequestMapping("/processing")
	public String processing() {
		log.info("실행");
		return "hospital/processing";
	}
	
	@RequestMapping("/processing/detail")
	public String processingDetail() {
		log.info("실행");
		return "hospital/processing_detail";
	}
	
	@RequestMapping("/history")
	public String history() {
		log.info("실행");
		return "hospital/history";
	}
	
	@RequestMapping("/location")
	public String location() {
		log.info("실행");
		return "hospital/location";
	}
	
	@RequestMapping("/contractHistory")
	public String contractHistory() {
		log.info("실행");
		return "hospital/contract_history";
	}
	
}
