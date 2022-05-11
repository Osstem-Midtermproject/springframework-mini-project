<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main processingdetail">
	<div class="pagetitle">
		<h1>시공</h1>

		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item">스케줄</li>
				<li class="breadcrumb-item">캘린더</li>
				<li class="breadcrumb-item active">시공</li>
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
				<h3 id="badge">
					<c:if test="${progressCategory.category != '완료'}">
						<span id="state" class="badge bg-success" style="cursor: pointer">${progressCategory.category}중</span>
					</c:if>
					
					<c:if test="${progressCategory.category == '완료'}">
						<span id="state" class="badge bg-secondary" style="cursor: pointer">${progressCategory.category}</span>
					</c:if>
				</h3>
				<h2>${hospital.hname}</h2>
				
				<c:if test="${contractPdf != ''}">
					<span>계약일: 
						<fmt:parseDate value="${hospitalContDate.contract.contDate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
                        <fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
					</span>
				</c:if>
				<c:if test="${contractPdf == ''}">
					<span></span>					
				</c:if>
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
									<td>${hospital.hod}</td>
									<th scope="row">계약서</th>
									
									<c:if test="${contractPdf != ''}">
										<td><a class="btn btn-sm btn-secondary"
											style="font-size: x-small;" href='${pageContext.request.contextPath}/hospital/contractFormPdfAdmin?fileNum=${hospitalContDate.contract.contIdentificationNumber}'>계약서 보기</a></td>
									</c:if>
									
									<c:if test="${contractPdf == ''}">
										<td>계약내역이 없습니다.</td>
									</c:if>
									
								</tr>
							</tbody>
						</table>
						<!-- End Tables without borders -->
					</div>
				</div>

				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered justify-content-center" id="borderedTab"
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
											<td>
												<fmt:parseDate value="${hospital.requestDetails.rdApplicationdate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
                        						<fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
											</td>
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
											<td>
												<fmt:parseDate value="${hospital.requestDetails.rdCounDate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
                        						<fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
											</td>
										</tr>

										<tr>
											<th scope="row">문의내용</th>
											<td colspan="3" style="width: 85%;">${hospital.requestDetails.rdContent}</td>
										</tr>

										<!-- 추가요청이 들어올 때마다 추가 -->
										<tr>
										    <th scope="row">추가요청</th>
											<td colspan="3" style="width: 85%;">
												<div id="additionalRequest">
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div id="dialog">
									<div id="form-div">
										<form>
											<div class="form-group mt-2 mb-4">
												<label for="content" style="font-weight: 500;">추가요청</label>
												<textarea class="form-control" id="additionalContent" style="height: 140px"></textarea>
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
								
								<button id="insertButton" class="arContentInsertBtn">추가</button>
							</div>
							<div class="tab-pane fade" id="bordered-past">
								<!-- 버전1 -->
								<!-- <div class="progressList col-8" style="margin: 0 auto"> -->
								<!-- 버전2 -->
								<div class="progressList col-12">
									<div id="progressImgWrapper">
	               					</div>
									<c:forEach var="hospitalProgress" items="${hospitalProgresses}">
										<c:if test="${hospitalProgress.progress.pcontent != null}">
						                	<%-- <h6 class="text-center" style="padding: 15px 0 15px 0; margin: 0;">${hospitalProgress.progress.pcontent}</h6> --%>
					                	</c:if>
				                    </c:forEach>
					            </div>
					            
					            <div id="dialogImgForm">
									<div id="form-div">
										<form>
											<div class="form-group mt-2 mb-4">
												<div>
													<select class="form-select border-1" id="pimgCategory" style="font-weight: 400; margin-bottom: 1.5rem;">
														<option selected>시공종류</option>
														<option value="1">전기</option>
														<option value="2">설비</option>
														<option value="3">도배</option>
														<option value="4">가구</option>
													</select>
												</div>
											
												<label for="content">내용</label>
												<textarea class="form-control" id="pimgContent" style="height: 140px"></textarea>
												<div class="form-group">
												    <div><label for="pimgattach">Example file input</label></div>
												    <input type="file" class="form-control-file" id="pimgAttach" name="pimgattach" multiple>
											  	</div>
											</div>
										</form>
									</div>
								</div>
								<button id="imgInsertButton">진행상황 추가</button>
							</div>
						</div>
						<!-- End Bordered Tabs -->
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">진행 스케줄</h5>
						<div class="dashboard">
							<div class="activity">
								<c:forEach var="hospitalProgress" items="${hospitalProgresses}">
									<c:if test="${hospitalProgress.progress.category != '완료'}">
				                  	  <div class="activity-item d-flex">
				                  	    <div class="activite-label">
				                  	    	<fmt:parseDate value="${ hospitalProgress.progress.pdate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
	                        				<fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
				                  	    </div>
				                  	    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
				                  	    <div class="activity-content">${hospitalProgress.progress.pcategory} 시작</div>
				                  	  </div>
				                  	   
				                  	  <div class="activity-item d-flex">
				                  	    <div class="activite-label">
				                  	    	<fmt:parseDate value="${ hospitalProgress.progress.penddate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
	                        				<fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
				                  	    </div>
				                  	    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
				                  	    <div class="activity-content">${hospitalProgress.progress.pcategory} 완료</div>
				                      </div>
									</c:if>
									
									<c:if test="${hospitalProgress.progress.category == '완료'}">
										<div class="activity-item d-flex">
					                  	    <div class="activite-label">
					                  	    	<fmt:parseDate value="${ hospitalProgress.progress.pdate}" var="parseDateValue" pattern="yyyy-MM-dd"/>
		                        				<fmt:formatDate value="${parseDateValue}" pattern="yyyy-MM-dd"/>
					                  	    </div>
					                  	    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
					                  	    <div class="activity-content">${hospitalProgress.progress.pcategory}</div>
				                  		</div>
									</c:if>
			                    </c:forEach>
							</div>
						</div>
					</div>
				</div>
				<!-- End Recent Activity -->
			</div>
		</div>
	</section>

