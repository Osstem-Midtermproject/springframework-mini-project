<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>병원</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item">병원</li>
					<li class="breadcrumb-item active">계약</li>
				</ol>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="card-body" style="padding: 20px 0;">
				<div class="col-xs-3" style="display: flex; flex-flow: row; justify-content: center;">
					<c:forEach items="${topContractList}" var="top" varStatus="status">
						<div class="card" onclick="location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=${top.hospital.hdln}'" style="width: 350px; height: 250px; margin-left: 1rem; margin-right: 1rem; margin-bottom: 2rem; cursor:pointer;">
							<div class="card-body " id="recentContract1">
								<div class="row" style="margin-bottom: 1rem">
									<h5 class="card-title">${top.hospital.hname}</h5>
								</div>
								<div class="row">
									<div class="col-6">
										<br>
										<h5>${top.hospital.hdirector}</h5>
										<span>${top.contDownPayment}</span><br>
										<span><fmt:formatDate value="${top.contDate}" pattern="yyyy-MM-dd"/></span>								
									</div>
									<div class="col-6">
										<img alt="1" src="${pageContext.request.contextPath}/resources/images/contract.png" width="100rem">
									</div>
								</div>
							</div>
						</div>
					</c:forEach> 
				</div>
			</div>
		</div>
	</div>

	<!-- 검색 및 검색 종류 -->
	<div class="search-bar">
		<div class="search-form d-flex align-items-center justify-content-end" method="POST"
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

	<table class="table table-borderless" style="margin-top: 1rem; margin-bottom: 2rem;">
		<thead class="bg-light">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">병원이름</th>
				<th scope="col">병원장 이름</th>
				<th scope="col">계약일</th>
				<th scope="col">계약금</th>
				<th scope="col">계약상태</th>
				<th scope="col">계약서</th>
			</tr>
		</thead>
		<tbody id=contractListTable>
		</tbody>
	</table>
	</div>
	</div>
	<!-- End Table with hoverable rows -->

	<div id="contractTableListPager">
		<%@ include file="/WEB-INF/views/common/pagination3.jsp"%>
	</div>
</main>
<!-- End #main -->

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
        	
        	/* if(index<3) {
     		firstStr = "<h5 class='card-title'>" + list.hospital.hname + "</h5>";
     		firstStr += "<span>" + list.hospital.hdirector + "</span><br>";
     		firstStr += "<span>" + list.contDownPayment + "</span>";
     		firstStr += "<span>" + list.contDate + "</span>";
     		firstStr += "<img alt='1' src='${pageContext.request.contextPath}/resources/images/contract.png' width='100rem'>";
        	}     
    		if(index==0) {
         	$("#recentContract1").html(firstStr);                			
    		} else if(index==1) {
         	$("#recentContract2").html(firstStr);                			
    		} else if(index==2) {
         	$("#recentContract3").html(firstStr);                			
    		} */

            str = str + "<tr><td>"+list.cno+
        	"</td><td style='cursor: pointer;' onclick = location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln="+list.hospital.hdln+"'>"+list.hospital.hname+"</td><td>"+list.hospital.hdirector+
        	"</td><td>"+list.contDate+"</td><td>"+list.contDownPayment+"</td>";
        	        
        	if(list.contStatus==1){
        		str += "<td>계약완료</td>";
        	}else{
        	    str += "<td>계약파기</td>";
        	}

        	if(list.cont != null){
        	    str += "<td><a class='btn btn-sm btn-secondary' style='font-size: x-small;' href='${pageContext.request.contextPath}/hospital/contractFormPdfAdmin?fileNum="+list.contIdentificationNumber+"'>계약서 보기</a></td>";                   
        	}else{
        	    str += "<td><a class='btn btn-sm btn-secondary disabled' style='font-size: x-small;'>계약서 보기</a></td>";     		
        	}
        	str += "</tr>";

       	})
        	    
    	$("#contractListTable").html(str);
        	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH(1)'><span>&laquo;</span></a></li>";
        
	  	if(result.groupNo > 1){
	  		var no = result.startPageNo-1;
	  		str2 += "<li class='page-item'><a class='page-link' onclick='searchH("+ no +")'><span>&lsaquo;</span></a></li>";
	  	}
        
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
        	if(i != result.pageNo){
        		str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH(" +i + ")'>" +i +"</a></li>";
        	}else{
        	    str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='searchH(" +i + ")'>" +i +"</a></li>";
        	}
       	}

        
      if(result.groupNo < result.totalGroupNo){
    	  var num = result.endPageNo +1;
    	  str2 += "<li class='page-item'><a class='page-link' onclick='searchH(" + num + ")'><span>&rsaquo;</span></a></li>";
      }
        
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";

        $("#contractTableListPager").html(str2);
    });
 }
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>