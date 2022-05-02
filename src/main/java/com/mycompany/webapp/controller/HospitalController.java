package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

		//추가요청 띄우기
		/*List<Hospital> hospitalArContent = hospitalService.getHospitalArContent(hdln);
		log.info("추가요청 띄우기" + hospitalArContent);
		model.addAttribute("hospitalArContent", hospitalArContent);*/
		
		//진행상황 띄우기
		List<Hospital> hospitalProgresses = hospitalService.getHospitalProgress(hdln);
	
		log.info(hospitalProgresses);
	
		model.addAttribute("hospitalProgresses", hospitalProgresses);
		log.info(model.getAttribute("hospitalProgresses"));

		return "hospital/processingDetail";
	}
	
	//모든 추가요청을 ajax로 불러오기
	@PostMapping(value="processing/arContentList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getContents(String contId, Model model) {
		log.info("실행");
		log.info("contId: " + contId);
		
		List<Hospital> newHospitalArContent = hospitalService.getHospitalArContentByContId(contId);
		log.info("모든 추가요청을 ajax로 불러옴" + newHospitalArContent);

		for(int i=0; i<newHospitalArContent.size(); i++) {
			log.info(i + "번쨰 추가 요청" + newHospitalArContent.get(i).getAdditionalRequest().getArContent());
		}
		
		
		ArrayList<HashMap<String, Object>> hmlist = new ArrayList<HashMap<String, Object>>();
		
		if(newHospitalArContent.size() > 0){
            for(int i=0; i<newHospitalArContent.size(); i++){
                HashMap<String, Object> hm = new HashMap<String, Object>();
                hm.put("arId", newHospitalArContent.get(i).getAdditionalRequest().getArId());
                hm.put("arContent", newHospitalArContent.get(i).getAdditionalRequest().getArContent());
                hmlist.add(hm);
            }
            
        }
        
        JSONArray jsonArray = new JSONArray(hmlist);        
		String json = jsonArray.toString();
		log.info(json);
		
		return json;
	}
	
	//insert
	@PostMapping(value="processing/arContentInsert", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String arContentInsert(String arContent, String arContId) {
		log.info("실행");
		
		AdditionalRequest additionalRequest = new AdditionalRequest();
		additionalRequest.setArContent(arContent);
		additionalRequest.setArContId(arContId);
		log.info("arContent: " + arContent);
		log.info("arContId: " + arContId);
		
		hospitalService.writeContent(additionalRequest);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("arContent", arContent);
		jsonObject.put("arContId", arContId);
		String json = jsonObject.toString();
		log.info(json);
		
		return json;
	}

	//delete
	@PostMapping(value="processing/arContentDelete", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String deleteContent(int arId, Model model) {
		hospitalService.removeArContent(arId);	
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		log.info(json);
		
		return json;
	
	}
	
	//update
	@PostMapping(value="processing/arContentUpdate", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateContent(int arId, String newArContent, Model model) {
		log.info("실행");
		AdditionalRequest newAdditionalRequest = new AdditionalRequest();
		newAdditionalRequest.setArId(arId);
		newAdditionalRequest.setArContent(newArContent);
		
		log.info(arId);
		log.info(newArContent);
		
		log.info("arContentUpdate" + "{arId: " + arId + ", newArContent: " + newArContent + "}");
		
		hospitalService.updateArContent(newAdditionalRequest);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("arId", arId);
		jsonObject.put("arContent", newArContent);
		String json = jsonObject.toString();
		
		return json;
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
