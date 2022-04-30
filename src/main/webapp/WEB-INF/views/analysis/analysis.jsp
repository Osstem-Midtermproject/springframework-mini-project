<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<main id="main" class="main">
	<div class="analysis_team">
		<div class="d-flex flex-row">
			<div class="pagetitle">
				<h1>Sales</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">Home</li>
						<li class="breadcrumb-item">Analysis</li>
						<li class="breadcrumb-item active">Sales</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="d-flex flex-row">
			<div class="card col-3">
				<div class="card-body">
					<h5 class="card-title">Search sales by Team</h5>
					<div class="chart-container">
						<div class="row">
							<div class="col-md-12">
								<p style="font-weight: 600; font-size: large; text-align: center; margin-bottom: 0.3rem;">Year</p>
								<select class="form-select border-1" style="font-weight: 500; margin-bottom: 1.5rem;">
									<option selected>Select year</option>
									<option value="1">2022</option>
									<option value="2">2021</option>
									<option value="3">2020</option>
									<option value="4">2019</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<p style="font-weight: 600; font-size: large; border-bottom: 1px solid lightgray; text-align: center; margin-bottom: 0.3rem;">Quarter</p>
								<button id="btnall" class="btn btn-sm btn-outline-secondary">전체</button>
								<button id="btn1" class="btn btn-sm btn-outline-secondary">1분기</button>
								<button id="btn2" class="btn btn-sm btn-outline-secondary">2분기</button>
								<button id="btn3" class="btn btn-sm btn-outline-secondary">3분기</button>
								<button id="btn4" class="btn btn-sm btn-outline-secondary">4분기</button>
							</div>
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
		</div>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Details</h5>
				<table class="table table-dashboard mb-0 table-borderless fs--1 border-200">
					<thead class="bg-light">
						<tr class="text-900">
							<th>월</th>
							<th>계약건수</th>
							<th>매출(천원)</th>
							<th>순이익(천원)</th>
							<th>영업이익(천원)</th>
							<th>순이익률(천원)</th>
							<th>영업이익률(천원)</th>
						</tr>
					</thead>
					<tbody id="contbody">
						<c:forEach var="contract" items="${contract}">
							<tr class="border-bottom border-200">
								<td class="fw-semi-bold">
									<fmt:formatDate value="${contract.contDate}" pattern="yyyy-MM-dd" />
								</td>
								<td class="fw-semi-bold">${contract.contDownPayment}</td>
								<td class="fw-semi-bold">${contract.contAdditionalAmount }</td>
								<td class="fw-semi-bold">19,000,000</td>
								<td class="fw-semi-bold">13,100,000</td>
								<td class="fw-semi-bold">5%</td>
								<td class="fw-semi-bold">2%</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script>

const allSales=[];//월별 연매출
for(let i=0;i<12;i++){
	allSales.push(0)
}
<c:forEach var="yearSales" items="${yearSales}">
	allSales[Number(moment("${yearSales.thd}").format('MM'))-1]="${yearSales.tha}";
</c:forEach>
console.log(allSales);
$(function () 
		{	$('#btnall').hover(function(){
			 yearChart.data.labels=yearLabels;
       	 	 yearChart.data.datasets[0].data=allSales;
			 yearChart.update();	
	    	}, function() {
	       		
	    	});
		    $('#btn1').hover(function(){
		    	$.ajax({
		            url:"yearajax",
		            type:'post',
		           data:{"sdate":"2022-01-01",
		        				"edate":"2022-03-31"
		           }
		            
		          }).done((data)=>{
		        	 
		        	  yearChart.data.labels=data.day;
		        	  yearChart.data.datasets[0].data=data.amount;
		        	  yearChart.update();
		          	
		        		        	  
		          });
		    }, function() {
		      	
		    });
		    $('#btn2').hover(function(){
		    	$.ajax({
		            url:"yearajax",
		            type:'post',
		           data:{"sdate":"2022-04-01",
		        				"edate":"2022-06-30"
		           }
		            
		          }).done((data)=>{
		        	
		        	  yearChart.data.labels=data.day;
		        	  yearChart.data.datasets[0].data=data.amount;
		        	  yearChart.update();
		          	
		        		        	  
		          });
		    }, function() {
		      
		    });
		    $('#btn3').hover(function(){
		    	$.ajax({
		            url:"yearajax",
		            type:'post',
		           data:{"sdate":"2022-07-01",
		        				"edate":"2022-09-30"
		           }
		            
		          }).done((data)=>{
		        	
		        	  yearChart.data.labels=data.day;
		        	  yearChart.data.datasets[0].data=data.amount;
		        	  yearChart.update();
		          	
		        		        	  
		          });
		    }, function() {
		       
		    });
		    $('#btn4').hover(function(){
		    	$.ajax({
		            url:"yearajax",
		            type:'post',
		           data:{"sdate":"2022-10-01",
		        				"edate":"2022-12-31"
		           }
		            
		          }).done((data)=>{
		        	
		        	  yearChart.data.labels=data.day;
		        	  yearChart.data.datasets[0].data=data.amount;
		        	  yearChart.update();
		          	
		        		        	  
		          });
		    }, function() {
		       
		    });
		});
	
	  const yearLabels = [ "January", "February", "March", "April", "May", "June","July","August","October","September","November","December"];
	
      const yearData = {
        labels: yearLabels,
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
            data: allSales,
            fill: false,
            tension: 0.1,
          },
        ],
      };
   
    
      const yearConfig = {
        type: "line",
        data: yearData,
        options: { 	     		
          responsive: true,
          plugins: {
          
            legend: {
              labels: {
                font: {
                  size: 15,
                },
              },
            },
          },
        },
        
      };
   
   
  
      const yearChart = new Chart(document.getElementById("myChart3"), yearConfig);
   
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>