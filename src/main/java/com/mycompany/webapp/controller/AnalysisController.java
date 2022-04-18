package com.mycompany.webapp.controller;

import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class AnalysisController {
	@RequestMapping("/analysis")
	public String analysis() {
		log.info("실행");
		
		///WEB-INF/views/analysis/analysis.jsp
		return "analysis/analysis";
	}
}
