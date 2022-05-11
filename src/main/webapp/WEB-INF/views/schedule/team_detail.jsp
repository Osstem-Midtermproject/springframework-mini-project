<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	.card border {
		width: 180px;
	}
</style>

<script type="text/javascript">

function getParameters (paramName) { 
	var returnValue;
	var url = location.href; 
	var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&'); 
	// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return 
	for (var i = 0; i < parameters.length; i++) { 
		var varName = parameters[i].split('=')[0]; 
		if (varName.toUpperCase() == paramName.toUpperCase()) {
			returnValue = parameters[i].split('=')[1]; 
			return decodeURIComponent(returnValue); 
		}
	} 
};

//기간 버튼을 클릭 할 시 해당 기간에 되는 일정만 출력
$(function(){
	$('.btn').on("click",function(){
		//chkParam();	
	    
	    var tid = getParameters('tid');

		let duration = $(this).attr('id');
		
		
		$.ajax({
			url:"detailteam",
			type:'post',
		    data:{duration,tid}
		}).done(data => {
				console.log(data);
				
				// 가져온 리스트를 출력하는데 이상하게 each가 안 먹히므로 for로 대체한다.
					 
				var List = data.detailScheduleList;
				console.log(List);
				//console.log(List[0].constructionschedule.consScheDln.substr(1,2) );
				
				var listTag = "";
				for(var i = 0; i < List.length; i++){
					listTag += "<div class='card border' style='width: 15rem;";
					listTag += "onclick=\"location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
					listTag += "<div class=\"card-body d-flex flex-column\"> <div class=\"d-flex align-items-center\"></div><div><div class=\"display:flex; flex-direction:column;\">";
					listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
					listTag += "<div>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</div>";
					listTag += "<div>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</div>";
					listTag += "<div>내용: " + List[i].constructionschedule.consScheContent + "</div>";
					listTag += "<div>주소: " + List[i].constructionschedule.consScheAddress + "</div>";
					listTag += "</div> </div> </div> </div>"
					
				}
				$(".team-wrapper.d-flex").html(listTag);
			
		})
	})
});

//전체를 누르면 전체가출력된다. ajax- jbc 
$(function(){
	$('.ALL').on("click",function(){
		//chkParam();	
	    
	    var tid = getParameters('tid');

		$.ajax({
			url:"detailteamALL",
			type:'post',
		    data:{tid}
		}).done(data => {
				console.log(data);
				
				// 가져온 리스트를 출력하는데 이상하게 each가 안 먹히므로 for로 대체한다.
					 
				var List = data.detailScheduleList;
				console.log(List);
				//console.log(List[0].constructionschedule.consScheDln.substr(1,2) );
				
				var listTag = "";
				for(var i = 0; i < List.length; i++){
					listTag += "<div class='card border' style='width: 15rem;";
					listTag += "onclick=\"location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
					listTag += "<div class=\"card-body d-flex flex-column\"> <div class=\"d-flex align-items-center\"></div><div><div class=\"display:flex; flex-direction:column;\">";
					listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
					listTag += "<div>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</div>";
					listTag += "<div>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</div>";
					listTag += "<div>내용: " + List[i].constructionschedule.consScheContent + "</div>";
					listTag += "<div>주소: " + List[i].constructionschedule.consScheAddress + "</div>";

					listTag += "</div> </div> </div> </div>"
					
				}
				$(".team-wrapper.d-flex").html(listTag);
			
		})
	})
});

