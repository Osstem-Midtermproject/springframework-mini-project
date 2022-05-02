<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

	<div class="card">
		<div class="card-body">
			<h5 class="card-title">계약 기록</h5>

			<!-- Table with hoverable rows -->

			<section >
				<div class="col-xs-3" style="display: flex; flex-flow: row; justify-content: center;">
					<c:forEach items="${topContractList}" var="top" varStatus="status">
						<div class="card" style="width: 300px; height: 250px; margin-left: 2rem; margin-right: 2rem;">
							<div class="card-body" id="recentContract1">
								<h5 class="card-title">${top.hospital.hname}<h6>${top.hospital.hdirector}</h6></h5>
								<span>${top.contDownPayment}</span><br>
								<span><fmt:formatDate value="${top.contDate}" pattern="yyyy-MM-dd"/></span><br>
								<img alt="1" src="${pageContext.request.contextPath}/resources/images/contract.png" width="100rem">
							</div>
						</div>
					</c:forEach> 
					
<%-- 					<!-- Default Card -->
					<div class="card"
						style="width: 300px; height: 250px; margin-left: 30px; margin-right: 30px;">
						<div class="card-body" id="recentContract1">
							<h5 class="card-title">Default Card</h5>
							<img alt="1" src="${pageContext.request.contextPath}/resources/images/contract.png" width="100rem">
						</div>
					</div>
					<!-- End Default Card -->

					<div class="card"
						style="width: 300px; height: 250px; margin-left: 30px; margin-right: 30px;">
						<div class="card-body" id="recentContract2">
							<h5 class="card-title">Default Card</h5>
							<img alt="2" src="${pageContext.request.contextPath}/resources/images/contract.png" width="100rem">
						</div>
					</div>
					<!-- End Default Card -->

					<div class="card"
						style="width: 300px; height: 250px; margin-left: 30px; margin-right: 30px;">
						<div class="card-body" id="recentContract3">
							<h5 class="card-title">Default Card</h5>
							<img alt="3" src="${pageContext.request.contextPath}/resources/images/contract.png" width="100rem">
						</div>
					</div>
					<!-- End Default Card --> --%>
				</div>
			</section>

			<!-- 검색 및 검색 종류 -->
			<div class="search-bar">
				<div class="search-form d-flex align-items-center" method="POST"
					action="#">
					<div class="col-xs-4">
						<div class="invalid-feedback">Please select a valid state.</div>
					</div>
					<input id="searchBar" type="text" name="query"
						placeholder="Search Hospital" value="${searchBar}"
						title="Enter search keyword">
					<button id="searchButton" type="button" title="Search"
						onclick="searchH(1)">
						<i class="bi bi-search"></i>
					</button>
				</div>
			</div>

			<table class="table table-hover" style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
				<thead>
					<th scope="col">번호</th>
					<th scope="col">병원이름</th>
					<th scope="col">병원장 이름</th>
					<th scope="col">계약일</th>
					<th scope="col">계약금</th>
					<th scope="col">계약상태</th>
					<th scope="col">계약서</th>
				</thead>
				<tbody id=contractListTable>


				</tbody>
			</table>
			<!-- End Table with hoverable rows -->

			<div id="contractTableListPager">
				<%@ include file="/WEB-INF/views/common/pagination3.jsp"%>
			</div>

			<script type="text/javascript">
			
				$(document).ready(function(){
					searchH(1);
			    });
			
				$('#searchButton').submit(function(e){
					e.preventDefault();
				});
					
                function searchH(no) { 
                    let searchBar = $("#searchBar").val();
                    $.ajax({
                    	url: 'search',
                    	type: 'post',
                   		data: {"searchBar": searchBar , "pageNo": no}
                   	}).done(function (result){
                    		
              		var str="";
              		var firstStr="";

                    $.each(result.searchContractList,function(index,list){
                    	
/*                 		if(index<3){
	                		firstStr = "<h5 class='card-title'>" + list.hospital.hname + "</h5>";
	                		firstStr += "<span>" + list.hospital.hdirector + "</span><br>";
	                		firstStr += "<span>" + list.contDownPayment + "</span>";
	                		firstStr += "<span>" + list.contDate + "</span>";
	                		firstStr += "<img alt='1' src='${pageContext.request.contextPath}/resources/images/contract.png' width='100rem'>";
                    	}     
                		if(index==0){
	                    	$("#recentContract1").html(firstStr);                			
                		}else if(index==1){
	                    	$("#recentContract2").html(firstStr);                			
                		}else if(index==2){
	                    	$("#recentContract3").html(firstStr);                			
                		} */

                        str = str + "<tr><td>"+list.cno+
                    	"</td><td>"+list.hospital.hname+"</td><td>"+list.hospital.hdirector+
                    	"</td><td>"+list.contDate+"</td><td>"+list.contDownPayment+"</td>";
                    	        
                    	if(list.contStatus==1){
                    		str += "<td>계약완료</td>";
                    	    str += "<td><a class='btn btn-sm btn-secondary' style='font-size: x-small;' href='${pageContext.request.contextPath}/hospital/contractFormPdfAdmin?fileNum="+list.contIdentificationNumber+"'>계약서 보기</a></td>";                   
                    	}else{
                    	    str += "<td>계약파기</td>";
                    	    str += "<td><a class='btn btn-sm btn-secondary disabled' style='font-size: x-small;'>계약서 보기</a></td>";
                    	}

                    	str += "</tr>";

                   	})
                    	    
                	$("#contractListTable").html(str);
                    	  
                    var str2 ="<ul class='pagination justify-content-center'>";
                    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH(1)'><span>&laquo;</span></a></li>";
                    for(var i=result.startPageNo; i<=result.endPageNo; i++){
                    	if(i != result.pageNo){
                    		str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH(" +i + ")'>" +i +"</a></li>";
                    	}else{
                    	    str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='searchH(" +i + ")'>" +i +"</a></li>";
                    	}
                   	}
                    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
                    str2 = str2 + "</ul>";

                    $("#contractTableListPager").html(str2);
                });
             }
      	
</script>
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>