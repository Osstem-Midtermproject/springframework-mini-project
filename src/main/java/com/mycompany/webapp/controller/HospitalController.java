package com.mycompany.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.AdditionalRequest;
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;
import com.mycompany.webapp.dto.ProgressImg;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.HospitalService;

import lombok.extern.log4j.Log4j2;

@Controller
/*@RequestMapping("/schedule")*/
@Log4j2
public class HospitalController {
	@Resource
	private HospitalService hospitalService;

	@Resource
	private ContractService contractService;

	/*	@GetMapping("/processing")
		public String progressList(@RequestParam(defaultValue = "1") int pageNo, Model model) {
			int totalProgressNum = hospitalService.getTotalHospitalNum();
			Pager pager = new Pager(5, 5, totalProgressNum, pageNo);
			model.addAttribute("pager", pager);
			List<Hospital> hospitals = hospitalService.getHospitals(pager);
			model.addAttribute("hospitals", hospitals);
			log.info(model.getAttribute("hospitals"));
			return "hospital/processing";
		}*/

	@GetMapping("/schedule/processing/detail")
	public String processingDetail(String hdln, String arContent, Model model) {
		/*????????????*/
		Hospital hospital = hospitalService.getHospital(hdln);
		model.addAttribute("hospital", hospital);
		log.info(hospital);

		/*???????????? ???????????? (??????/??????)*/
		Progress progressCategory = hospitalService.getProgressCategory(hdln);
		model.addAttribute("progressCategory", progressCategory);
		log.info(progressCategory);

		/*?????? ?????????*/
		Hospital hospitalContDate = hospitalService.getHospitalContDate(hdln);
		model.addAttribute("hospitalContDate", hospitalContDate);
		log.info("?????????: " + hospitalContDate);

		/*?????? ???????????????*/
		String contId = hospitalContDate.getContract().getContIdentificationNumber();
		byte[] cont = hospitalContDate.getContract().getCont();

		log.info("/processing/detail/contId: " + contId);
		log.info("/processing/detail/cont: " + cont);

		if (cont != null) {
			Contract contractPdf = contractService.getContract(contId);
			model.addAttribute("contractPdf", contractPdf);
		} else {
			model.addAttribute("contractPdf", "");
		}

		/*???????????? ?????????*/
		List<Hospital> hospitalProgresses = hospitalService.getHospitalProgress(hdln);
		log.info(hospitalProgresses);

		for (int i = 0; i < hospitalProgresses.size(); i++) {
			if (hospitalProgresses.get(i).getProgress().getPcategory().equals("1")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("2")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("3")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("4")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("0")) {
				hospitalProgresses.get(i).getProgress().setPcategory("?????? ??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("5")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			}
		}

		model.addAttribute("hospitalProgresses", hospitalProgresses);
		log.info(model.getAttribute("hospitalProgresses"));
		return "hospital/processingDetail";

	}
	
	/*???????????? ?????? (????????????)*/
	@PostMapping(value = "/schedule/processing/updateCategory", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateState(String hdln, String haddress, String pcategory, String category, Model model) {
		log.info("??????");
		log.info(hdln);
		log.info(haddress);
		log.info(pcategory);
		log.info(category);

		Progress newCateory = new Progress();

		newCateory.setPdln(hdln);
		newCateory.setPaddress(haddress);
		newCateory.setPcategory(pcategory);
		newCateory.setCategory(category);

		hospitalService.insertCategory(newCateory);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("category", category);
		String json = jsonObject.toString();

		return json;
	}

	/*????????????*/
	//?????? ??????????????? ajax??? ????????????
	@PostMapping(value = "/schedule/processing/arContentList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getContents(String contId, Model model) {
		log.info("??????");
		log.info("contId: " + contId);

		List<Hospital> newHospitalArContent = hospitalService.getHospitalArContentByContId(contId);
		log.info("?????? ??????????????? ajax??? ?????????" + newHospitalArContent);
		for (int i = 0; i < newHospitalArContent.size(); i++) {
			log.info(i + "?????? ?????? ??????" + newHospitalArContent.get(i).getAdditionalRequest().getArContent());
		}

		ArrayList<HashMap<String, Object>> hmlist = new ArrayList<HashMap<String, Object>>();

		if (newHospitalArContent.size() > 0) {
			for (int i = 0; i < newHospitalArContent.size(); i++) {
				HashMap<String, Object> hm = new HashMap<String, Object>();
				hm.put("arId", newHospitalArContent.get(i).getAdditionalRequest().getArId());
				hm.put("arContent", newHospitalArContent.get(i).getAdditionalRequest().getArContent());
				hm.put("arDate", newHospitalArContent.get(i).getAdditionalRequest().getArDate());
				hmlist.add(hm);
			}

		}

		JSONArray jsonArray = new JSONArray(hmlist);
		String json = jsonArray.toString();
		log.info(json);

		return json;
	}

	//insert
	@PostMapping(value = "/schedule/processing/arContentInsert", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String arContentInsert(String arContent, String arContId) {
		log.info("??????");

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
	@PostMapping(value = "/schedule/processing/arContentDelete", produces = "application/json; charset=UTF-8")
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
	@PostMapping(value = "/schedule/processing/arContentUpdate", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateContent(int arId, String newArContent, Model model) {
		log.info("??????");
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

	/*???????????? img ????????????*/
	//url??? hdln??? haddress(pk??? ??????)??? ?????? imgId??? ???????????? ????????? ?????? ????????? ajax??? pimgId??? ????????? json?????? return 
	@RequestMapping(value = "/schedule/processing/progressImgList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String progressImgList(String hdln, String haddress, Model model) throws Exception {
		ProgressImg progressImg = new ProgressImg();
		progressImg.setPimgDln(hdln);
		progressImg.setPimgAddress(haddress);

		List<Progress> progressImgList = hospitalService.getProgress(progressImg);
		model.addAttribute("progressImgList", progressImgList);

		ArrayList<HashMap<String, Object>> hmlist = new ArrayList<HashMap<String, Object>>();
		log.info("progress??? ??????????????? ????????? ????????????" + progressImgList.size());

		if (progressImgList.size() > 0) {
			for (int i = 0; i < progressImgList.size(); i++) {
				HashMap<String, Object> hm = new HashMap<String, Object>();
				hm.put("pimgId", progressImgList.get(i).getProgressImg().getPimgId());
				hm.put("pimgContent", progressImgList.get(i).getProgressImg().getPimgContent());
				hm.put("pimgCategory", progressImgList.get(i).getProgressImg().getPimgCategory());
				hm.put("pimgOname", progressImgList.get(i).getProgressImg().getPimgOname());
				hm.put("pimgSname", progressImgList.get(i).getProgressImg().getPimgSname());
				hm.put("pimgType", progressImgList.get(i).getProgressImg().getPimgType());
				hm.put("pimgDate", progressImgList.get(i).getProgressImg().getPimgDate());
				hm.put("pimgRegistrationDate", progressImgList.get(i).getProgressImg().getPimgRegistrationDate());

				hmlist.add(hm);
			}
		}
		JSONArray jsonArray = new JSONArray(hmlist);
		String json = jsonArray.toString();
		log.info(json);

		return json;
	}

	//pimgId??? ???????????? ????????? response??? return ?????? 
	@RequestMapping(value = "/schedule/processing/fileList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void fileList(int pimgId, Model model, HttpServletResponse response, @RequestHeader("User-Agent") String userAgent) throws Exception {
		log.info("progressImg ???????????? pimgId??? ????????????: ");
		Progress progressImg = hospitalService.getProgressImg(pimgId);
		log.info(progressImg);
		
		model.addAttribute("progressImg", progressImg);
		log.info(model);
		
		String contentType = progressImg.getProgressImg().getPimgType();
		String originalFilename = progressImg.getProgressImg().getPimgOname();
		String saveFilename = progressImg.getProgressImg().getPimgSname();
		
		response.setContentType(contentType);
		
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) { //????????? ??????????????? 11 || 10 ??????
			originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		} else {
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1"); //?????? ????????? ????????? ????????????, ????????? ?????? ?????? ISO-8859-1??? ????????????
		}
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		
		File file = new File("C:/Temp/mid/" + saveFilename);
		if(file.exists()) {
			FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
		}
	}
	
	//?????? ????????? ajax
	@PostMapping(value = "/schedule/processing/fileupload", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String fileupload(ProgressImg progressImg) throws Exception {
		log.info("??????");
		log.info(progressImg);
		log.info(progressImg.getPimgCategory());
		log.info(progressImg.getPimgContent());
		log.info(progressImg.getPimgDate());
		log.info(progressImg.getPimgHospitalName());
		
		List<Hospital> hospitalProgresses = hospitalService.getHospitalProgress(progressImg.getPimgDln());
		
		boolean progressImgCategoryCheck = false;
		for (int i=0; i<hospitalProgresses.size(); i++) {
			if (hospitalProgresses.get(i).getProgress().getPcategory().equals("1")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("2")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("3")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("4")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("0")) {
				hospitalProgresses.get(i).getProgress().setPcategory("?????? ??????");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("5")) {
				hospitalProgresses.get(i).getProgress().setPcategory("??????");
			}
			
			log.info(hospitalProgresses.get(i).getProgress().getPcategory());
			if(hospitalProgresses.get(i).getProgress().getPcategory().equals(progressImg.getPimgCategory())) {
				progressImgCategoryCheck = true;
			}
		}
		
		log.info(progressImgCategoryCheck);

		for (MultipartFile multipartFile : progressImg.getPimgAttach()) {
			log.info(multipartFile.getOriginalFilename());
			log.info(multipartFile.getContentType());
			
			if (!progressImg.getPimgAttach().isEmpty() && progressImgCategoryCheck) {
				progressImg.setPimgOname(multipartFile.getOriginalFilename());
				progressImg.setPimgType(multipartFile.getContentType());
				progressImg.setPimgSname(new Date().getTime() + "_" + progressImg.getPimgHospitalName() + "_"
						+ progressImg.getPimgCategory() + "_" + multipartFile.getOriginalFilename());
				File file = new File("C:/Temp/mid/" + progressImg.getPimgSname());
				multipartFile.transferTo(file);

				log.info(progressImg);
				hospitalService.writeImg(progressImg);
			}
		}
		log.info("??????");

		JSONObject jsonObject = new JSONObject();
		if (progressImgCategoryCheck == true) {
			jsonObject.put("result", "success");
		} else {
			jsonObject.put("result", "fail");
		}
		String json = jsonObject.toString();

		return json;
	}
	
	//?????? delete
	@PostMapping(value = "/schedule/processing/progressImgDeleteBtn", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String progressImgDelet(int pimgId, Model model) {
		hospitalService.removePimgId(pimgId);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		log.info(json);

		return json;

	}
	
	//?????? ???, ?????? ??? ?????? ?????? ????????? ??????  - jbc
	@GetMapping("/hospital/location")
	public String location(@RequestParam(defaultValue = "1") int PageNo, Model model) {
		log.info("Location ??????");

		int getTotalLocationNum = hospitalService.getTotalHospitalNum();
		Pager locationPager = new Pager(5, 5, getTotalLocationNum, PageNo);
		model.addAttribute("locationPager", locationPager);
		log.info(locationPager);

		List<Hospital> locationHospital = hospitalService.getLocationHospital(locationPager);
		model.addAttribute("locationHospital", locationHospital);
		log.info(locationHospital);
		log.info("test");
		
      return "hospital/location";
   }
    
   //???????????? ????????? ?????? ajax -jbc
	@PostMapping(value = "/hospital/mapimage", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String changemap(String location, String locationKR, Model model,  HttpServletRequest request, @RequestParam(defaultValue = "1") int pageNo) {
		log.info(location);
		log.info(locationKR);
		String locationHaddress = locationKR;
		
		int totalLocationNum = hospitalService.selectByLocationcount(locationHaddress);
		log.info(totalLocationNum);
		
		Pager pager = new Pager(5, 5, totalLocationNum, pageNo);
		pager.setLocationHaddress(locationHaddress); //????????? ?????? ?????? ????????? ???????????? ????????? ?????? ??????
		model.addAttribute("locationHaddress", locationHaddress);
		model.addAttribute("pager", pager);
		
		log.info("test");
		
		List<Hospital> detailLocationList = hospitalService.getLocationHospital2(pager);
		model.addAttribute("detailLocationList", detailLocationList);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("detailLocationList", detailLocationList);        
		jsonObject.put("startPageNo",pager.getStartPageNo());
		jsonObject.put("endPageNo",pager.getEndPageNo());
		jsonObject.put("pageNo",pager.getPageNo());
		jsonObject.put("totalPageNo",pager.getTotalPageNo());
		jsonObject.put("groupNo",pager.getGroupNo());
		
		String json = jsonObject.toString();
		log.info(json);
		return json;
   	}

	//hospital/contractHistory : ???????????? ????????? ????????? -> ????????? ????????? ?????? ????????? ?????? ?????? ?????????
	@RequestMapping("/hospital/contractHistory")
	public String contractHistory(Model model, HttpSession session) {
		List<Contract> topContractList = contractService.getTopThreeContract();
		model.addAttribute("topContractList", topContractList);
		log.info(topContractList);
		return "hospital/contractHistory";
	}

	//hospital/contractHistory : ???????????? ????????? ????????? -> ????????? ????????? ?????????(searchBar)
	@PostMapping(value = "/hospital/search", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String search(String searchBar, @RequestParam(defaultValue = "1") int pageNo, Model model, HttpSession session) {
		log.info(searchBar);
		int totalContractNum = contractService.getTotalContractNumBySearchBar(searchBar);
		log.info(totalContractNum);
		Pager pager = new Pager(5, 5, totalContractNum, pageNo);
		pager.setSearchBar(searchBar);  //searchBar??? ????????? ????????? pager?????? ???????????? ??????????????? ????????? ??????
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

		jsonObject.put("totalGroupNo",pager.getTotalGroupNo());
		jsonObject.put("endPageNo",pager.getEndPageNo());
		
		String json = jsonObject.toString();
		log.info(json);
		return json;
	}
	
	//????????? ?????? ?????? ???????????? ????????? ?????????
	@GetMapping("/hospital/contractFormPdfAdmin")
	public String contractFormPdfAdmin(String fileNum, HttpSession session, HttpServletRequest request, Model model) {
		Contract contract = contractService.getContract(fileNum);
		byte[] pdf = contract.getCont();
		Encoder e = Base64.getEncoder();
		byte[] encodedBytes = e.encode(pdf);
		String pdfString = new String(encodedBytes);
		request.setAttribute("pdfString", pdfString);
		return "/element/contractFormPdf";
	}

}