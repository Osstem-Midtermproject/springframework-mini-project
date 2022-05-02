package com.mycompany.webapp.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class chatController {

	@GetMapping("/chat")
	public String chat(Model model) {
		
		
		
		
		log.info("==================================");
		
		
		model.addAttribute("userid", "asdf");
		
		return "/chat";
	}
}