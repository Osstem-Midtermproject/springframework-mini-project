package com.mycompany.webapp.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.AsSchedule;
import com.mycompany.webapp.dto.ConstructionSchedule;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.RequestDetails;
import com.mycompany.webapp.dto.Team;
import com.mycompany.webapp.service.AsScheduleService;
import com.mycompany.webapp.service.CalendarService;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.CounselingScheduleService;
import com.mycompany.webapp.service.HospitalService;
import com.mycompany.webapp.service.RequestDetailsService;
import com.mycompany.webapp.service.TeamService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/schedule")
public class ScheduleController {
	@Resource
	CalendarService calendarService;

	@Resource
	HospitalService hospitalService;

	@Resource
	ConstructionScheduleService consturctionScheduleService;

	@Resource
	CounselingScheduleService counselingScheduleService;
	
	@Resource
	AsScheduleService asScheduleService;
	
	@Resource 
	RequestDetailsService requestDetailsService;

	@GetMapping("/calendar")
	public String calendar(Model model,String id,String start,String end,String content) {
		List<ConstructionSchedule> cs=calendarService.getSchedule();
		model.addAttribute("cs",cs);
		if(id!=null) {
			log.info(id);
			ConstructionSchedule schedule=new ConstructionSchedule();
			schedule.setConsScheId(Integer.parseInt(id));
			schedule.setConsScheStartdate(start);
			schedule.setConsScheEnddate(end);
			schedule.setConsScheContent(content);
			int row=calendarService.updateSchedule(schedule);

		}


		return "schedule/calendar";
	}

	@RequestMapping("/detailForm")
	public String detailForm() {
		log.info("실행");
		return "schedule/detailForm";
	}

	@RequestMapping("/list")
	public String list() {
		log.info("실행");
		return "schedule/list";
	}

	@Resource
	TeamService teamService;
	
	//동일한 정보를 가져오게 되므로 아래의 teamService와 동일한 코드를 지니게 된다. -jBC
		@RequestMapping("/team")
		public String team(Model model) {
			log.info("실행");
			
			//리스트의 형식으로 가져온다 
			List<Team> detailTeamInformationPage = teamService.getTeamInformationSchedule();
			
			model.addAttribute("detailTeamInformationPage", detailTeamInformationPage);
			log.info(detailTeamInformationPage);
			log.info(model);
					
			return "schedule/team";
		}

	//team page에서 해당 팀을 선택하면 해당 팅믜 화면으로 이동하기 위한 컨트롤러 이다. 파라미터는 팀 ID로 구별한다. 
	@GetMapping("/team/detail")
	public String teamDetail(String detailTeamId2, Model model, HttpServletRequest request) {
		log.info("Location 실행");

		//url주소의 파라미터를 가져온다. 여기서 가져오는 파라미터는 팀 구별 iD이며 파라미터 명은 tid이다.
		String detailTeamId = request.getParameter("tid");
		log.info(detailTeamId);

		//리스트의 형식으로 가져온다 
		List<Team> detailTeamInformation = teamService.getTeamInformation(detailTeamId);

		model.addAttribute("detailTeamInformation", detailTeamInformation);
		log.info(detailTeamInformation);
		log.info(model);
		return "schedule/team_detail";
	}





	@RequestMapping("/scheduler")
	public String scheduler() {

		return "schedule/scheduler";
	}
	@GetMapping("/elec")
	public void elec(String category,Model model) {
		log.info(category);
		model.addAttribute("category",category);

	}


	//상담 & AS 스케줄 리스트 페이지
	@GetMapping("/counselingAndAsList")
	public String counselingAndAsList() {
		return "schedule/counselingAndAsList";
	}

	//시공 스케줄 리스트 페이지
	@GetMapping("/constructionList")
	public String constructionList(@RequestParam(defaultValue = "1") int pageNo, Model model) {

		int totalProgressNum = hospitalService.getTotalHospitalNum();
		Pager pager = new Pager(5, 5, totalProgressNum, pageNo);
		model.addAttribute("pager", pager);

		List<Hospital> hospitals = hospitalService.getHospitals(pager);
		model.addAttribute("hospitals", hospitals);
		log.info(model.getAttribute("hospitals"));

		return "schedule/constructionList";
	}

