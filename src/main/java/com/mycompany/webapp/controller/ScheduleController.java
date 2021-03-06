package com.mycompany.webapp.controller;

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
import com.mycompany.webapp.dto.Contract;
import com.mycompany.webapp.dto.CounselingSchedule;
import com.mycompany.webapp.dto.Hospital;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Progress;
import com.mycompany.webapp.dto.RequestDetails;
import com.mycompany.webapp.dto.Team;
import com.mycompany.webapp.service.AsScheduleService;
import com.mycompany.webapp.service.CalendarService;
import com.mycompany.webapp.service.ConstructionScheduleService;
import com.mycompany.webapp.service.CounselingScheduleService;
import com.mycompany.webapp.service.HospitalService;
import com.mycompany.webapp.service.ProgressService;
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
	ConstructionScheduleService constructionScheduleService;

	@Resource
	CounselingScheduleService counselingScheduleService;

	@Resource
	AsScheduleService asScheduleService;

	@Resource
	ProgressService progressService;

	@Resource
	RequestDetailsService requestDetailsService;

	@GetMapping("/calendar")
	public String calendar(Model model, String id, String start, String end, String content, String estart,
			String address) {
		List<ConstructionSchedule> cs = calendarService.getSchedule();
		model.addAttribute("cs", cs);
		if (id != null) {
			log.info(id);
			ConstructionSchedule schedule = new ConstructionSchedule();
			schedule.setConsScheId(Integer.parseInt(id));
			schedule.setConsScheStartdate(start);
			schedule.setConsScheEnddate(end);
			schedule.setConsScheContent(content);
			schedule.setConsScheAddress(address);
			schedule.setConsScheCategoryId(estart);
			calendarService.updateCalTransaction(schedule);
			log.info(schedule);

		}

		return "schedule/calendar";
	}

	@PostMapping(value = "/calendarajax", produces = "application/json; charset=UTF-8")
	public void calendarajax(String teamId, String start, String end, String content, String categoryId,
			String hospitalName, String address) {
		ConstructionSchedule schedule = new ConstructionSchedule();
		Progress progress = new Progress();
		Contract con = new Contract();
		schedule.setConsScheTeamId(teamId);
		schedule.setConsScheStartdate(start);
		schedule.setConsScheEnddate(end);
		schedule.setConsScheContent(content);
		schedule.setConsScheCategoryId(categoryId);
		schedule.setConsScheHospitalName(hospitalName);
		schedule.setConsScheAddress(address);
		progress.setPdate(start);
		progress.setPcategory(categoryId);
		progress.setPaddress(address);
		progress.setPcontent(content);
		progress.setPenddate(end);
		progress.setCategory("??????");
		calendarService.insertCalTransaction(schedule, progress);

	}

	@GetMapping("/consultcalendar")
	public String consultcalendar(Model model, String id, String start, String content, String estart, String address) {

		List<CounselingSchedule> cs = counselingScheduleService.getCountAll();
		log.info(cs);
		
		model.addAttribute("cs", cs);
		if (id != null) {
			CounselingSchedule schedule = new CounselingSchedule();
			schedule.setCounScheId(Integer.parseInt(id));
			schedule.setCounScheStartdate(start);
			schedule.setCounScheContent(content);
			schedule.setCounScheAddress(address);
			calendarService.updateConCalTransaction(schedule);

		}

		return "schedule/consultcalendar";
	}

	@PostMapping(value = "/consultcalendarajax", produces = "application/json; charset=UTF-8")
	public void consultcalendarajax(String start, String content, String hospitalName, String address) {
		CounselingSchedule schedule = new CounselingSchedule();
		Progress progress = new Progress();
		Contract con = new Contract();
		schedule.setCounScheStartdate(start);
		schedule.setCounScheContent(content);
		schedule.setCounScheAddress(address);
		schedule.setCounScheDln(con.getContDln());
		progress.setPdate(start);
		progress.setPcategory("5");
		progress.setPaddress(address);
		progress.setPcontent(content);
		progress.setPenddate(start);
		progress.setCategory("??????");
		log.info(progress);
		calendarService.insertConCalTransaction(schedule, progress);

	}

	@RequestMapping("/detailForm")
	public String detailForm() {
		log.info("??????");
		return "schedule/detailForm";
	}

	@RequestMapping("/list")
	public String list() {
		log.info("??????");
		return "schedule/list";
	}

	@Resource
	TeamService teamService;

	//????????? ????????? ???????????? ????????? ????????? teamService??? ????????? ????????? ????????? ??????. -jBC
	@RequestMapping("/team")
	public String team(Model model, Model modelCouncel) {
		log.info("??????");

		//???????????? ???????????? ???????????? 
		List<Team> detailTeamInformationPage = teamService.getTeamInformationSchedule();
		List<Team> selectCounselingTeamInformation = teamService.selectCounselingTeamInformation();

		modelCouncel.addAttribute("selectCounselingTeamInformation", selectCounselingTeamInformation);
		model.addAttribute("detailTeamInformationPage", detailTeamInformationPage);
		log.info(detailTeamInformationPage);
		log.info(model);
		log.info(modelCouncel);
		log.info(selectCounselingTeamInformation);

		return "schedule/team";
	}

	//team page?????? ?????? ?????? ???????????? ?????? ?????? ???????????? ???????????? ?????? ???????????? ??????. ??????????????? ??? ID??? ????????????. - jbc
	@GetMapping("/team/detail")
	public String teamDetail(String detailTeamId2, Model model1, HttpServletRequest request, Model model2) {
		log.info("Location ??????");

		//url????????? ??????????????? ????????????. ????????? ???????????? ??????????????? ??? ?????? iD?????? ???????????? ?????? tid??????.
		String detailTeamId = request.getParameter("tid");
		log.info(detailTeamId);

		//???????????? ???????????? ???????????? 
		List<Team> detailTeamInformationSchedule = teamService.getTeamInformationDetailSchedule(detailTeamId);
		List<Team> detailTeamInformationTeamName = teamService.getTeamInformationDetailTeamName(detailTeamId);

		model1.addAttribute("detailTeamInformationSchedule", detailTeamInformationSchedule);
		model2.addAttribute("detailTeamInformationTeamName", detailTeamInformationTeamName);

		log.info(detailTeamInformationSchedule);
		log.info(detailTeamInformationTeamName);
		log.info("tsetzz");
		log.info(model1);
		return "schedule/team_detail";
	}

	//detail team ??????????????? ?????? ???????????? ?????? ?????? ??? ajax ?????? - jbc
	@PostMapping(value = "/team/detailteam", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String detailteam(String duration, String tid, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int pageNo, Team team) {
		log.info(duration);

		String detailTeamId = request.getParameter("tid");
		log.info(detailTeamId);

		//?????? ?????? ??????????????? tid?????? ????????????. 
		team.setTid(detailTeamId);
		//??? dto??? ?????? ????????? ??????. 
		team.setDuration(duration);
		model.addAttribute(team);

		log.info(team);

		List<Team> detailScheduleList = teamService.getLocationHospitalWithDuration(team);
		model.addAttribute("detailScheduleList", detailScheduleList);
		log.info(detailScheduleList);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("detailScheduleList", detailScheduleList);

		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	//detail team ??????????????? ?????? ???????????? ?????? ?????? ??? ?????? ?????? ?????? ajax ?????? - jbc
	@PostMapping(value = "/team/detailteamALL", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String detailteamALL(String tid, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int pageNo, Team team) {
		List<Team> getTeamInformationDetailSchedule = teamService.getTeamInformationDetailSchedule(tid);
		model.addAttribute("detailScheduleList", getTeamInformationDetailSchedule);
		log.info(getTeamInformationDetailSchedule);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("detailScheduleList", getTeamInformationDetailSchedule);

		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	//detail team ??????????????? ?????? ?????? ?????? ??? ?????? ?????? ?????? ajax ?????? - jbc
	@PostMapping(value = "/team/detailteammonth", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String detailteammonth(String tid, String month, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int pageNo, Team team) {
		log.info(month);
		log.info("???");

		String detailTeamId = request.getParameter("tid");
		log.info(detailTeamId);

		//?????? ?????? ??????????????? tid?????? ????????????. 
		team.setTid(detailTeamId);
		//??? dto??? ?????? ????????? ??????. 
		team.setMonth(month);
		model.addAttribute(team);

		log.info(team);

		List<Team> detailScheduleList = teamService.getLocationHospitalWithMonth(team);
		model.addAttribute("detailScheduleList", detailScheduleList);
		log.info(detailScheduleList);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("detailScheduleList", detailScheduleList);

		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	//???????????? ?????? ????????? ???????????? ??? ????????? ????????? ?????????.  - jbc
	@PostMapping(value = "/team/detaidaytoday", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String detaildaytoday(String sdate, String edate, Model model, HttpServletRequest request,
			@RequestParam(defaultValue = "1") int pageNo, Team team) {
		log.info("?????????");

		String detailTeamId = request.getParameter("tid");
		log.info(detailTeamId);

		//?????? ?????? ??????????????? tid?????? ????????????. 
		team.setTid(detailTeamId);
		//??? dto??? ?????? ????????? ??????. 
		team.setSdate(sdate);
		team.setEdate(edate);
		model.addAttribute(team);

		log.info(team);

		List<Team> detailScheduleList = teamService.getLocationHospitalWithdaytoday(team);
		model.addAttribute("detailScheduleList", detailScheduleList);
		log.info(detailScheduleList);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("detailScheduleList", detailScheduleList);

		String json = jsonObject.toString();
		log.info(json);
		return json;
	}

	@RequestMapping("/scheduler")
	public String scheduler() {

		return "schedule/scheduler";
	}

	@GetMapping("/elec")
	public void elec(String category, Model model) {
		log.info(category);
		model.addAttribute("category", category);

	}

	//?????? & AS ????????? ????????? ?????????
	@GetMapping("/counselingAndAsList")
	public String counselingAndAsList() {
		return "schedule/counselingAndAsList";
	}

	//?????? ????????? ????????? ?????????
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

	//schedule/constructionList : ??????????????? ??????????????? ?????? ??????????????? ?????? ????????? ?????? ??? ????????????
	@PostMapping(value = "selectList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectList(@RequestParam(value = "checkArray[]") List<String> allData, String searchBar,
			@RequestParam(defaultValue = "1") int pageNo, Model model) {
		log.info("??????");

		log.info(allData);
		log.info(searchBar);

		Pager p = new Pager(5, 5, 5, 5);
		p.setConsturctionCategory(allData);
		p.setSearchBar(searchBar);

		int totalNum = constructionScheduleService.getTotalNum(p);
		Pager pager = new Pager(10, 5, totalNum, pageNo);
		pager.setConsturctionCategory(allData);
		pager.setSearchBar(searchBar);

		model.addAttribute("pager", pager);

		List<ConstructionSchedule> constructionScheduleList = constructionScheduleService
				.getConstructionSchedule(pager);
		model.addAttribute("constructionScheduleList", constructionScheduleList);
		log.info(model.getAttribute("constructionScheduleList"));

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("constructionScheduleList", constructionScheduleList);
		jsonObject.put("p", pager);
		jsonObject.put("startPageNo", pager.getStartPageNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());
		jsonObject.put("pageNo", pager.getPageNo());
		jsonObject.put("totalPageNo", pager.getTotalPageNo());
		jsonObject.put("groupNo", pager.getGroupNo());
		jsonObject.put("totalGroupNo", pager.getTotalGroupNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());

		String json = jsonObject.toString();
		log.info(json);
		return json;

	}

	//schedule/counselingAndAsList : ?????? ????????? ????????? ????????????
	@PostMapping(value = "selectScheduleList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectScheduleList(String searchBar, String sdate1, String edate1,
			@RequestParam(defaultValue = "1") int pageNo, Model model) {
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
		jsonObject.put("startPageNo", pager.getStartPageNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());
		jsonObject.put("pageNo", pager.getPageNo());
		jsonObject.put("totalPageNo", pager.getTotalPageNo());
		jsonObject.put("groupNo", pager.getGroupNo());
		jsonObject.put("totalGroupNo", pager.getTotalGroupNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());

		String json = jsonObject.toString();
		log.info(json);
		return json;

	}

	//schedule/counselingAndAsList : AS ????????? ????????? ????????????
	@PostMapping(value = "selectAsScheduleList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String selectAsScheduleList(String searchBar, String sdate1, String edate1,
			@RequestParam(defaultValue = "1") int pageNo, Model model) {
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
		jsonObject.put("startPageNo", pager.getStartPageNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());
		jsonObject.put("pageNo", pager.getPageNo());
		jsonObject.put("totalPageNo", pager.getTotalPageNo());
		jsonObject.put("groupNo", pager.getGroupNo());
		jsonObject.put("totalGroupNo", pager.getTotalGroupNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());

		String json = jsonObject.toString();
		log.info(json);
		return json;

	}

	//schedule/notificationList : ?????? ????????? ????????? ????????????
	@PostMapping(value = "notificationList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String notificationList(String searchBar, String sdate, String edate,
			@RequestParam(defaultValue = "1") int pageNo, Model model) {
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
		jsonObject.put("startPageNo", pager.getStartPageNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());
		jsonObject.put("pageNo", pager.getPageNo());
		jsonObject.put("totalPageNo", pager.getTotalPageNo());
		jsonObject.put("groupNo", pager.getGroupNo());
		jsonObject.put("totalGroupNo", pager.getTotalGroupNo());
		jsonObject.put("endPageNo", pager.getEndPageNo());

		String json = jsonObject.toString();
		log.info(json);
		return json;

	}

	//schedule/notificationList - ???????????? ?????? ?????? ??? : ?????? ?????? ???????????? ????????? ??????(0)?????? updates
	@PostMapping(value = "/confirmation", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void confirmation(String dln, Model model) {

		//RequestDetails rd = (RequestDetails)list;
		log.info(dln);
		requestDetailsService.updateRequestDetails(dln);

		RequestDetails rd = requestDetailsService.getRD(dln);
		log.info(rd);

		CounselingSchedule cs = new CounselingSchedule();
		cs.setCounScheDln(rd.getRdDln());
		cs.setCounScheAddress(rd.getRdAddress());
		cs.setCounScheStartdate(rd.getRdCounDate());
		cs.setCounScheContent(rd.getRdContent());
		
		counselingScheduleService.setSchedule(cs);
		
		Progress p = new Progress();
		p.setPdln(rd.getRdDln());
		p.setPaddress(rd.getRdAddress());
		p.setPcategory("5");
		p.setPcontent("?????? ??????");
		p.setCategory("??????");
		p.setPimg(null);
		p.setPdate(rd.getRdCounDate());
		p.setPenddate(rd.getRdCounDate());
		
		progressService.setProgressConsult(p);
		

	}

}
