package com.mycompany.webapp.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;
import com.mycompany.webapp.service.ProgressService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/hospital")
@Log4j2
public class HospitalController {
	@Resource
	private ProgressService progressService;

	@GetMapping("/processing")
	public String progressList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
		int totalProgressNum = progressService.getTotalProgressNum();
		Pager pager = new Pager(5, 5, totalProgressNum, pageNo);
		model.addAttribute("pager", pager);
	
		List<Progress> progresses = progressService.getProgresses(pager);
		model.addAttribute("progresses", progresses);
		log.info(model.getAttribute("progresses"));
		return "hospital/processing";
	}

	/*@RequestMapping("/processing/detail")
	public String processingDetail() {
		log.info("실행");
		return "hospital/processing_detail";
	}*/
	
	
	
	@GetMapping("/processing/detail")
	public String processingDetail(String pdln, Date pdate, Model model) {
		Progress progress = progressService.getProgress(pdln);
		model.addAttribute("progress", progress);
		log.info(progress);
		return "hospital/processingDetail";
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
