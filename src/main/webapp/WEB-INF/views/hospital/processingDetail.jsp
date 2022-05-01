<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

	<div class="pagetitle">
		<h1>Processing</h1>

		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">Home</li>
				<li class="breadcrumb-item">Dentist</li>
				<li class="breadcrumb-item active">Processing</li>
			</ol>
		</nav>

	</div>
	<!-- End Page Title -->

	<section class="section">
		<div class="d-flex align-items-center justify-content-center"
			style="margin-bottom: 10px;">
			<div style="width: 150px; height: 150px;">
				<img
					src="${pageContext.request.contextPath}/resources/images/office_img.png"
					style="height: 100%; width: 100%;">
			</div>
			<div>
				<h3>
					<span class="badge bg-success">${hospitalState.state.skind}</span>
				</h3>
				<h2>${hospital.hname}</h2>
				
				<span>계약일: <fmt:formatDate value="${hospitalContDate.contract.contDate}" pattern="yyyy-MM-dd" /></span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">병원정보</h5>
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th scope="row">병원장</th>
									<td>${hospital.hdirector}</td>
									<th scope="row">전화번호
									<td>${hospital.hpn}</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td>${hospital.haddress}</td>
									<th scope="row">이메일
									<td>${hospital.hemail}</td>
								</tr>
								<tr>
									<th scope="row">개업일</th>
									<td><fmt:formatDate value="${hospital.hod}" pattern="yyyy-MM-dd" /></td>
									<th scope="row">계약서보기<td>계약서 목록 리스트? 아니면 pdf?</td>
								</tr>
							</tbody>
						</table>
						<!-- End Tables without borders -->

					</div>
				</div>

				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab"
							role="tablist">
							<li class="nav-item">
								<button class="nav-link active" id="present-tab"
									data-bs-toggle="tab" data-bs-target="#bordered-present"
									type="button">요청내역</button>
							</li>
							<li class="nav-item">
								<button class="nav-link" id="past-tab" data-bs-toggle="tab"
									data-bs-target="#bordered-past" type="button">과거내역</button>
							</li>
						</ul>
						<div class="tab-content pt-2" id="borderedTabContent">
							<div class="tab-pane fade show active" id="bordered-present">
								<table class="table table-borderless">
									<tbody>
										<tr>
											<th scope="row">제목</th>
											<td>${hospital.requestDetails.rdTitle}</td>
											<th scope="row">신청일</th>
											<td><fmt:formatDate
													value="${hospital.requestDetails.rdApplicationdate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
										<tr>
											<th scope="row">예산</th>
											<td>${hospital.requestDetails.rdBudget}</td>
											<th scope="row">면적</th>
											<td>${hospital.requestDetails.rdSpace}</td>
										</tr>
										<tr>
											<th scope="row">건물층</th>
											<td>${hospital.requestDetails.rdFloor}</td>
											<th scope="row">공간</th>
											<td>없음</td>
										</tr>
										<tr>
											<th scope="row">디자인</th>
											<td>${hospital.requestDetails.rdDesign}</td>
											<th scope="row">상담일</th>
											<td><fmt:formatDate
													value="${hospital.requestDetails.rdCounDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>

										<tr>
											<th scope="row">문의내용</th>
											<td colspan="3" style="width: 85%;">없음</td>
										</tr>

										<!-- 추가요청이 들어올 때마다 추가 -->
										<tr>
										    <th scope="row">추가요청</th>
											<td colspan="3" style="width: 85%;">
												<div id="additionalRequest">
													<%-- <c:forEach var="hospitalArContent" items="${hospitalArContent}">
														<div id="additionalArContent" class="d-inline">${hospitalArContent.additionalRequest.arContent}</div>
														<a href='javascript:;' class="arContentDeleteBtn" data-del=${hospitalArContent.additionalRequest.arId}>삭제</a>
														<br>
													</c:forEach> --%>
												</div>
											</td>
										</tr>
									</tbody>

									<div id="dialog">
										<div id="form-div">
											<form>
												<div class="form-group mt-2 mb-4">
													<label for="content">추가요청</label> <input type="text"
														class="form-control" id="additionalContent" style="height: 140px" />
												</div>
											</form>
										</div>
									</div>

								</table>
								<button id="insertButton">추가</button>
							</div>
							<div class="tab-pane fade" id="bordered-past">
								<table class="table">
									<thead>
										<tr>
											<th scope="col" style="width: 7%;">번호</th>
											<th scope="col" style="width: 15%;">일자</th>
											<th scope="col" style="width: 12%;">구분</th>
											<th scope="col">상세내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>2021-01-01</td>
											<td>벽지</td>
											<td colspan="3">부자재의 경우에는 집의 환경 그리고 합지 시공과 실크 시공에 따라
												들어가는 부자재가 많이 달라지게 되기 때문에 정확한 양과 가격을 측정하기가 힘듭니다. 하지만 쉽게 설명드리기
												위해 합지 시공의 경우에 들어가는 벽지 1롤당 약 5천 원 정도 실크벽지 시공의 경우 들어가는 벽지 1롤당
												약 만원 정도로 생각하시면 편합니다.(현장마다 편차가 있습니다.)</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>2021-01-13</td>
											<td>바닥</td>
											<td colspan="3">노출콘크리트바닥 디자인으로 마감된 현장을 방문해보니 구조크랙등의 문제로
												바닥 전체에 수많은 크랙이 발생되어 있는 현장을 접하게 되었습니다. 이를 해결 하기 위해 리뉴얼 시공 방법은
												마이크로토핑으로 마감하기로 결정하고 마이크로토핑작업을 위한 사전 작업을 진행하게 되었습니다. 출입구나
												재료분리대 주변등의 높이를 마이크로토핑 작업을 위한 작업 공간(높이)을 만들어 주고 기발생된 구조크랙은
												그라우팅 재료등 으로 메꿔 주는등 의 사전 작업이 필요 했습니다.</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>2021-01-16</td>
											<td>냉난방</td>
											<td>냉난방 설비란 일정한 실내온도를 유지하기위해 설치된 기계나 기구, 배관 및 그 밖에 성능을
												유지하기위한 설비다. 건축물의 실내를 따뜻하게 하기위해 설치되는 난방배관(아파트, 주택 등)과 에어컨 등이
												주변에서 흔히 볼 수 있는 냉난방설비다.</td>
										</tr>
										<tr>
											<th scope="row">4</th>
											<td>2021-01-20</td>
											<td>전기</td>
											<td>“전기설비”란 발전·송전·변전·배전·전기공급 또는 전기사용을 위하여 설치하는
												기계·기구·댐·수로·저수지·전선로·보안통신선로 및 그 밖의 설비를 말합니다</td>
										</tr>
										<tr>
											<th scope="row">5</th>
											<td>2021-01-28</td>
											<td>인테리어</td>
											<td>서양 건축의 천장과 벽 또는 방바닥의 표면을 다른 재료를 써서 마무리짓는 화장이나 마무리 위에
												회화나 부조를 하고 샹들리에, 거울, 가구류에 의장을 집중시켜 실내를 하나의 양식으로 만드는 것을 뜻했다.</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- End Bordered Tabs -->
					</div>
				</div>


			</div>

			<div class="col-lg-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Recent Activity</h5>
						<div class="dashboard">
							<div class="activity">
							
								<c:forEach var="hospitalProgress" items="${hospitalProgresses}">
			                  	  <div class="activity-item d-flex">
			                  	    <div class="activite-label"><fmt:formatDate value="${ hospitalProgress.progress.pdate}" pattern="yyyy-MM-dd"/></div>
			                  	    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
			                  	    <div class="activity-content">${hospitalProgress.progress.pcategory}</div>
			                      </div>
			                    </c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- End Recent Activity -->
				
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">시공상황</h5>
						<div class="progressList col-12">
							<c:forEach var="hospitalProgress" items="${hospitalProgresses}">
								<c:if test="${hospitalProgress.progress.pcontent != null}">
									<div class="progressImg" style="height: 200px">
	               						<img src="../images/analysis_design_areaBest.jpg" alt="" style="height: 100%; width: 100%;" >
	               					</div>
				                	<h6 style="padding: 15px 0 15px 0; margin: 0;">${hospitalProgress.progress.pcontent}</h6>
			                	</c:if>
		                    </c:forEach>
			              </div>
					</div>
				</div>
				
				
			</div>
		</div>
	</section>

