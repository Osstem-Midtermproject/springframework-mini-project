<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
	<div class="analysis_design">
		<div class="pagetitle">
			<h1>Design</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Home</li>
					<li class="breadcrumb-item">Analysis</li>
					<li class="breadcrumb-item active">Design</li>
				</ol>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Desing Image</h5>
					<div class="d-flex flex-row">
						<c:forEach var="design" items="${design}" begin="0" end="2" step="1"  varStatus="status">
							<div><img style="height: 150px; width: 200px" src="${design}"/></div>
						</c:forEach>
					</div>
					<div class="d-flex flex-row">
						<c:forEach var="design" items="${design}" begin="3" end="5" step="1"  varStatus="status">
							<div><img style="height: 150px; width: 200px" src="${design}" /></div>
						</c:forEach>
					</div>
					<div class="d-flex flex-row">
						<c:forEach var="design" items="${design}" begin="6" end="8" step="1"  varStatus="status">
							<div><img style="height: 150px; width: 200px" src="${design}"/></div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Design Image</h5>
					<hr />
					<c:forEach var="dcon" items="${dcon}" varStatus="status">
						<div class="d-flex flex-row">
                			<div style="font-size: 30px">${status.count}</div>
                			<div id="${dcon.contDetails}"class="mx-4" style="font-size: 30px">${dcon.contArea}</div>
                			<span>32</span><span>↑23</span>
                			<div style="margin-left: auto"><img style="height: 100%; width: 50px" src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" /></div>
              				</div>
              			<hr />
					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<!-- End Page Title -->
</main>
<script>
$(function(){
	$("#white").hover(function(){
		console.log(1);
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"white"
        				
           }
            
          }).done((data)=>{
        	 
        	  console.log(data);        	
        		        	  
          });
	}, function() {
   		
	});
})
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>