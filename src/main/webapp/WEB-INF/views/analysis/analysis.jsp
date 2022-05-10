<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<main id="main" class="main">
	<div class="analysis_team">
		<div class="d-flex">
			<div class="pagetitle d-flex align-items-end">
				<h1>매출</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">홈</li>
						<li class="breadcrumb-item">분석통계</li>
						<li class="breadcrumb-item active">매출</li>
					</ol>
				</nav>
			</div>
		</div>
		<div class="d-flex">
			<div class="col-12">
				<div class="card">
					<div class="card-body" style="padding-top: 20px;">
						<div class="chart-container d-flex align-items-center" style="padding: 20px 0 15px 0;">
							<div class="col-3">
								<div class="d-flex align-items-center">
									<p style="font-weight: 600; font-size: large; text-align: center; margin-bottom: 0;">Year</p>
									<select class="form-select border-1 mx-2" style="font-weight: 500;">									
										<option value="1" selected>2022</option>
										<option value="2">2021</option>
										<option value="3">2020</option>
										<option value="4">2019</option>
									</select>
								</div>
							</div>
							<div class="col-3">
								<div class="d-flex align-items-center justify-content-around ">
									<p style="font-weight: 600; font-size: large; text-align: center; margin-bottom: 0rem;">Quarter</p>
									<button id="btnall" class="btn btn-sm btn-outline-secondary">전체</button>
									<button id="btn1" class="btn btn-sm btn-outline-secondary">1분기</button>
									<button id="btn2" class="btn btn-sm btn-outline-secondary">2분기</button>
									<button id="btn3" class="btn btn-sm btn-outline-secondary">3분기</button>
									<button id="btn4" class="btn btn-sm btn-outline-secondary">4분기</button>
								</div>
							</div>
						</div>
						
						<div class="chart-container" style="padding: 20px 0 15px 0; margin-bottom: 0.5rem;">
							<canvas id="myChart3" style="height: 25vh; width: 60vw"></canvas>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">세부항목</h5>

				<%@ include file="/WEB-INF/views/common/calendar.jsp"%>

				<table class="table table-dashboard table-borderless fs--1 border-200" style="margin-top: 1rem;">
					<thead class="bg-light">
						<tr class="text-900">
							<th>날짜</th>
							<th>총 매출(원)</th>
							<th>추가 매출(원)</th>
							<th>순이익(원)</th>
							<th>영업이익(원)</th>					
						</tr>
					</thead>
					<tbody id="contbody">
						
					</tbody>
				</table>
				
				<div id="salesListPager">
				
				</div>
			</div>
		</div>
	</div>
</main>

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
	
	  const yearLabels =["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	
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
      
    //데이트피커 + 페이저 추가
    //시작일과 종료일이 모두 선택되었을 때만 작동	
	$('#enddate').change(function() {
		let sdate = $("#startdate").val();
		let edate = $("#enddate").val();
		
		if(sdate !== '' && edate !== ''){
			salesList(1);
		}
	});
      
	$(document).ready(function(){
		salesList(1);
	});
	
	//알림 리스트를 보여주는-------------------------------------------------------------------------
	function salesList(no) { 
		//시작일 종료일
		let sdate = $("#startdate").val();
		let edate = $("#enddate").val();
		
		//시작일과 종료일이 선택되지 않았다면 일괄적으로 이번 년도로 검색 
		if(sdate === '' && edate === ''){
			sdate='2022-01-01';
			edate='2022-12-31';
		}
		
        $.ajax({
        	url: 'salesList',
            type: 'post',
            data: {"sdate":sdate, "edate":edate, "pageNo": no}
        }).done(function (result){
               
        	console.log(result);
        	
	       	var str="";
	        
	        $.each(result.salesList,function(index,list){
	        	
	        	str += "<tr class='border-bottom border-200'><td class='fw-semi-bold'>" + list.contDate + "</td>"
				str = str + "<td>"+ list.contDownPayment +"</td><td>" + list.contAdditionalAmount + "</td><td>" +  (Number(list.contDownPayment)+Number(list.contAdditionalAmount))/10*7 + "</td><td>" +   (Number(list.contDownPayment)+Number(list.contAdditionalAmount))/10*5+ "</td><tr>"
	
			})   
	
	        $("#contbody").html(str);
	                    	  
	        var str2 ="<ul class='pagination justify-content-center'>";
	        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='salesList(1)'><span>&laquo;</span></a></li>"; 
	         
    	  	if(result.groupNo > 1){
    	  		var no = result.startPageNo-1;
    	  		str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='salesList("+ no +")'><span>&lsaquo;</span></a></li>";
    	  	}
	        
	        for(var i=result.startPageNo; i<=result.endPageNo; i++){
	            if(i != result.pageNo){
	                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='salesList(" +i + ")'>" +i +"</a></li>";
	            }else{
	                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link text-primary' onclick='salesList(" +i + ")'>" +i +"</a></li>";
	            }
	        }

	    	if(result.groupNo < result.totalGroupNo){
	        	var num = result.endPageNo +1;
	        	str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='salesList(" + num + ")'><span>&rsaquo;</span></a></li>";
			}
	        
	        str2 = str2 + "<li style='cursor:pointer;' 	class='page-item'><a class='page-link' onclick='salesList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
	        str2 = str2 + "</ul>";
	        
			$("#salesListPager").html(str2);
				
		});
	}
   
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>