	//schedule/constructionList : 체크박스가 클릭되거나 또는 서치박스의 검색 버튼이 눌릴 때 호출되는
	@PostMapping(value = "selectList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectList(@RequestParam(value = "checkArray[]") List<String> allData, String searchBar, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		log.info("실행");
		
		log.info(allData);
		log.info(searchBar);

		Pager p = new Pager(5, 5, 5, 5);
		p.setConsturctionCategory(allData);
		p.setSearchBar(searchBar);

		int totalNum = consturctionScheduleService.getTotalNum(p);
		Pager pager = new Pager(10, 5, totalNum, pageNo);
		pager.setConsturctionCategory(allData);
		pager.setSearchBar(searchBar);

		model.addAttribute("pager", pager);

		List<ConstructionSchedule> constructionScheduleList = consturctionScheduleService.getConstructionSchedule(pager);
		model.addAttribute("constructionScheduleList", constructionScheduleList);
		log.info(model.getAttribute("constructionScheduleList"));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("constructionScheduleList", constructionScheduleList);        
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

	//병원 세부 페이지로 넘어가는
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

	//schedule/counselingAndAsList : 상담 스케줄 리스트 불러오기
	@PostMapping(value = "selectScheduleList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectScheduleList(String searchBar, String sdate1, String edate1, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		log.info(searchBar);

		Pager p = new Pager(5, 5, 5, 5);
		p.setSdate(sdate1);
		p.setEdate(edate1);
		p.setSearchBar(searchBar);

		int totalNum = counselingScheduleService.getCounselingScheduleTotalNum(p);
		Pager pager = new Pager(5, 5, totalNum, pageNo);
		pager.setSdate(sdate1);
		pager.setEdate(edate1);
		pager.setSearchBar(searchBar);

		model.addAttribute("pager", pager);

		List<CounselingSchedule> counselingScheduleList = counselingScheduleService.getCounselingSchedule(pager);
		model.addAttribute("counselingScheduleList", counselingScheduleList);
		log.info(model.getAttribute("counselingScheduleList"));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("counselingScheduleList", counselingScheduleList);        
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

	//schedule/counselingAndAsList : AS 스케줄 리스트 불러오기
	@PostMapping(value = "selectAsScheduleList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectAsScheduleList(String searchBar, String sdate1, String edate1, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		log.info(searchBar);

		Pager p = new Pager(5, 5, 5, 5);
		p.setSdate(sdate1);
		p.setEdate(edate1);
		p.setSearchBar(searchBar);

		int totalNum = asScheduleService.getAsScheduleTotalNum(p);
		Pager pager = new Pager(5, 5, totalNum, pageNo);
		pager.setSdate(sdate1);
		pager.setEdate(edate1);
		pager.setSearchBar(searchBar);

		model.addAttribute("pager", pager);

		List<AsSchedule> asScheduleList = asScheduleService.getAsSchedule(pager);
		
		
		model.addAttribute("asScheduleList", asScheduleList);
		log.info(model.getAttribute("asScheduleList"));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("asScheduleList", asScheduleList);        
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
	
	
	//schedule/notificationList : 알림 리스트 리스트 불러오기
	@PostMapping(value = "notificationList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String notificationList(String searchBar, String sdate, String edate, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		log.info(searchBar);

		Pager p = new Pager(5, 5, 5, 5);
		p.setSdate(sdate);
		p.setEdate(edate);
		p.setSearchBar(searchBar);

		int totalNum = requestDetailsService.getNotificationTotalNum(p);
		log.info(totalNum);
		Pager pager = new Pager(5, 5, totalNum, pageNo);
		pager.setSdate(sdate);
		pager.setEdate(edate);
		log.info(pager.getEdate());
		pager.setSearchBar(searchBar);

		model.addAttribute("pager", pager);

		List<RequestDetails> notificationList = requestDetailsService.getNotificationList(pager);
		
		
		model.addAttribute("notificationList", notificationList);
		log.info(model.getAttribute("notificationList"));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("notificationList", notificationList);        
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
	
	//schedule/notificationList - 확정하기 버튼 눌릴 때 : 요청 내역 테이블의 상태를 확정(0)으로 updates
	@PostMapping(value = "/confirmation", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void confirmation(String dln, Model model) {

		//RequestDetails rd = (RequestDetails)list;
		log.info(dln);
		requestDetailsService.updateRequestDetails(dln);

		RequestDetails rd = requestDetailsService.getRD(dln);
		log.info(rd.getRdCounDate());

		CounselingSchedule cs = new CounselingSchedule();
		cs.setCounScheDln(rd.getRdDln());
		cs.setCounScheAddress(rd.getRdAddress());
		cs.setCounScheStartdate(rd.getRdCounDate());
		cs.setCounScheContent(rd.getRdContent());
		
		counselingScheduleService.setSchedule(cs);
		

	}
	
}
