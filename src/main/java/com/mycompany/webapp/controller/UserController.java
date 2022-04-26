package com.mycompany.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.UserService.LoginResult;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user")
public class UserController {

	@Resource 
	UserService userService;

	@RequestMapping("/userHome")
	public String userHome() {
		log.info("실행");
		return "/user/userHome";
	}
	@RequestMapping("/")
	public String user() {
		log.info("실행");
		return "/user/userHome";
	}

	//로그인창 뜨게
	@RequestMapping("/login")
	public String login() {
		log.info("실행");
		return "/user/login";
	}

	//로그인 버튼 눌렀을 때 : user이면 userHome으로, admin이면 dashborad로 페이지 넘어감
	@PostMapping("/login")
	public String login(Users user, HttpSession session, Model model) {
		
		log.info(user.getUserid());
		log.info(user.getUpassword());
		
		Users dbUser = userService.login(user);
		
		if(dbUser.getResult() == LoginResult.SUCCESS) {
			log.info("로그인 성공");
			session.setAttribute("sessionUserId", user.getUserid());
			session.setAttribute("user", dbUser);
			if(dbUser.getUrole().equals("ROLE_USER")) {
				return "redirect:/user/userHome";				
			}else {
				return "redirect:/dashboard";
			}
		}else if(dbUser.getResult() ==LoginResult.FAIL_MID) {
			model.addAttribute("error", "아이디가 존재하지 않습니다");
			return "/user/login";
		}else {
			model.addAttribute("error", "패스워드가 틀립니다");
			return "/user/login";
		}
	}
	
	//로그아웃 : 성공하면 홈으로 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionUserId");
		return "redirect:/user/userHome";
	}
	
	
	@RequestMapping("/userInformation")
	public String userInformation() {

		log.info("실행");
		return "/user/userInformation";
	}

	@RequestMapping("/contractsView")
	public String contractsView() {
		log.info("실행");
		return "/user/contractsView";
	}

	@RequestMapping("/progressDetail")
	public String progressDetail() {
		log.info("실행");
		return "/user/progressDetail";
	}
	
	@GetMapping("/contractForm")
	public String contractForm() {
		return "/element/contractForm";
	}

	@GetMapping("/contractFormPdf")
	public String contractFormPdf() {
		log.info("실행");
		return "/element/contractFormPdf";
	}
	

}