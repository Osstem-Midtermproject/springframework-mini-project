package com.mycompany.webapp.controller;

import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

   
   //hospital/contractHistory : 계약기록 리스트 페이징 -> 초기에 보여질 전체 병원의 계약 기록 리스트
   @RequestMapping("/contractHistory")
   public String contractHistory(@RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
      log.info("실행");
      
		int totalContractNum = contractService.getTotalContractNum();
		Pager pager = new Pager(5, 5, totalContractNum, pageNo);
		model.addAttribute("pager", pager);
		
		List<Contract> contractList = contractService.showContractList(pager);
		log.info(contractList.toString());
		model.addAttribute("contractList", contractList);
		log.info(model.getAttribute("contractList"));
      
      return "hospital/contract_history";
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
	public String contractFormPdfAdmin(byte[] file, HttpSession session, HttpServletRequest request) {

		log.info(file);
		Encoder e = Base64.getEncoder();
		byte[] encodedBytes = e.encode(file);
		log.info(encodedBytes);
		
		String pdfString = new String(encodedBytes);
		log.info("pdf: " + pdfString);
		
		request.setAttribute("pdfString", pdfString);
		return "/element/contractFormPdf";
	}

}
