package com.mycompany.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.AdditionalRequest;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
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
	public String processingDetail(String hdln, String arContent, Model model) {
		//병원정보
		Hospital hospital = hospitalService.getHospital(hdln);
		model.addAttribute("hospital", hospital);
		log.info(hospital);
		
		//병원 진행 상태
		Hospital hospitalState = hospitalService.getHospitalState(hdln);
		model.addAttribute("hospitalState", hospitalState);
		log.info(hospitalState);
		
		//병원 계약일
		Hospital hospitalContDate = hospitalService.getHospitalContDate(hdln);
		model.addAttribute("hospitalContDate", hospitalContDate);
		log.info("계약일: " + hospitalContDate);
		
		//추가요청
		List<Hospital> hospitalArContent = hospitalService.getHospitalArContent(hdln);
		model.addAttribute("hospitalArContent", hospitalArContent);
		String arContId = hospitalArContent.get(0).getContract().getContIdentificationNumber();

		//추가요청 insert
		AdditionalRequest additionalRequests = new AdditionalRequest();
		additionalRequests.setArContent(arContent);
		additionalRequests.setArContId(arContId);
		log.info("additionalRequests.getArContId(): " + additionalRequests.getArContId());
		
		//추가요청시 값이 있다면 insert문 실행
		if (arContent != null) {
			log.info("arContId : " + arContId);
			hospitalService.writeContent(additionalRequests);
		}
		
		//진행상황 띄우기
		List<Hospital> hospitalProgresses = hospitalService.getHospitalProgress(hdln);
		model.addAttribute("hospitalProgresses", hospitalProgresses);
		log.info(model.getAttribute("hospitalProgresses"));

		return "hospital/processingDetail";
	}
	
	@GetMapping("processing/arContentDelete")
	public String arContentDelete(int arId) {
		hospitalService.removeArContent(arId);
		log.info(arId);
		return "/hospital/processingDetail";
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