</main>
<!-- End #main -->

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>



<script>
 	  $(function() {
		  $("#dialog").dialog({
			  autoOpen:false,
			  modal:true,
			  resizable: false,
			  
			  buttons: {
				  "확인": function() {
					  let arContent = $("#additionalContent").val();
					  
					  console.log("확인 버튼을 눌렀을 때, arContent:")
					  console.log(arContent);
					  console.log("${hospitalContDate.contract.contIdentificationNumber}");
					  
					  insert(arContent, "${hospitalContDate.contract.contIdentificationNumber}")
					  
					  $(this).dialog("close");
				  }, "취소": function() {
					  $(this).dialog("close");
				  }
			  }
		  })
	  });
 	 
 	  
 	 $("#insertButton").on("click", function() {
		  $("#dialog").dialog("open");
		  $("#additionalContent").val("");
	 });

 	 function insert(arContent, arContId) {  
       $.ajax({
         url:"arContentInsert",
    	 type:'post',
         data:{
        	 arContent:arContent,
        	 arContId:arContId
    	 }
       }).done((data) => {
    	   console.log("insert 성공");
    	   /* console.log("추가된 것만 불러오기");
    	   select(arContId, arContent) */
    	   console.log("모든 요소 불러오기");
    	   getContentList();
    	   console.log(data);
    	   $("#additionalContent").val("");
	   });
     }
 	 
 	 function select(arContId, arContent) {
 		$.ajax({
 	         url:"details",
 	    	 type:'post',
 	         data:{
 	        	 contId:arContId,
 	        	 arContent:arContent
 	    	 }
 	    }).done((data) => {
 	    	console.log(data.arId);
 	    	var html = "";
 	    	html += "<div id='additionalArContent' class='d-inline'>";
 	    	html += arContent;
 	    	html += "</div>";
 	    	html += "<a href='javascript:;' class='arContentDeleteBtn' data-del=";
 	    	html += data.arId;
 	    	html += ">삭제</a>";
 	    	html += "<br>";
 	    	
 	    	$("#additionalRequest").append(html);
 	    	
 	    	console.log("성공");
 	    	
 		});
 	 }
 	 
 	 /* 모든 추가요청을 ajax로 불러오기 */
 	 function getContentList() {
 		$.ajax({
	         url:"detailss",
	    	 type:'post',
	         data:{
	        	 contId:"${hospitalContDate.contract.contIdentificationNumber}"
	    	 }
	    }).done((data) => {
	    	console.log(data);
	    	var html = "";
	    	if (data.length > 0) {
	    		for (i=0; i<data.length; i++) {
	    			html += "<div id='additionalArContent' class='d-inline'>";
	    	    	html += data[i].arContent
	    	    	html += "<a href='javascript:;' class='arContentDeleteBtn' data-del=";
	    	    	html += data[i].arId;
	    	    	html += "> 삭제 </a>";
	    	    	html += "<a href='javascript:;' class='arContentUpdateBtn' data-code=";
 	    	    	html += data[i].arId;
 	    	    	html += ">수정</a>";
	    	    	html += "</div>";
 	    	    	html += "<br>";
	    		} 
	    	} else {
	    			html += "<div id='additionalArContent' class='d-inline'>";
	    	    	html += "등록된 글이 없습니다.";
	    	    	html += "</div>";
	
	    	}
	    	$("#additionalRequest").html(html);
	    	/* $("#additionalRequest").append(html); */
	    	console.log("성공");
	    	
	    });
 	 }
 	 
 	$(function(){
 	    
 		getContentList();
 	    
 	});
 	 	 
	 $(document).on("click",".arContentDeleteBtn",function(){
		 console.log("실행");
		 var arId = $(this).attr("data-del");
		 console.log(arId)
		 
		 $.ajax({
			 url:"arContentDelete",
			 type:'post',
	         data:{
	        	 arId:arId
	         }
		 }).done((data) => {
			console.log("성공");
			getContentList();
		 });
	 });
	 
	 $(document).on("click",".arContentUpdateBtn",function(){
		 console.log("실행");
		 $("#dialog").dialog("open");
		 console.log($("#additionalArContent"));
		 var target = $(this);
		 var data_code = $(this).attr("data-code");
		 
		 console.log(data_code);
	 });
	 
	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>