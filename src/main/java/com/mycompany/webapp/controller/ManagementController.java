package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.ManagementService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class ManagementController {
	@RequestMapping("/management")
	public String Management() {
		log.info("실행");
		///WEB-INF/views/Management/Management.jsp
		return "management/management";
	}
	
	@RequestMapping("/management/modifymanagement")
	public String modify_Management() {
		log.info("실행");
		///WEB-INF/views/Management/Management.jsp
		return "management/modify_management";
	}
	

	   @Resource
	   private ManagementService ManagementService;
	   
	   @GetMapping("/management")
	   public String boardList(@RequestParam(defaultValue="1") int pageNo, Model model) {
		  
		   int totalBoardNum = ManagementService.getTotalBoardNum();
		   Pager pager = new Pager(5, 5, totalBoardNum, pageNo);
		   model.addAttribute("pager", pager);
		   
		   List<Users> boards = ManagementService.getTotalUserList(pager);
		   model.addAttribute("boards", boards);
		   log.info(boards);
		   log.info("test");
		   
		   return "management/management";
		   
	   }
	   
	   @GetMapping("/management/deletemanagement")
		public String deleteManagement(String hdln) {
			log.info("삭제");
			ManagementService.deleteUser(hdln);
			///WEB-INF/views/Management/Management.jsp
			return "redirect:/management";
			
		}
	   
	   //testd
}
