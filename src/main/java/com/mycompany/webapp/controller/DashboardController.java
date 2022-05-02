package com.mycompany.webapp.controller;

import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.HospitalService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class DashboardController {
	@Resource private HospitalService hospitalService;
	
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("실행");
		
		///WEB-INF/views/dashboard/dashboard.jsp
		return "dashboard/dashboard";
	}
	
	
	
}
