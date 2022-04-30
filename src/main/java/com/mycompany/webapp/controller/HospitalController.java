package com.mycompany.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.service.HospitalService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/hospital")
@Log4j2
public class HospitalController {
   @Resource
	private HospitalService hospitalService;

	@GetMapping("/processing")
	public String progressList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalProgressNum = hospitalService.getTotalHospitalNum();
		Pager pager = new Pager(5, 5, totalProgressNum, pageNo);
		model.addAttribute("pager", pager);
	
		List<Hospital> hospitals = hospitalService.getHospitals(pager);
		model.addAttribute("hospitals", hospitals);
		log.info(model.getAttribute("hospitals"));
		return "hospital/processing";
	}

	@GetMapping("/processing/detail")
	public String processingDetail(String hdln, Model model) {
		Hospital hospital = hospitalService.getHospital(hdln);
		model.addAttribute("hospital", hospital);
		log.info(hospital);
		return "hospital/processingDetail";
	}
	
	@PostMapping("view.do")
	public String getView(String hdln, Model model) {
		Hospital hospital = hospitalService.getHospital(hdln);
		model.addAttribute("progressView", hospital);
		return "view";
	}

   @RequestMapping("/history")
   public String history() {
      log.info("실행");
      return "hospital/history";
   }

   //지도 별, 위치 별 병원 목록 컨트롤 호출 
   @GetMapping("/location")
   public String location(@RequestParam(defaultValue = "1") int locationPageNo, Model model) {
      log.info("Location 실행");
      
        int getTotalLocationNum = hospitalService.getTotalHospitalNum();
		Pager locationPager = new Pager(5, 5, getTotalLocationNum, locationPageNo);
		model.addAttribute("locationPager", locationPager);
		log.info("page");

		
		List<Hospital> locationHospital = hospitalService.getLocationHospital(locationPager);
		model.addAttribute("locationHospital", locationHospital);
		log.info(locationHospital);
		log.info("test");

      return "hospital/location";
   }
   
   //지역 선택시 파라미터 값 처리를 위한 호출  --- //아 시발 페이징 처리 안함. 큰일 났음 
   @GetMapping("/location/detail")
   public String location2(String addressHospital, Model model, HttpServletRequest request, @RequestParam(defaultValue = "1") int locationPageNo) {
      log.info("Location 실행");
      String locationHaddress = request.getParameter("locationHaddress");
      log.info(locationHaddress);
	  List<Hospital> locationHospital = hospitalService.getLocationHospital2(locationHaddress);
      
      //지역별 병원의 개수로 설정
      int getTotalLocationNum = locationHospital.size();
      
		Pager locationPager = new Pager(5, 5, getTotalLocationNum, locationPageNo);
		model.addAttribute("locationPager", locationPager);
		log.info("page");
      
		model.addAttribute("locationHospital", locationHospital);
		log.info(locationHospital);
		log.info("test");
		log.info(model);

      return "hospital/location";
   }
   

   @RequestMapping("/contractHistory")
   public String contractHistory() {
      log.info("실행");
      return "hospital/contract_history";
   }

}
