package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.managementService;

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
	
	@RequestMapping("/management/modifymanagement")
	public String modify_management() {
		log.info("실행");

		return "management/modify_management";
	}
	
	   @Resource
	   private managementService managementService;
	   
	   @GetMapping("/management")
	   public String boardList(@RequestParam(defaultValue="1") int pageNo, Model model) {
		  
		   int totalBoardNum = managementService.getTotalBoardNum();
		   Pager pager = new Pager(5, 5, totalBoardNum, pageNo);
		   model.addAttribute("pager", pager);
		   
		   List<Users> boards = managementService.getTotalUserList(pager);
		   model.addAttribute("boards", boards);
		   log.info(boards);
		   log.info("test");
		   
		   return "management/management";
		   
	   }
	   
	   @GetMapping("/management/deletemanagement")
		public String deletemanagement(String hdln) {
			log.info("삭제");
			managementService.deleteUser(hdln);
			///WEB-INF/views/management/management.jsp
			return "redirect:/management";
			
		}
	   
	   //testd
	   
	   
	   
	  
	   

}