/* 선택한 달로 이동하여 보여준다. */
$(function(){
	$('.form-select').change(function(){
		//chkParam();	
		console.log("dfk");
	    
	    var tid = getParameters('tid');
		var month = $('.form-select option:selected').val();
		console.log(month);
		
		$.ajax({
			url:"detailteammonth",
			type:'post',
		    data:{month,tid}
		}).done(data => {
				console.log(data);
				
				// 가져온 리스트를 출력하는데 이상하게 each가 안 먹히므로 for로 대체한다.
					 
				var List = data.detailScheduleList;
				console.log(List);
				//console.log(List[0].constructionschedule.consScheDln.substr(1,2) );
				
				var listTag = "";
				for(var i = 0; i < List.length; i++){
					listTag += "<div class='card border' style='width: 15rem;";
					listTag += "onclick=\"location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
					listTag += "<div class=\"card-body d-flex flex-column\"> <div class=\"d-flex align-items-center\"></div><div><div class=\"display:flex; flex-direction:column;\">";
					listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
					listTag += "<div>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</div>";
					listTag += "<div>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</div>";
					listTag += "<div>내용: " + List[i].constructionschedule.consScheContent + "</div>";
					listTag += "<div>주소: " + List[i].constructionschedule.consScheAddress + "</div>";
					listTag += "</div> </div> </div> </div>"
					
				}
				$(".team-wrapper.d-flex").html(listTag);
			
		})
	})
});

</script>

<style>
.btn{
	width:80px;
	height:30px;

	margin-left: 5px;
	font-size:15px;
	text-align: center;
	line-height: 15px;
	color: #f26522;
	border-color: orange;
	
}
.btn:hover {
	color: #fff;
	background-color: orange;
	border-color: orange;
}

but:focus {
	background-color: orange;
	color: white;
	border: white;
	box-shadow: 0 0 0 0.25rem rgba(216, 13, 13, 0.5);
}

.btn-check:focus+.btn-outline-primary, .btn-outline-primary:focus {
	box-shadow: 0 0 0 0.1rem rgba(240, 114, 11, 0.87);
}

.form-select{
	margin-top:20px;
	margin-right: 5px;
	font-size:15px;
	text-align: center;
	line-height: 30px;
	color: #f26522;

}

.tg  {
	border-collapse:collapse;border-spacing:0;
	margin-bottom:30px;
}

.tg td{
	border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  	overflow:hidden;padding:10px 5px;word-break:normal;
  
 }
 
.tg th{
	border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  	font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;
  	
 }
 
.tg .tg-fpkb{
	border-color:#fe996b;text-align:left;vertical-align:top;
	 	
 }
 
.tg .tg-i8w1{
	background-color:#efefef;border-color:#fe996b;text-align:left;vertical-align:top;
	 
 }
</style>

