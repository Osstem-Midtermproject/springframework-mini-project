package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Team;
import com.mycompany.webapp.service.CalendarService;
import com.mycompany.webapp.service.TeamService;

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
	
	
	@Resource
	TeamService teamService;
	
	//team page에서 해당 팀을 선택하면 해당 팅믜 화면으로 이동하기 위한 컨트롤러 이다. 파라미터는 팀 ID로 구별한다. 
	   @GetMapping("/team/detail")
	   public String teamDetail(String detailTeamId2, Model model, HttpServletRequest request) {
	      log.info("Location 실행");
	      
	      //url주소의 파라미터를 가져온다. 여기서 가져오는 파라미터는 팀 구별 iD이며 파라미터 명은 tid이다.
	      String detailTeamId = request.getParameter("tid");
	      log.info(detailTeamId);
	      
	      //리스트의 형식으로 가져온다 
		  List<Team> detailTeamInformation = teamService.getTeamInformation(detailTeamId);
	      
			model.addAttribute("detailTeamInformation", detailTeamInformation);
			log.info(detailTeamInformation);
			log.info(model);
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
