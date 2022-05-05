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

</script>

<main id="main" class="main">
	<div class="dentist_processing">

		<div class="pagetitle">
			<h1>Processing</h1>

			<div>${detailTeamInformationTeamName[0].tcategory}</div>

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Home</li>
					<li class="breadcrumb-item">Schedule</li>
					<li class="breadcrumb-item active">Team</li>
				</ol>
			</nav>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="team">
				<div class="row">
					<div class="col-sm-12">
						<div class="card" style="width: 71rem; display:flex;  flex-flow : wrap;" >
							<div class="card-body justify-content-between">
								<div style = "display:flex">
								<h5 class="card-title">일정 목록</h5>
								
								<!-- 날짜까지 계산 할 때 는 해당월이 제외되므로 1개월 더 큰 값을 더해준다. -->
								<button type="button" class="btn btn-outline-primary ALL" id="10">전체</button>
								<button type="button" class="btn btn-outline-primary" id="1">이번 달</button>
								<button type="button" class="btn btn-outline-primary" id="4">3개월</button>
								<button type="button" class="btn btn-outline-primary" id="7">6개월</button>
								
								
								</div>
								
								
								<div style="display: flex; justify-content: space-between; flex-direction: row;">
									<div class="team-wrapper d-flex" style = "display:flex;  flex-flow : wrap;">
									
										<c:forEach var="information"
											items="${detailTeamInformationSchedule}" varStatus="status">
									
													<!-- Team Card -->
													<div class="card border" style="width: 15rem; "
														onclick="location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=${information.constructionschedule.consScheDln}'">
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