<main id="main" class="main">
	<div class="team_detail">
		<div class="d-flex">
			<div class="pagetitle d-flex align-items-end">
				<h1>부서</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">홈</li>
						<li class="breadcrumb-item">스케줄</li>
						<li class="breadcrumb-item">리스트</li>
						<li class="breadcrumb-item active">부서</li>
					</ol>
				</nav>
			</div>
		</div>
	<!-- End Page Title -->
		<section class="section">
			<div class="team">
				<div class="row">
					<div class="col-sm-12">
						<div class="card" style="width: 71rem; display:flex;  flex-flow : wrap;" >
							<div class="card-body justify-content-between">
								<div>
									<h5 class="card-title" style= "padding-right: 40px; margin-left:18px;">${detailTeamInformationTeamName[0].tcategory}</h5>
								</div>
								<div>
								
									<table class="tg" style= "margin-left:18px;">
										<thead>
										  <tr>
										    <th class="tg-i8w1" style = "line-height: 40px;" >예정 시공 기간</th>
										    <th class="tg-fpkb" style = "line-height: 40px;">
									    		<!-- 날짜까지 계산 할 때 는 해당월이 제외되므로 1개월 더 큰 값을 더해준다. -->
												<button type="button" class="btn btn-outline-primary ALL" >전체</button>
												<button type="button" class="btn btn-outline-primary" id="2">1개월</button>
												<button type="button" class="btn btn-outline-primary" id="4">3개월</button>
												<button type="button" class="btn btn-outline-primary" id="7">6개월</button>
												<button type="button" class="btn btn-outline-primary" id="10">9개월</button>
										    </th>
										  </tr>
										</thead>
										<tbody>
										  <tr>
										    <td class="tg-i8w1" style = "line-height: 40px;">월별 조회</td>
										    <td class="tg-fpkb">
										    	<select class="form-select" style="margin-bottom: 1.5rem; margin:5px; float:left;" >
													<option selected>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월별 선택&nbsp;&nbsp;&nbsp;</option>
													<option value="01" class = "che">1월</option>
													<option value="02"class = "che">2월</option>
													<option value="03" class = "che">3월</option>
													<option value="04" class = "che">4월</option>
													<option value="05" class = "che">5월</option>
													<option value="06" class = "che">6월</option>
													<option value="07" class = "che">7월</option>
													<option value="08" class = "che">8월</option>
													<option value="09" class = "che">9월</option>
													<option value="10" class = "che">10월</option>
													<option value="11" class = "che">11월</option>
													<option value="12" class = "che">12월</option>
												</select>
												
												<!--달력 -->
												<div class=" d-flex align-items-center" ">
												  <input type="date" class="form-control" id="startdate"
												  		style="width:130px; height:32.5px; margin-top:5px; font-size:16px; margin-left:26px;" >
												  <span style="margin: 0.2rem;">~</span>
												  <input type="date" class="form-control" id="enddate"
												  		style="width:130px; height:32.5px; margin-top:5px; font-size:16px;">
												</div>
												
												<script>
													$('#enddate').change(function() {
														let sdate = $("#startdate").val();
														let edate = $("#enddate").val();
														
														if(sdate !== '' && edate !== ''){
															calList(sdate,edate);
														}
													});
												    
												    //Counseling & AS Schedule List : 시작일과 종료일이 모두 선택되었을 때만 작동	
													$('#enddate1').change(function() {
														let sdate1 = $("#startdate1").val();
														let edate1 = $("#enddate1").val();
														
														if(sdate1 !== '' && edate1 !== ''){
															calList(sdate,edate);
			
															
														}
													});
													
													function calList(sdate,edate){
														
														 var tid = getParameters('tid');
														
														$.ajax({
															url:"detaidaytoday",
															type:'post',
														    data:{sdate,edate, tid}
														}).done(data => {
																console.log(data);
																
																// 가져온 리스트를 출력하는데 이상하게 each가 안 먹히므로 for로 대체한다.
																	 
																var List = data.detailScheduleList;
																console.log(List);
																//console.log(List[0].constructionschedule.consScheDln.substr(1,2) );
																
																var listTag = "";
																for(var i = 0; i < List.length; i++){
																	listTag += "<div class='card border' style='width: 15rem;";
																	listTag += "onclick=\"location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
																	listTag += "<div class=\"card-body d-flex flex-column\"> <div class=\"d-flex align-items-center\"></div><div><div class=\"display:flex; flex-direction:column;\">";
																	listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
																	listTag += "<div>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</div>";
																	listTag += "<div>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</div>";
																	listTag += "<div>내용: " + List[i].constructionschedule.consScheContent + "</div>";
																	listTag += "<div>주소: " + List[i].constructionschedule.consScheAddress + "</div>";
																	listTag += "</div> </div> </div> </div>"
																	
																}
																$(".team-wrapper.d-flex").html(listTag);
															
														})
													};
												</script>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
								
							<div style="display: flex; justify-content: space-between; flex-direction: row;">
								<div class="team-wrapper d-flex" style = "display:flex;  flex-flow : wrap;">
									<c:forEach var="information"
										items="${detailTeamInformationSchedule}" varStatus="status">
										<!-- Team Card -->
										<div class="card border" style="width: 15rem; cursor:pointer;"
											onclick="location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=${information.constructionschedule.consScheDln}'">
											<div class="card-body d-flex flex-column">
												<div class="d-flex align-items-center"></div>
												<div>
													<div class="display:flex; flex-direction:column;">
														<h5 class="card-title">${information.constructionschedule.consScheHospitalName}</h5>
														<div>시작 예정일:
															${fn:substring(information.constructionschedule.consScheStartdate,0,10)}</div>
														<div>종료 예정일:
															${fn:substring(information.constructionschedule.consScheEnddate,0,10)}</div>
														<div>내용: ${information.constructionschedule.consScheContent}</div>
														<div>주소: ${information.constructionschedule.consScheAddress}</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>