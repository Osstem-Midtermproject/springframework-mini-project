package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/schedule")
public class ScheduleController {
	@RequestMapping("/calendar")
	public String calendar() {
		log.info("실행");
		return "schedule/calendar";
	}
	
	@RequestMapping("/detailForm")
	public String detailForm() {
		log.info("실행");
		return "schedule/detailForm";
	}
	
	@RequestMapping("/list")
	public String list() {
		log.info("실행");
		return "schedule/list";
	}
	
	@RequestMapping("/team")
	public String team() {
		log.info("실행");
		return "schedule/team";
	}
	
	@RequestMapping("/team/detail")
	public String teamDetail() {
		log.info("실행");
		return "schedule/team_detail";
	}

}
