<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
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
		<div class="col-lg-12">
			<div class="card">
				<div id="designcontent" class="card-body">
					<h5 class="card-title">Thema Ranking</h5>
					<div class="d-flex justify-content-between" style="margin: 0 auto;">
						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">1</span> 
							<img id="${themaRank[0].dtt}"  src="${themaRank[0].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<span style="font-size: 2rem; font-weight: 500;">#${themaRank[0].dtt}</span>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">2</span> 
							<img id="${themaRank[1].dtt}"  src="${themaRank[1].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> <span style="font-size: 2rem; font-weight: 500;">#${themaRank[1].dtt}</span>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">3</span> 
							<img id="${themaRank[2].dtt}" src="${themaRank[2].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<span style="font-size: 2rem; font-weight: 500;">#${themaRank[2].dtt}</span>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">4</span> 
							<img id="${themaRank[3].dtt}"  src="${themaRank[3].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<span style="font-size: 2rem; font-weight: 500;">#${themaRank[3].dtt}</span>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">5</span> 
							<img id="${themaRank[4].dtt}"  src="${themaRank[4].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<span style="font-size: 2rem; font-weight: 500;">#${themaRank[4].dtt}</span>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">6</span> 
							<img id="${themaRank[5].dtt}"  src="${themaRank[5].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<span style="font-size: 2rem; font-weight: 500;">#${themaRank[5].dtt}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Design Ranking by Thema</h5>
					<nav style="margin-bottom: 2rem">
						<div class="nav nav-tabs nav-tabs-bordered justify-content-center" id="nav-tab" role="tablist">
							<c:forTokens var="dtt" items="Black,Blue,Gray,Pastel,White,Wood" delims=",">
								<c:if test="${dtt == 'Black'}">
									<button class="nav-link active" data-bs-toggle="tab" data-bs-target="#nav-${dtt}" type="button" role="tab" aria-controls="nav-${dtt}" aria-selected="true" style="font-weight: 500; font-size: 2rem;">${dtt}</button>
								</c:if>
								<c:if test="${dtt != 'Black'}">
									<button class="nav-link" data-bs-toggle="tab" data-bs-target="#nav-${dtt}" type="button" role="tab" aria-controls="nav-${dtt}" aria-selected="false" style="font-weight: 500; font-size: 2rem;">${dtt}</button>
								</c:if>
							</c:forTokens>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<c:forTokens var="dtt" items="Black,Blue,Gray,Pastel,White,Wood" delims=",">
							<c:if test="${dtt == 'Black'}">
								<div class="tab-pane fade show active" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Black}" varStatus="status" begin="0" end="3">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Black}" varStatus="status" begin="4" end="7">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>					
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Blue'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Blue}" varStatus="status" begin="0" end="3">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Blue}" varStatus="status" begin="4" end="7">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>					
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Gray'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Gray}" varStatus="status" begin="0" end="3">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Gray}" varStatus="status" begin="4" end="7">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>					
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Pastel'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Pastel}" varStatus="status" begin="0" end="3">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Pastel}" varStatus="status" begin="4" end="7">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>					
								</div>
							</c:if>
							
							<c:if test="${dtt == 'White'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${White}" varStatus="status" begin="0" end="3">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${White}" varStatus="status" begin="4" end="7">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>					
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Wood'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Wood}" varStatus="status" begin="0" end="3">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>
									<div class="d-flex justify-content-between">
										<c:forEach var="i" items="${Wood}" varStatus="status" begin="4" end="7">
											<!-- card -->
											<div class="col-lg-3">
												<div class="card card border info-card revenue-card">
													<div class="card-body">
														<div class="d-flex align-items-center flex-column">
															<img src="${i.contAddress}" alt="" style="width: 300px; height: 200px; border-radius: 1rem; margin-top: 1rem"><br>
											 				<span>${i.contDln}</span>
														</div>
													</div>
							
												</div>
											</div>
											<!-- End Revenue Card -->
										</c:forEach>
									</div>					
								</div>
							</c:if>
						</c:forTokens>
					</div>



					<%-- 					<hr />
					<c:forEach var="dcon" items="${dcon}" varStatus="status">
						<div class="d-flex flex-row">
							<div style="font-size: 30px">${status.count}</div>
							<div id="${dcon.contDetails}" class="mx-4" style="font-size: 30px">${dcon.contArea}</div>
							<span>32</span><span>↑23</span>
							<div style="margin-left: auto">
								<img style="height: 100%; width: 50px" src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" />
							</div>
						</div>
						<hr />
					</c:forEach> --%>

				</div>
			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Osstem Hospital</h5>
			<div class="chart-container">
				<canvas id="myChart3" style="height: 25vh; width: 60vw"></canvas>
			</div>
		</div>
	</div>
	<!-- End Page Title -->
</main>
<script>
$(function(){
	$("#White").hover(function(){
		
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"White"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			 
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	
        	  $("#design1").html(str1);
        	  
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        	  
        		        	  
          });
	}, function() {
   		
	});
	$("#Pastel").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Pastel"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			 
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Black").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Black"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			  
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Blue").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Blue"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			  
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Gray").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Gray"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			  
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Wood").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Wood"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
})
   		
        const yearData = {
          
          datasets: [
            {
              label: "월별 매출 추이",

              backgroundColor: [
                //색상
                "rgba(54, 162, 235, 0.2)",
              ],
              borderColor: [
                //경계선 색상
                "rgba(54, 200, 235, 0.6)",
              ],
             
              fill: false,
              tension: 0.1,
            },
          ],
        };
     
      
        const yearConfig = {
          type: "bar",
          data: yearData,
          options: { 
        	indexAxis: 'y',
            responsive: true,
            plugins: {
            	datalabels: {
            		 formatter: (value, yearData) => {
            		        const datapoints = yearData.chart.data.datasets[0].data
            		        const total = datapoints.reduce((total, datapoint) => total + datapoint, 0)
            		        const percentage = value / total * 100
            		        return percentage.toFixed(2) + "%";
            		  },
                  },
              legend: {
                labels: {
                  font: {
                    size: 15,
                  },
                },
              },
            },
          },
          plugins: [ChartDataLabels],
        };
     
        const themaChart = new Chart(document.getElementById("myChart3"), yearConfig);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>