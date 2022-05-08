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
		/*병원정보*/
		Hospital hospital = hospitalService.getHospital(hdln);
		model.addAttribute("hospital", hospital);
		log.info(hospital);

		/*병원 진행 상태*/
		Hospital hospitalState = hospitalService.getHospitalState(hdln);
		model.addAttribute("hospitalState", hospitalState);
		log.info(hospitalState);

		/*현재상태 가져오기 (상담/시공)*/
		Progress progressCategory = hospitalService.getProgressCategory(hdln);
		model.addAttribute("progressCategory", progressCategory);
		log.info(progressCategory);

		/*병원 계약일*/
		Hospital hospitalContDate = hospitalService.getHospitalContDate(hdln);
		model.addAttribute("hospitalContDate", hospitalContDate);
		log.info("계약일: " + hospitalContDate);

		/*병원 계약서보기*/
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

		/*진행상황 띄우기*/
		List<Hospital> hospitalProgresses = hospitalService.getHospitalProgress(hdln);
		log.info(hospitalProgresses);

		for (int i = 0; i < hospitalProgresses.size(); i++) {
			if (hospitalProgresses.get(i).getProgress().getPcategory().equals("1")) {
				hospitalProgresses.get(i).getProgress().setPcategory("전기");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("2")) {
				hospitalProgresses.get(i).getProgress().setPcategory("설비");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("3")) {
				hospitalProgresses.get(i).getProgress().setPcategory("도배");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("4")) {
				hospitalProgresses.get(i).getProgress().setPcategory("가구");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("0")) {
				hospitalProgresses.get(i).getProgress().setPcategory("시공 완료");
			} else if (hospitalProgresses.get(i).getProgress().getPcategory().equals("5")) {
				hospitalProgresses.get(i).getProgress().setPcategory("상담");
			}
		}

		model.addAttribute("hospitalProgresses", hospitalProgresses);
		log.info(model.getAttribute("hospitalProgresses"));
		return "hospital/processingDetail";

	}
	
	/*현재상태 추가 (시공완료)*/
	@PostMapping(value = "processing/updateCategory", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateState(String hdln, String haddress, String pcategory, String category, Model model) {
		log.info("실행");
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

	/*추가요청*/
	//모든 추가요청을 ajax로 불러오기
	@PostMapping(value = "processing/arContentList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getContents(String contId, Model model) {
		log.info("실행");
		log.info("contId: " + contId);

		List<Hospital> newHospitalArContent = hospitalService.getHospitalArContentByContId(contId);
		log.info("모든 추가요청을 ajax로 불러옴" + newHospitalArContent);
		for (int i = 0; i < newHospitalArContent.size(); i++) {
			log.info(i + "번째 추가 요청" + newHospitalArContent.get(i).getAdditionalRequest().getArContent());
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
	@PostMapping(value = "processing/arContentInsert", produces = "application/json; charset=UTF-8")
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
	@PostMapping(value = "processing/arContentDelete", produces = "application/json; charset=UTF-8")
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
	@PostMapping(value = "processing/arContentUpdate", produces = "application/json; charset=UTF-8")
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

	/*진행상황 img 가져오기*/
	//url을 hdln과 haddress(pk가 아님)가 아닌 imgId로 지정하여 파일을 찾기 위해서 ajax로 pimgId를 찾아서 json으로 return 
	@RequestMapping(value = "processing/progressImgList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String progressImgList(String hdln, String haddress, Model model) throws Exception {
		ProgressImg progressImg = new ProgressImg();
		progressImg.setPimgDln(hdln);
		progressImg.setPimgAddress(haddress);

		List<Progress> progressImgList = hospitalService.getProgress(progressImg);
		model.addAttribute("progressImgList", progressImgList);

		ArrayList<HashMap<String, Object>> hmlist = new ArrayList<HashMap<String, Object>>();
		log.info("progress로 프로그레스 이미지 가져오기" + progressImgList.size());

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

	//pimgId로 이미지를 찾아서 response로 return 한다 
	@RequestMapping(value = "/processing/fileList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void fileList(int pimgId, Model model, HttpServletResponse response, @RequestHeader("User-Agent") String userAgent) throws Exception {
		log.info("progressImg 테이블의 pimgId로 찾아내기: ");
		Progress progressImg = hospitalService.getProgressImg(pimgId);
		log.info(progressImg);
		
		model.addAttribute("progressImg", progressImg);
		log.info(model);
		
		String contentType = progressImg.getProgressImg().getPimgType();
		String originalFilename = progressImg.getProgressImg().getPimgOname();
		String saveFilename = progressImg.getProgressImg().getPimgSname();
		
		response.setContentType(contentType);
		
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) { //인터넷 익스플로러 11 || 10 이하
			originalFilename = URLEncoder.encode(originalFilename, "UTF-8");
		} else {
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1"); //직접 바이트 배열을 얻어내고, 얻어낸 것을 다시 ISO-8859-1로 표현한다
		}
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		
		File file = new File("C:/Temp/mid/" + saveFilename);
		if(file.exists()) {
			FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
		}
	}
	
	//파일 업로드 ajax
	@PostMapping(value = "processing/fileupload", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String fileupload(ProgressImg progressImg) throws Exception {
		log.info("실행");
		log.info(progressImg);
		log.info(progressImg.getPimgCategory());
		log.info(progressImg.getPimgContent());
		log.info(progressImg.getPimgDate());
		log.info(progressImg.getPimgHospitalName());

		for (MultipartFile multipartFile : progressImg.getPimgAttach()) {
			log.info(multipartFile.getOriginalFilename());
			log.info(multipartFile.getContentType());

			if (!progressImg.getPimgAttach().isEmpty()) {
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
		log.info("실행");

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();

		return json;
	}
	
	//파일 delete
	@PostMapping(value = "processing/progressImgDeleteBtn", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String progressImgDelet(int pimgId, Model model) {
		hospitalService.removePimgId(pimgId);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();
		log.info(json);

		return json;

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

	//지역 선택시 파라미터 값 처리를 위한 호출
	@GetMapping("/location/detail")
	public String location2(String addressHospital, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int locationPageNo) {
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
	public String search(String searchBar, @RequestParam(defaultValue = "1") int pageNo, Model model,
			HttpSession session) {
		log.info(searchBar);
		int totalContractNum = contractService.getTotalContractNumBySearchBar(searchBar);
		log.info(totalContractNum);
		Pager pager = new Pager(5, 5, totalContractNum, pageNo);
		pager.setSearchBar(searchBar); //searchBar에 입력된 내용을 pager안에 저장해서 쿼리문에서 사용할 예정
		model.addAttribute("searchBar", searchBar);
		model.addAttribute("pager", pager);
		List<Contract> contractList = contractService.showContractListBySearchBar(pager);
		model.addAttribute("searchContractList", contractList);
		log.info(model.getAttribute("searchContractList"));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("searchContractList", contractList);
		jsonObject.put("startPageNo", pager.getStartPageNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());
		jsonObject.put("pageNo", pager.getPageNo());
		jsonObject.put("totalPageNo", pager.getTotalPageNo());
		jsonObject.put("groupNo", pager.getGroupNo());
		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	//계약서 보기 버튼 클릭하면 계약서 보여줌
	@GetMapping("/contractFormPdfAdmin")
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