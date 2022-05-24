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
					listTag += "<div class='team-wrapper d-flex'>";
					listTag += "<div class='card border' style='width: 17rem; cursor:pointer'";
					listTag += "onclick='location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
					listTag += "<div class='card-body d-flex flex-column'>";
					listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
					listTag += "<div><h6>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</h6></div>";
					listTag += "<div><h6>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</h6></div>";
					listTag += "<div><h6>내용: " + List[i].constructionschedule.consScheContent + "</h6></div>";
					listTag += "<div><h6>주소: " + List[i].constructionschedule.consScheAddress + "<h6></div>";

					listTag += "</div> </div> </div> "
					
				}
				$(".top-box").html(listTag);
			
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
					listTag += "<div class='team-wrapper d-flex'>";
					listTag += "<div class='card border' style='width: 17rem; cursor:pointer'";
					listTag += "onclick='location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
					listTag += "<div class='card-body d-flex flex-column'>";
					listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
					listTag += "<div><h6>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</h6></div>";
					listTag += "<div><h6>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</h6></div>";
					listTag += "<div><h6>내용: " + List[i].constructionschedule.consScheContent + "</h6></div>";
					listTag += "<div><h6>주소: " + List[i].constructionschedule.consScheAddress + "<h6></div>";

					listTag += "</div> </div> </div> "
					
				}
				$(".top-box").html(listTag);
			
		})
	})
});

/* 선택한 달로 이동하여 보여준다. */
$(function(){
	$('.form-select').change(function(){
	    var tid = getParameters('tid');
		var month = $('.form-select option:selected').val();
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
					listTag += "<div class='team-wrapper d-flex'>";
					listTag += "<div class='card border' style='width: 17rem; cursor:pointer'";
					listTag += "onclick='location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
					listTag += "<div class='card-body d-flex flex-column'>";
					listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
					listTag += "<div><h6>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</h6></div>";
					listTag += "<div><h6>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</h6></div>";
					listTag += "<div><h6>내용: " + List[i].constructionschedule.consScheContent + "</h6></div>";
					listTag += "<div><h6>주소: " + List[i].constructionschedule.consScheAddress + "<h6></div>";

					listTag += "</div> </div> </div> "
					
				}
				$(".top-box").html(listTag);
			
		})
	})
});

</script>

<style>
.btn{
	width:80px;
	margin-left: 5px;
	font-size:15px;
	text-align: center;
	color: rgba(32, 54,68);
	border : 1px solid #ced4da;
}
.btn:hover {
	color: #fff;
	background-color: rgb(43 71 90 / 86%);
	border: none;
}

.btn:focus {
	background-color: none;
	outline: none;
	box-shadow: none;
}
.btn:active {
	color: #fff;
	box-shadow: none;
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
						<div class="card d-flex">
							<div class="card-body">
								<div>
									<h5 class="card-title">${detailTeamInformationTeamName[0].tcategory}</h5>
								</div>
								<div>
									<div class="col-4" style="padding: 20px 0 15px 0;">
										<div class="d-flex align-items-center">
											<div style="font-weight: 600; font-size: large; margin-bottom: 0; width: 23%;">월별 조회</div>
											<select class="form-select border-1" style="font-weight: 500; width: 80%">									
												<option selected>월별 선택</option>
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
										</div>
									</div>
									<div class="col-4" style="padding-bottom: 15px;">
										<div class="d-flex align-items-center justify-content-around ">
											<div style="font-weight: 600; font-size: large; margin-bottom: 0rem; width: 25%;">예정 시공 기간</div>
											<button type="button" class="btn btn-outline-primary ALL" >전체</button>
											<button type="button" class="btn btn-outline-primary" id="2">1개월</button>
											<button type="button" class="btn btn-outline-primary" id="4">3개월</button>
											<button type="button" class="btn btn-outline-primary" id="7">6개월</button>
											<button type="button" class="btn btn-outline-primary" id="10">9개월</button>
										</div>
									</div>
									
									<!--달력 -->
									<div class="col-4" style="padding-bottom: 15px;">
									    <div class="d-flex align-items-center">
									        <div style="font-weight: 600; font-size: large; margin-bottom: 0rem; width: 23%;">달력 조회</div>
									        <div class="d-flex flex-grow-1">
									            <input type="date" class="form-control" id="startdate">
									            <span style="margin: 0.2rem;">~</span>
									            <input type="date" class="form-control" id="enddate">
									        </div>
									    </div>
									</div>
												
									<!--달력 -->
									<!-- <div class=" d-flex align-items-center" ">
									  <input type="date" class="form-control" id="startdate"
									  		style="width:130px; height:32.5px; margin-top:5px; font-size:16px; margin-left:26px;" >
									  <span style="margin: 0.2rem;">~</span>
									  <input type="date" class="form-control" id="enddate"
									  		style="width:130px; height:32.5px; margin-top:5px; font-size:16px;">
									</div> -->
									
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
														listTag += "<div class='team-wrapper d-flex'>";
														listTag += "<div class='card border' style='width: 17rem; cursor:pointer'";
														listTag += "onclick='location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=" + List[i].constructionschedule.consScheDln + "'\">";
														listTag += "<div class='card-body d-flex flex-column'>";
														listTag += "<h5 class=\"card-title\">" + List[i].constructionschedule.consScheHospitalName + "</h5>";
														listTag += "<div><h6>시작 예정일: " + List[i].constructionschedule.consScheStartdate.substring(0,10) + "</h6></div>";
														listTag += "<div><h6>종료 예정일: " + List[i].constructionschedule.consScheEnddate.substring(0,10) + "</h6></div>";
														listTag += "<div><h6>내용: " + List[i].constructionschedule.consScheContent + "</h6></div>";
														listTag += "<div><h6>주소: " + List[i].constructionschedule.consScheAddress + "<h6></div>";

														listTag += "</div> </div> </div> "
														
													}
													$(".top-box").html(listTag);
												
											})
										};
									</script>
								</div>
								
								<div class="d-flex top-box" style="padding-top: 20px">
				                    <div class="team-wrapper d-flex">
				                        <c:forEach var="information"
				                            items="${detailTeamInformationSchedule}" varStatus="status">
				                            <!-- Team Card -->
				                                <div class="card border" style="width: 17rem; cursor:pointer;"
				                                    onclick="location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=${information.constructionschedule.consScheDln}'">
				                                    <div class="card-body d-flex flex-column">
				                                    <h5 class="card-title">${information.constructionschedule.consScheHospitalName}</h5>
				                                        <div><h6>시작 예정일:
				                                            ${fn:substring(information.constructionschedule.consScheStartdate,0,10)}</h6></div>
				                                        <div><h6>종료 예정일:
				                                            ${fn:substring(information.constructionschedule.consScheEnddate,0,10)}</h6></div>
				                                        <div><h6>내용: ${information.constructionschedule.consScheContent}</h6></div>
				                                        <div><h6>주소: ${information.constructionschedule.consScheAddress}</h6></div>
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