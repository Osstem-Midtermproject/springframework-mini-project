package com.mycompany.webapp.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.mycompany.webapp.dto.Design;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.TeamHistory;
import com.mycompany.webapp.service.ContractService;
import com.mycompany.webapp.service.TeamHistoryService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/analysis")
public class AnalysisController {

	@Resource
	ContractService contractService;

	@Resource
	TeamHistoryService teamHistoryService;


	@RequestMapping("/analysis")
	public String analysis(Model model) {


		List<Contract> contract=contractService.getContracts();

		List<Long> yearSales=teamHistoryService.getYearSales();
		model.addAttribute("contract",contract);
		model.addAttribute("yearSales",yearSales);
		log.info(yearSales);
		
		///WEB-INF/views/analysis/analysis.jsp
		return "analysis/analysis";
	}
	
	@PostMapping(value="/yearajax", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String yearAnalysisajax(String sdate,String edate) {
		List<String> day=new ArrayList();
		List<Long> amount=new ArrayList();
		List<TeamHistory> sales=teamHistoryService.getMonthSales(sdate, edate);
		for(int i=0;i<sales.size();i++) {
			day.add(sales.get(i).getThd());
			amount.add(sales.get(i).getTha());
			
		}
		log.info(sales);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("day",day);
		jsonObject.put("amount",amount);
		String json = jsonObject.toString();
		log.info(json);
		return json;

	}
	@RequestMapping("/hospital")
	public String hospital(Model model) {
		log.info("실행");
		


		///WEB-INF/views/analysis/hospital.jsp
		return "analysis/hospital";
	}
	@GetMapping("/chat")
	public String chat(Model model,HttpSession session,HttpServletRequest request) {
		log.info(request.getRemoteAddr());
		String userid=(String)session.getAttribute("sessionUserId");
		
		model.addAttribute("userid",userid);
		return "analysis/chat";
	}

	@RequestMapping("/design")
	public String design(Model model) {
		
		List<Contract> dcon=contractService.getTopDesign();
		List<String> design=contractService.getTopDesignImg("white");
		model.addAttribute("dcon",dcon);
		model.addAttribute("design",design);
		log.info(dcon);
		log.info(design);
		
		//JY
		List<Design> themaRank = contractService.getThemaRank();
		
		Date nowDate = new Date(); 
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
		String date = simpleDateFormat.format(nowDate);
		int month = nowDate.getMonth();
		String m = String.valueOf(month);
		if(m.length()==1) {
			m = 0 + m;
		}
		date += m;
		
		for(Design d : themaRank) {
			if(d.getDtt().equals("Black")) {
				d.setDimg("https://post-phinf.pstatic.net/MjAxNzExMzBfNDcg/MDAxNTExOTcwMjI1NzQy.DqVDPuPg7AkkMasMJUerKBuMLFC2uFK6sWxA659lB2kg.GNop0sT1-cALOkenw9Y4kstVuZqluAFVRtfS0RjqBHQg.JPEG/1.jpg?type=w1200");
				int t = contractService.getCountThisMonth("Black");
				int l = 0;
				if(contractService.getCountLastMonth("Black", date)!=null) {
					l = contractService.getCountLastMonth("Black", date);
				}
				d.setCount(t-l);
			}else if(d.getDtt().equals("Pastel")) {
				d.setDimg("http://www.치과인테리어.kr/data/editor/2202/thumb-cb3f87e5695c4f7c27128ea948b33d04_1643875801_85_1200x732.jpg");
				int t = contractService.getCountThisMonth("Pastel");
				int l = 0;
				if(contractService.getCountLastMonth("Pastel", date)!=null) {
					l = contractService.getCountLastMonth("Pastel", date);
				}
				d.setCount(t-l);
			}else if(d.getDtt().equals("Wood")) {
				d.setDimg("http://www.치과인테리어.kr/data/editor/2111/thumb-43c2f14f363a92e5701979d63e5bab40_1636945435_55_1200x800.jpg");
				int t = contractService.getCountThisMonth("Wood");
				int l = 0;
				if(contractService.getCountLastMonth("Wood", date)!=null) {
					l = contractService.getCountLastMonth("Wood", date);
				}
				d.setCount(t-l);
			}else if(d.getDtt().equals("White")) {
				d.setDimg("http://www.치과인테리어.kr/data/editor/2204/thumb-a672b7de567deec375ff9185d981604c_1650501948_48_1200x800.jpg");
				int t = contractService.getCountThisMonth("White");
				int l = 0;
				if(contractService.getCountLastMonth("White", date)!=null) {
					l = contractService.getCountLastMonth("White", date);
				}
				d.setCount(t-l);
			}else if(d.getDtt().equals("Blue")) {
				d.setDimg("https://t1.daumcdn.net/cfile/blog/99E78E33599A499D33");
				int t = contractService.getCountThisMonth("Blue");
				int l = 0;
				if(contractService.getCountLastMonth("Blue", date)!=null) {
					l = contractService.getCountLastMonth("Blue", date);
				}
				d.setCount(t-l);
			}else {
				d.setDimg("http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2111/thumb-efad1ae88d268a6f32a5f0b45e5f4421_1637719979_95_1200x800.jpg");
				int t = contractService.getCountThisMonth("Gray");
				int l = 0;
				if(contractService.getCountLastMonth("Gray", date)!=null) {
					l = contractService.getCountLastMonth("Gray", date);
				}
				d.setCount(t-l);
			}
		}
		
		List<Contract> whiteImgList = contractService.getDimgDname("White");
		model.addAttribute("White",whiteImgList);

		List<Contract> blackImgList = contractService.getDimgDname("Black");
		model.addAttribute("Black",blackImgList);
		
		List<Contract> pastelImgList = contractService.getDimgDname("Pastel");
		model.addAttribute("Pastel",pastelImgList);

		List<Contract> woodImgList = contractService.getDimgDname("Wood");
		model.addAttribute("Wood",woodImgList);
		
		List<Contract> blueImgList = contractService.getDimgDname("Blue");
		model.addAttribute("Blue",blueImgList);

		List<Contract> grayImgList = contractService.getDimgDname("Gray");
		model.addAttribute("Gray",grayImgList);
		
		log.info("JY: " + themaRank);
		model.addAttribute("themaRank",themaRank);
		
		
		
		///WEB-INF/views/analysis/design.jsp
		return "analysis/design";
	}
	@PostMapping(value="/designajax", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String designajax(String design) {
		log.info("실행");
		log.info(design);	
		List<Integer> cnt=new ArrayList();
		List<String> thema=new ArrayList();
		List<String> designlist=contractService.getTopDesignImg(design);
		List<Contract> con=contractService.getThemaDesign(design);
		for(int i=0;i<con.size();i++) {
			cnt.add(con.get(i).getCno());
			thema.add(con.get(i).getContArea());
			
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("designlist",designlist);
		jsonObject.put("cnt", cnt);//
		jsonObject.put("thema", thema);//
		String json = jsonObject.toString();
		log.info(json);
		return json;

	}

	@RequestMapping("/teamAnalysis")
	public String teamAnalysis(Model model) {
		List<TeamHistory> sales=teamHistoryService.getTeamSales("2022-01-01","2022-12-31");
		log.info(sales);
		model.addAttribute("sales",sales);
		
		///WEB-INF/views/analysis/design.jsp
		return "analysis/teamAnalysis";
	}

	@PostMapping(value="/teamajax", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String teamAnalysisajax(String sdate,String edate) {
		log.info("실행");
		log.info(sdate);
		log.info(edate);		
		List<TeamHistory> sales=teamHistoryService.getTeamSales(sdate,edate);
		log.info(sales);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		jsonObject.put("sales",sales );
		String json = jsonObject.toString();
		log.info(json);
		return json;

	}
	
	//sales 리스트 페이저
		@PostMapping(value = "salesList", produces = "application/json; charset=UTF-8")
		@ResponseBody
		public String salesList(String sdate, String edate, @RequestParam(defaultValue = "1") int pageNo, Model model) {

			//-----------------------------------------------------------
			Pager p = new Pager(5, 5, 5, 5);
			p.setSdate(sdate);
			p.setEdate(edate);

			int totalNum = contractService.getSalesListTotalNum(p);
			log.info(totalNum);
			
			Pager pager = new Pager(5, 5, totalNum, pageNo);
			pager.setSdate(sdate);
			pager.setEdate(edate);

			model.addAttribute("pager", pager);

			List<Contract> salesList = contractService.getSalesList(pager);
			log.info(salesList);
			
			model.addAttribute("salesList", salesList);
			log.info(model.getAttribute("salesList"));

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("salesList", salesList);        
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
	
}
