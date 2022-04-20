package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user")
public class UserController {
   
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
   
   @RequestMapping("/login")
   public String login() {
      log.info("실행");
      return "/user/login";
   }
   
}