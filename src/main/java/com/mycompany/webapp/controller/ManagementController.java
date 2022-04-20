package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ManagementController {
	@RequestMapping("/management")
	public String management() {
		log.info("실행");
		///WEB-INF/views/management/management.jsp
		return "management/management";
	}
}
