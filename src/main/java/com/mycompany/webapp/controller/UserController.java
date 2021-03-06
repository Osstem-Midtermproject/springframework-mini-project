package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.security.Ch17UserDetails;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.HosptialAndCategory;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;
import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.ProgressService;
import com.mycompany.webapp.service.UserService;
import com.mycompany.webapp.service.UserService.LoginResult;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user")
public class UserController {

	@Resource 
	UserService userService;
	
	@Resource 
	ContractService contractService;
	
	@Resource 
	ProgressService progressService;

	//유저 메인 페이지 뜨게
	@RequestMapping("/userHome")
	public String userHome() {
		log.info("실행");
		return "/user/userHome";
	}
	
	//유저 메인 페이지 뜨게
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
	/*@PostMapping("/login")
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
			model.addAttribute("error", "아이디를 확인하세요");
			return "/user/login";
		}else {
			model.addAttribute("error", "패스워드를 확인하세요");
			return "/user/login";
		}
	}*/
	
	//로그아웃 : 성공하면 홈으로 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionUserId");
		return "redirect:/user/userHome";
	}
	
	//세션에 기본적인 정보들을 가져와서 저장하여 시큐리티에서도 동작하게 한다.  - jbc
	//회원 정보 
	@RequestMapping("/userInformation")
	public String userInformation(Authentication authentication,HttpSession session, Model model,Users user) {
		log.info("실행");
		  //사용자 아이디
	      String mid = authentication.getName();
	      user.setUserid(mid); //dto에 id 삽입
	      
	      //기본 정보 외 정보얻기 //이걸 언제 다 설정해주
	      Ch17UserDetails ch17UserDetails = (Ch17UserDetails) authentication.getPrincipal();
	      
	      Users user2 = new Users();
	      user2 = ch17UserDetails.getUsers();
	      user2.setHospital(ch17UserDetails.getUsers().getHospital());
	 
	      session.setAttribute("user", user2);
	     
	      //사용자 권한 얻기(ROLE_xxx)
	      List<String> authorityList = new ArrayList<>();
	      for (GrantedAuthority authority : authentication.getAuthorities()) {
	         authorityList.add(authority.getAuthority());
	      }

	      return "/user/userInformation";
	}

	//진행 내역-------------------------------------------------------------------------
	@RequestMapping("/progressDetail")
	public String progressDetail(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		log.info("실행");
		Users user = (Users)session.getAttribute("user");
		Hospital hospital = user.getHospital();
		String hdln = hospital.getHdln();
		String haddress = hospital.getHaddress();
		
		int totalProgressNum = progressService.getTotalProgressNum(hdln, haddress);
		Pager pager = new Pager(5, 5, totalProgressNum, pageNo);
		pager.setHdln(hdln);
		pager.setHaddress(haddress);
		model.addAttribute("pager", pager);
		
		List<Progress> progressList = progressService.showProgressList(pager);
		log.info(progressList.toString());
		model.addAttribute("hospitalprogressList", progressList);
		log.info(model.getAttribute("hospitalprogressList"));

		return "/user/progressDetail";
	}
	
	//체크박스의 체크된 황목에 따른 리스트 불러오기
	@PostMapping(value = "/checkBox", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String checkBox(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session, @RequestParam(value = "checkArray[]") List<String> allData) {
		
		Users user = (Users)session.getAttribute("user");
		Hospital hospital = user.getHospital();
		String hdln = hospital.getHdln();
		String haddress = hospital.getHaddress();
		
		HosptialAndCategory hac = new HosptialAndCategory();
		hac.setHdln(hdln);
		hac.setHaddress(haddress);
		hac.setCategory(allData);
				
		int totalProgressNum = progressService.getTotalProgressNumByCheckBox(hac);
		log.info(totalProgressNum);
		Pager pager = new Pager(5, 5, totalProgressNum, pageNo);
		pager.setCategory(allData);
		pager.setHdln(hdln);
		pager.setHaddress(haddress);
		model.addAttribute("pager", pager);
		//session.setAttribute("pager", pager);
		
		List<Progress> progressList = progressService.showProgressListByCheckBox(pager);

		log.info(progressList.toString());
		model.addAttribute("hospitalprogressList", progressList);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("hospitalprogressList", progressList);        
		jsonObject.put("p", pager);
		jsonObject.put("startPageNo",pager.getStartPageNo());
		jsonObject.put("endPageNo",pager.getEndPageNo());
		jsonObject.put("pageNo",pager.getPageNo());
		jsonObject.put("totalPageNo",pager.getTotalPageNo());
		jsonObject.put("groupNo",pager.getGroupNo());
		jsonObject.put("totalGroupNo",pager.getTotalGroupNo());
		jsonObject.put("endPageNo",pager.getEndPageNo());
		
		String json = jsonObject.toString();
		log.info(json);
		return json;
	}
	
	//계약 현황 : 계약서 리스트 불러와서 보여주기-----------------------------------------------
	@RequestMapping("/contractsView")
	public String contractsView(HttpSession session) {
		log.info("실행");
		
		Users user = (Users)session.getAttribute("user");
		Hospital hospital = user.getHospital();
		String hdln = hospital.getHdln();
		String haddress = hospital.getHaddress();
		log.info(hdln);
		log.info(haddress);

		List<Contract> contractList = contractService.showContractsView(hdln, haddress);
		session.setAttribute("contractList", contractList);
		
		log.info(contractList.size());
		
		return "/user/contractsView";
	}
	
	//계약서 보기 버튼 클릭하면 계약서 보여줌
	@GetMapping("/contractFormPdf")
	public String contractFormPdf(int fileIndex, HttpSession session, HttpServletRequest request) {
		log.info("실행");
		log.info(fileIndex);

		List<Contract> contractList = (List<Contract>) session.getAttribute("contractList");
		Contract contract = contractList.get(fileIndex);
		
		byte[] pdf = contract.getCont();
		Encoder e = Base64.getEncoder();
		byte[] encodedBytes = e.encode(pdf);
		
		String pdfString = new String(encodedBytes);
		log.info(pdfString);
		
		request.setAttribute("pdfString", pdfString);
		
		return "/element/contractFormPdf";
	}
	

}