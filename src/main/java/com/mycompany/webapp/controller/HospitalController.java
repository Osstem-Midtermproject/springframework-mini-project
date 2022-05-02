package com.mycompany.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.AdditionalRequest;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Users;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.HospitalService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/hospital")
@Log4j2
public class HospitalController {
	@Resource
	private HospitalService hospitalService;

	@Resource
	private ContractService contractService;

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
		List<Hospital> hospitalArContent = hospitalService.getHospitalArContent(hdln);
		log.info("추가요청 띄우기" + hospitalArContent);
		model.addAttribute("hospitalArContent", hospitalArContent);

		String arContId = hospitalContDate.getContract().getContIdentificationNumber();
		List<Hospital> newHospitalArContentDiff = hospitalService.getHospitalArContentByContId(hospitalService.getHospitalContDate(hdln).getContract().getContIdentificationNumber());
		log.info("1번 계약서의 추가요청: " + newHospitalArContentDiff.size());
		
	
		//추가요청 insert
		/*AdditionalRequest additionalRequests = new AdditionalRequest();
		
		additionalRequests.setArContent(arContent);
		additionalRequests.setArContId(arContId);
		
		log.info(additionalRequests);
		
		//추가요청시 값이 있다면 insert문 실행
		if (arContent != null) {
			log.info("arContId : " + arContId);
			hospitalService.writeContent(additionalRequests);
		} */

		//진행상황 띄우기
		List<Hospital> hospitalProgresses = hospitalService.getHospitalProgress(hdln);
		model.addAttribute("hospitalProgresses", hospitalProgresses);
		log.info(model.getAttribute("hospitalProgresses"));

		return "hospital/processingDetail";
	}
	
	@PostMapping(value="processing/arContentInsert", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String arContentInsert(String arContent, String arContId) {
		log.info("실행");
		
		AdditionalRequest additionalRequests = new AdditionalRequest();
		additionalRequests.setArContent(arContent);
		additionalRequests.setArContId(arContId);
		log.info("arContent: " + arContent);
		log.info("arContId: " + arContId);
		
		hospitalService.writeContent(additionalRequests);
	
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("arContent", arContent);
		jsonObject.put("arContId", arContId);
		String json = jsonObject.toString();
		log.info(json);
		
		return json;
	}
	
	@PostMapping(value="processing/details", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String arContentSelect(String contId, String arContent, Model model) {
		log.info("실행");
		log.info("contId: " + contId);
		
		
		//List<Hospital> newHospitalArContentDiff = hospitalService.getHospitalArContentByContId(hospitalService.getHospitalContDate(hdln).getContract().getContIdentificationNumber());
		List<Hospital> newHospitalArContentDiff = hospitalService.getHospitalArContentByContId(contId);
		List<Hospital> newHospitalArContent = hospitalService.getHospitalArContentByContId(contId);
		
		for(int i=0; i<newHospitalArContentDiff.size(); i++) {
			log.info(newHospitalArContentDiff.get(i).getAdditionalRequest().getArContent());
		}
		
		log.info("newHospitalArContent: " + newHospitalArContent);
		log.info("newHospitalArContentDiff" + newHospitalArContentDiff);
	
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("arContId", contId);
		jsonObject.put("arContent", arContent);
		jsonObject.put("arId", newHospitalArContent.get(0).getAdditionalRequest().getArId());
		log.info(jsonObject);
		String json = jsonObject.toString();
		log.info(json);
		
		return json;
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
   


	//hospital/contractHistory : 계약기록 리스트 페이징 -> 초기에 보여질 전체 병원의 계약 기록 리스트
	@RequestMapping("/contractHistory")
	public String contractHistory(Model model, HttpSession session) {
		List<Contract> topContractList = contractService.getTopThreeContract();
		model.addAttribute("topContractList", topContractList);
		log.info(topContractList);
		return "hospital/contractHistory";
	}


	//hospital/contractHistory : 계약기록 리스트 페이징 -> 검색한 병원만 나오게(searchBar)
	@PostMapping(value = "/search", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String search(String searchBar, @RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		log.info(searchBar);

		int totalContractNum = contractService.getTotalContractNumBySearchBar(searchBar);
		log.info(totalContractNum);
		Pager pager = new Pager(5, 5, totalContractNum, pageNo);
		pager.setSearchBar(searchBar);  //searchBar에 입력된 내용을 pager안에 저장해서 쿼리문에서 사용할 예정

		model.addAttribute("searchBar", searchBar);
		model.addAttribute("pager", pager);

		List<Contract> contractList = contractService.showContractListBySearchBar(pager);

		model.addAttribute("searchContractList", contractList);
		log.info(model.getAttribute("searchContractList"));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("searchContractList", contractList);        
		jsonObject.put("startPageNo",pager.getStartPageNo());
		jsonObject.put("endPageNo",pager.getEndPageNo());
		jsonObject.put("pageNo",pager.getPageNo());
		jsonObject.put("totalPageNo",pager.getTotalPageNo());
		jsonObject.put("groupNo",pager.getGroupNo());

		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	//계약서 보기 버튼 클릭하면 계약서 보여줌
	@GetMapping("/contractFormPdfAdmin")
	public String contractFormPdfAdmin(String fileNum, HttpSession session, HttpServletRequest request) {

		Contract c = contractService.getContract(fileNum);
		byte[] pdf = c.getCont();

		Encoder e = Base64.getEncoder();
		byte[] encodedBytes = e.encode(pdf);

		String pdfString = new String(encodedBytes);

		request.setAttribute("pdfString", pdfString);
		return "/element/contractFormPdf";
	}
	

}
