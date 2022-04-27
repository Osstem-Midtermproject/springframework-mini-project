package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
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

   @RequestMapping("/location")
   public String location() {
      log.info("실행");
      return "hospital/location";
   }

   @RequestMapping("/contractHistory")
   public String contractHistory() {
      log.info("실행");
      return "hospital/contract_history";
   }

}
