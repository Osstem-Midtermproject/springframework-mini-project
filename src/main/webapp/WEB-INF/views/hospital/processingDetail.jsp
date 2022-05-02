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
									data-bs-target="#bordered-past" type="button">시공상황</button>
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
									
									<div id="dialogUpdateForm">
										<div id="form-div">
											<form>
												<div class="form-group mt-2 mb-4">
													<label for="content">추가요청</label> <input type="text"
														class="form-control" id="additionalContentUpdate" style="height: 140px" />
												</div>
											</form>
										</div>
									</div>

								</table>
								<button id="insertButton">추가</button>
							</div>
							<div class="tab-pane fade" id="bordered-past">
								<div class="progressList col-8" style="margin: 0 auto">
									<c:forEach var="hospitalProgress" items="${hospitalProgresses}">
										<c:if test="${hospitalProgress.progress.pcontent != null}">
											<div class="progressImg" style="height: 400px">
			               						<img src="${hospitalProgress.progress.pimg}" alt="" style="height: 100%; width: 100%;" >
			               					</div>
						                	<h6 class="text-center" style="padding: 15px 0 15px 0; margin: 0;">${hospitalProgress.progress.pcontent}</h6>
					                	</c:if>
				                    </c:forEach>
					            </div>
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
				
				<%-- <div class="card">
					<div class="card-body">
						<h5 class="card-title">시공상황</h5>
						<div class="progressList col-6">
							<c:forEach var="hospitalProgress" items="${hospitalProgresses}">
								<c:if test="${hospitalProgress.progress.pcontent != null}">
									<div class="progressImg" style="height: 200px">
	               						<img src="${hospitalProgress.progress.pimg}" alt="" style="height: 100%; width: 100%;" >
	               					</div>
				                	<h6 style="padding: 15px 0 15px 0; margin: 0;">${hospitalProgress.progress.pcontent}</h6>
			                	</c:if>
		                    </c:forEach>
			              </div>
					</div>
				</div> --%>
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
					  let arContId = "${hospitalContDate.contract.contIdentificationNumber}";
					  
					  insert(arContent, arContId)
					  
					  $(this).dialog("close");
				  }, "취소": function() {
					  $(this).dialog("close");
				  }
			  }
		  })
	  });
 	  
 	 //수정 form 
 	 $(function() {
		  $("#dialogUpdateForm").dialog({
			  autoOpen:false,
			  modal:true,
			  resizable: false,
			  
			  buttons: {
				  "수정": function() {
					  let newArContent = $("#additionalContentUpdate").val();
						
					  console.log("newArContent " + newArContent);
					  
					  var my_data = $("#dialogUpdateForm").data('param');
					  console.log(my_data);
					  
					  update(my_data, newArContent);
					  
					  $(this).dialog("close");
				  }, "취소": function() {
					  $(this).dialog("close");
				  }
			  }
		  })
	  });
 	 
 	 /* 모든 추가요청을 ajax로 불러오기 */
 	 function getContentList() {
 		$.ajax({
	         url:"arContentList",
	    	 type:'post',
	         data:{
	        	 contId:"${hospitalContDate.contract.contIdentificationNumber}"
	    	 }
	    }).done((data) => {
	    	console.log(data);
	    	var html = "";
	    	if (data.length > 0) {
	    		for (i=0; i<data.length; i++) {
	    			html += "<div id='arContent' class='d-inline' data-code='";
	    	    	html += data[i].arId;
	    	    	html += "'>";
	    	    	html += data[i].arContent;
	    	    	html += "<span>";
	    	    	html += data[i].arDate;
	    	    	html += "</span>";
	    	    	html += "</div>";
	    	    	html += "<a href='javascript:;' class='arContentDeleteBtn' data-del=";
	    	    	html += data[i].arId;
	    	    	html += "> 삭제 </a>";
	    	    	html += "<a href='javascript:;' class='arContentUpdateBtn' data-code=";
 	    	    	html += data[i].arId;
 	    	    	html += ">수정</a>";
 	    	    	html += "<br>";
	    		} 
	    	} else {
	    			html += "<div id='arContent' class='d-inline'>";
	    	    	html += "등록된 글이 없습니다.";
	    	    	html += "</div>";
	
	    	}
	    	$("#additionalRequest").html(html);
	    	console.log("getContentList 성공");
	    	
	    });
 	 }
 	 
 	/* 초기 페이지 로딩시 모든 추가요청 불러오기 */
 	$(function(){
 		getContentList();
 	});
 	 
 	/* 추가 버튼 클릭시 추가 dialog창 open 되면서 내용 추가  */
 	 $("#insertButton").on("click", function() {
		  $("#dialog").dialog("open");
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
   	   getContentList();
   	   $("#additionalContent").val("");
	   });
    }

	 /* 항목별 삭제 버튼 */
	 $(document).on("click",".arContentDeleteBtn", function(){
		 var arId = $(this).attr("data-del");
		 
		 $.ajax({
			 url:"arContentDelete",
			 type:'post',
	         data:{
	        	 arId:arId
	         }
		 }).done((data) => {
			console.log("delete 성공");
			getContentList();
		 });
	 });
	 
	 /* 항목별 수정 버튼 */
	 $(document).on("click",".arContentUpdateBtn", function(){
		 console.log("arContentUpdateBtn click event 실행");
		 
		 var arId = $(this).attr("data-code");
		 console.log(arId)
		 $("#dialogUpdateForm").data('param', arId).dialog("open");
		 
		 var arContent = $(`#arContent\${arId}`).text();
		 console.log(arContent);
 
		 $("#additionalContentUpdate").val(arContent);
	 });
	 
	 function update(arId, newArContent) {
		 console.log(arId);
		 console.log(newArContent);
		 $.ajax({
			 url:"arContentUpdate",
			 type:'post',
			 data: {
				 arId: arId,
				 newArContent: newArContent
			 }
		 }).done((data) => {
			 console.log("update 성공");
			 getContentList();
			 
		 })
	    }
	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>