</main>
<!-- End #main -->

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<style>
.arContentUpdateBtn, .arContentDeleteBtn {
	font-size: 0.9rem;
	padding: 0;
	margin-right: 0.25rem;
	margin-bottom: 0.25rem;
}
.arContentUpdateBtn:hover, .arContentDeleteBtn:hover {
	color: #fff;
	background-color: rgb(43 71 90 / 86%);
}
.arContentUpdateBtn:focus, .arContentDeleteBtn:foucs{
	color: black;
	background-color: none;
	outline: none;
	box-shadow: none;
}
.arContentUpdateBtn:active, .arContentDeleteBtn:active {
	color: #fff;
	box-shadow: none;
}
.arContentInsertBtn, #imgInsertButton {
	float: right;
	color: #fff;
	font-size: 1.1rem;
	font-weight: 500;
	background-color: #9ec9f1;
	/* background-color: rgb(43 71 90 / 86%); */;
	border: none;
	border-radius: 0.25rem;
}

</style>

<script>
	  //입력 form
 	  $(function() {
		  $("#dialog").dialog({
			  autoOpen:false,
			  modal:true,
			  resizable: false,
			  width: "500",
			  
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
			  width: "500",
			  
			  buttons: {
				  "수정": function() {
					  let newArContent = $("#additionalContentUpdate").val();
						
					  console.log("newArContent " + newArContent);
					  
					  var arId = $("#dialogUpdateForm").data('arId');
					  console.log(arId);
					  
					  update(arId, newArContent);
					  
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
	    			html += "<div id='arContent"; 
	    	    	html += data[i].arId;
	    			html += "' class='d-inline'";
	    	    	html += ">";
	    	    	html += data[i].arContent;
	    	    	html += "</div>";
	    	    	html += "<span class='mx-1' style='color: #7a7b7c; font-size: 0.9rem';>";
	    	    	html += data[i].arDate;
	    	    	html += "</span>";
	    	    	html += "<a href='javascript:;' class='arContentUpdateBtn btn' data-code=";
 	    	    	html += data[i].arId;
 	    	    	html += ">수정</a>";
	    	    	html += "<a href='javascript:;' class='arContentDeleteBtn btn' data-del=";
	    	    	html += data[i].arId;
	    	    	html += ">삭제</a>";
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
		 $("#dialogUpdateForm").data('arId', arId).dialog("open");
		 
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
	
	/* 상태 변경 */
	$(document).on("mousedown", "#state", function(e){
		e.preventDefault();
		
	});
	
	$(document).on("dblclick", "#state", function(){
		console.log("state double click event 실행");
		
		updateCategory("${hospital.hdln}", "${hospital.haddress}")
	});	
	
	function updateCategory(hdln, haddress) {
		$.ajax({
			url: "updateCategory",
			type: "post",
			data: {
				hdln: hdln,
				haddress: haddress,
				pcategory: "0",
				category: "완료"
			}
		}).done((data) => {
			console.log("updateCategory 실행 성공");
			var badgeTag = "";
			badgeTag += "<span id='state' class='badge bg-secondary' style='cursor: pointer'>";
			badgeTag += data.category;
			badgeTag += "</span>";
			
			$("#badge").html(badgeTag);
		})
	}
	
	/* 이미지 업로드 */	
	$("#imgInsertButton").on("click", function() {
		  $("#dialogImgForm").dialog("open");
		  $("#pimgContent").val("");
		  $('#pimgCategory').val('시공종류').prop("selected",true);
		  $("#pimgAttach").val("");
	  });
	
	var progress=[];
	<c:forEach var="hp" items="${hospitalProgresses}">
		progress.push({category: "${hp.progress.pcategory}", date: "${hp.progress.pdate}"});
	</c:forEach>
	
	console.log(progress);
	//이미지 입력 form
	  $(function() {
		  $("#dialogImgForm").dialog({
			  autoOpen:false,
			  modal:true,
			  resizable: false,
			  width: "500",
			  
			  buttons: {
				  "확인": function() {
					  upload();
					  $(this).dialog("close");
				  }, "취소": function() {
					  $(this).dialog("close");
				  }
			  }
		  })
	  });
	
	function upload() {
		var category = $("#pimgCategory option:selected").text();
		console.log(category);
		var content = $("#pimgContent").val();
		var attach = [];
		var date;
		
		for (var i=0; i<$("#pimgAttach")[0].files.length; i++) {
			attach.push($("#pimgAttach")[0].files[i]);
		}
		
		for (var i=0; i<progress.length; i++) {
			  if (progress[i].category == category) {
				  date = progress[i].date;
			  }
		}
		
		date = moment(date).format("YYYY-MM-DD")
		console.log(category);
		console.log(content);
		console.log(attach);
		console.log(date);
		
		var formData = new FormData();
		formData.append("pimgDln", "${hospital.hdln}");
		formData.append("pimgAddress", "${hospital.haddress}");
		formData.append("pimgCategory", category);
		formData.append("pimgContent", content);
		formData.append("pimgDate", date);
		formData.append("pimgHospitalName", "${hospital.hname}");
		
		for (var i=0; i<$("#pimgAttach")[0].files.length; i++) {
			formData.append("pimgAttach", $("#pimgAttach")[0].files[i]);
		}
		
		$.ajax({
			url: "fileupload",
			method: "post",
			data: formData,
			cache: false,
			processData: false,
			contentType: false,
			enctype: 'multipart/form-data'
		}).done((data) => {
			console.log(data);
			console.log(data.result);
			
			if (data.result == 'success') {
				$("#progressImgWrapper").html("");
				getProgressImg();
			} else {
				alert("해당 시공은 진행하지 않았습니다.");
			}
		})
	};
	
	/* 진행상황 img 를 ajax로 불러오기 */
	$(function(){
		getProgressImg();
 	});
	
	var imgInfo;
	function getProgressImg() {
		$.ajax({
			url: "progressImgList",
			data:{
	        	 hdln: "${hospital.hdln}",
	        	 haddress: "${hospital.haddress}",
	    	 },
	    	 
		}).done(data => {
			/* console.log(data); */
			imgInfo = data;
			/* var dataArray = [];
			for (var i=0; i<data.length; i++) {
				dataArray.push({imgId : data[i].pimgId})
			}
			console.log(dataArray);
			
			getImg(dataArray); */
			
			if (data.length > 0) {
				/* var imgTag = "<span><a class='btn btn-info btn-sm ml-2' id='allDownload'>전체 다운로드</a></span>";
				$("#progressImgWrapper").append(imgTag); */
				
				for (var i=0; i<data.length; i++) {
					console.log(data[i].pimgId);
					getImg(data[i].pimgId);
				}
			} else {
				var imgTag = "<div>등록된 이미지가 없습니다.</div>";
				$("#progressImgWrapper").append(imgTag);
			}
		});
	};
	
	
	function getImg(pimgId) {
		$.ajax({
			url: "fileList",
			data: {
				pimgId: pimgId
			},
			async: false, /* for loop로 ajax 호출시 순서가 뒤바뀌는 경우가 있음 이를 해결해주기 위해서 동기로 바꿈 */
		}).done((data) => {
			for (var i=0; i<imgInfo.length; i++) {
				var pimgCategory;
				var pimgContent;
				var pimgDate;
				var pimgOname;
				var pimgRegistrationDate;
				
				if (imgInfo[i].pimgId == pimgId) {
					pimgCategory = imgInfo[i].pimgCategory;
					pimgContent = imgInfo[i].pimgContent;
					pimgDate = imgInfo[i].pimgDate;
					pimgOname = (imgInfo[i].pimgOname.split('.jpg', 1));
					pimgRegistrationDate = imgInfo[i].pimgRegistrationDate
					
				}
			}
			
			/* var imgTag = "<div id='imgLayout' class='d-flex flex-column' style='margin-bottom: 2rem;'>";
			imgTag += "<div style='color: #7a7b7c; font-size: 0.9rem; float:right;'>등록일: " + pimgRegistrationDate + " ";
			imgTag += "<a href='javascript:;' class='progressImgDeleteBtn bi bi-x-lg' style='color: #7a7b7c;' data-del=";
			imgTag += pimgId;
			imgTag += "></a>";
			imgTag += "<span style='float:right'><a href='fileList?pimgId=";
			imgTag += pimgId; 
			imgTag += "' class='download bi bi-download'> 다운로드</a></span>";
			imgTag += "</div>";
			imgTag += "<div id='progressImg' style='height: 400px; margin-bottom: 1rem;' class='d-flex align-items-end'>";
			imgTag += "<img style='height: 100%; width: 100%;' src='fileList?pimgId=";
			imgTag += pimgId;
			imgTag += "'/>";
			imgTag += "</div>";
			imgTag += "<div>시공일: " + pimgDate + "</div>";
			imgTag += "<div>사진명: " + pimgOname + "</div>";
			imgTag += "<div>시공종류: " + pimgCategory + "</div>";
			
			if (pimgContent != null) {
				imgTag += "<div>내용 : " + pimgContent + "</div>";
			}
			imgTag += "</div>"; */
			
			
			
			var imgTag = "<div id='imgLayout' class='d-flex align-items-center my-3'>";
			imgTag += "<div id='progressImg' style='height: 200px; margin-bottom: 1rem;' class='col-4 d-flex flex-column align-items-start'>";
			imgTag += "<img style='height: 100%; width: 100%;' src='fileList?pimgId=";
			imgTag += pimgId;
			imgTag += "'/>";
			imgTag += "<span><a href='fileList?pimgId=";
			imgTag += pimgId; 
			imgTag += "' class='download bi bi-download'> 다운로드</a></span>";
			imgTag += "</div>";
			imgTag += "<div class='col-8' style='padding-left: 1rem;'>";
			imgTag += "<div>시공일: " + pimgDate + "</div>";
			imgTag += "<div>사진명: " + pimgOname + "</div>";
			imgTag += "<div>시공종류: " + pimgCategory + "</div>";
			
			if (pimgContent != null) {
				imgTag += "<div>내용: " + pimgContent + "</div>";
			}
			
			imgTag += "<div style='color: #7a7b7c; font-size: 0.9rem; float:right;'>등록일: " + pimgRegistrationDate + " ";
			imgTag += "<a href='javascript:;' class='progressImgDeleteBtn bi bi-x-lg' style='color: #7a7b7c;' data-del=";
			imgTag += pimgId;
			imgTag += "></a>";
			imgTag += "</div>";
			imgTag += "</div>";
			imgTag += "</div>";
		
			$("#progressImgWrapper").append(imgTag);
		});
	};
	
	/* 이미지 항목별 삭제 버튼 */
	 $(document).on("click",".progressImgDeleteBtn", function(){
		 var pimgId = $(this).attr("data-del");
		 
		 $.ajax({
			 url:"progressImgDeleteBtn",
			 type:'post',
	         data:{
	        	 pimgId:pimgId
	         }
		 }).done((data) => {
			console.log("delete 성공");
			$("#progressImgWrapper").html("");
			getProgressImg();
		 });
	 });
	
	</script>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>