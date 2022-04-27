package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.service.CalendarService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/schedule")
public class ScheduleController {
	
	
	@Resource
	CalendarService calendarService;
	
	@GetMapping("/calendar")
	public String calendar(Model model,String id,String start,String end,String content) {
		List<ConstructionSchedule> cs=calendarService.getSchedule();
		model.addAttribute("cs",cs);
		if(id!=null) {
			log.info(id);
			ConstructionSchedule schedule=new ConstructionSchedule();
			schedule.setConsScheId(Integer.parseInt(id));
			schedule.setConsScheStartdate(start);
			schedule.setConsScheEnddate(end);
			schedule.setConsScheContent(content);
			int row=calendarService.updateSchedule(schedule);
		    
		}
		
	
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
	@RequestMapping("/scheduler")
	public String scheduler() {
	
		return "schedule/scheduler";
	}
	@GetMapping("/elec")
	public void elec(String category,Model model) {
		log.info(category);
		model.addAttribute("category",category);
		
	}

}
