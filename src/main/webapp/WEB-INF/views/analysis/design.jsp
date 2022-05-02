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
		<div class="col-lg-6">
			<div class="card">
				<div id="designcontent"class="card-body">
					<h5 class="card-title">Desing Image</h5>
					<div id="design1" class="d-flex flex-row">
						<c:forEach var="design" items="${design}" begin="0" end="2" step="1" varStatus="status">
							<div>
								<img style="height: 150px; width: 200px" src="${design}" />
							</div>
						</c:forEach>
					</div>
					<div id="design2" class="d-flex flex-row">
						<c:forEach var="design" items="${design}" begin="3" end="5" step="1" varStatus="status">
							<div>
								<img style="height: 150px; width: 200px" src="${design}" />
							</div>
						</c:forEach>
					</div>
					<div id="design3" class="d-flex flex-row">
						<c:forEach var="design" items="${design}" begin="6" end="8" step="1" varStatus="status">
							<div>
								<img style="height: 150px; width: 200px" src="${design}" />
							</div>
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
							<div id="${dcon.contDetails}" class="mx-4" style="font-size: 30px">${dcon.contArea}</div>
							<span>32</span><span>↑23</span>
							<div style="margin-left: auto">
								<img style="height: 100%; width: 50px" src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" />
							</div>
						</div>
						<hr />
					</c:forEach>

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
	$("#white").hover(function(){
		
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"white"
        				
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
	$("#pastel").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"pastel"
        				
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
	$("#black").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"black"
        				
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
	$("#blue").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"blue"
        				
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
	$("#gray").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"gray"
        				
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
	$("#wood").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"wood"
        				
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