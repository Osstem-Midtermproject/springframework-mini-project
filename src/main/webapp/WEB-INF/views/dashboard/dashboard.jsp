<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<main id="main" class="main">

	<div class="pagetitle d-flex align-items-end">
		<h1>대시보드</h1>
		<nav>
			<ol class="breadcrumb" style="margin-bottom: 0; padding: 0 0.5rem">
				<li class="breadcrumb-item">홈</li>
				<li class="breadcrumb-item active">대시보드</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-9">
				<!-- 첫번째줄 -->
				<div class="row">
					<div class="col-4">
						<!-- 매출액/계약건수 -->
						<div class="row d-flex flex-column">
							<!-- 매출액 -->
							<!-- Sales Card -->
							<div>
								<div class="card info-card sales-card" OnClick="location.href ='${pageContext.request.contextPath}/analysis/analysis'" style="cursor: pointer;">
									<div class="card-body">
										<h5 class="card-title">
											매출 <span>| Today</span>
										</h5>
										<div class="d-flex align-items-center">
											<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
												<i class="bi bi-cash-coin"></i>
											</div>
											<div class="ps-3">
												<h6 id="todaySale"></h6>
												<span id="salesper"class="small pt-1 fw-bold"></span><span id="salesspan" class="text-muted small pt-2 ps-1"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Sales Card -->

							<!-- 계약건수 -->
							<!-- Revenue Card -->
							<div>
								<div class="card info-card contract-card" OnClick="location.href ='${pageContext.request.contextPath}/analysis/analysis'" style="cursor: pointer;">
									<div class="card-body">
										<h5 class="card-title">
											계약건수 <span>| Today</span>
										</h5>
										<div class="d-flex align-items-center">
											<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
												<i class="bi bi-people-fill"></i>
											</div>
											<div class="ps-3">
												<h6 id="todayCon"></h6>
												<span id="conpercent"class=" small pt-1 fw-bold"></span> <span id="conspan" class="text-muted small pt-2 ps-1"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Contract Card -->
						</div>
					</div>
					
					<!-- 부서별 매출액 -->
					<div class="col-4">
						<div class="card"">
							<div class="card-body">
								<h5 class="card-title">
									부서 <span>| Quarterly</span>
								</h5>
								<div>
									<canvas id="teamChart" style="min-height: 34vh; min-width: 16vw"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 분기별 디자인 매출액 -->					
					<div class="col-4">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">
									디자인 <span>| Quarterly</span>
								</h5>
								<div>
									<canvas id="designChart" style="min-height: 34vh; min-width: 16vw"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 두번째줄 -->
				<div class="row">
					<!-- Reports -->
					<div class="col-12">
						<div class="card" OnClick="location.href ='${pageContext.request.contextPath}/analysis/analysis'" style="cursor: pointer;">
							<div class="card-body">
								<h5 class="card-title">매출&계약건수</h5>

								<!-- Line Chart -->
								<div id="reportsChart"></div>
								

								<!-- End Line Chart -->
							</div>
						</div>
					</div>
					<!-- End Reports -->
				</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<div class="col-lg-3">

				<!-- --------------------------------- Notification--------------------------------- -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							새소식 <span> | Today</span>
						</h5>
						<div class="activity dropdown d-flex justify-content-center align-items-center" style="padding-bottom: 15px;">
							<div class="alarm align-items-center justify-content-center">
								<span id="notificationTitle">${requestDetailsList[0].hospital.hname}</span><br> 
								<span>상담신청</span>
							</div>
							<a class="text-center icon position-relative " href="#" data-bs-toggle="dropdown">
								<i class="bi bi-bell-fill notification-icon" style="font-size: 3rem;"></i> 
								<span class="position-absolute start-100 translate-middle badge bg-danger badge-number" id="notificationNo" style="top: 30%"></span>
							</a>
							<!-- End Notification Icon -->

							<!-- ajax로 내용이 들어감 -->
							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications" id="notificationList">

							</ul>
							<!-- End Notification Dropdown Items -->
						</div>
						<div class="d-flex">
							<br>
						</div>
					</div>
				</div>
				<!-- --------------------------------- Notification 끝 --------------------------------- -->

				<!-- -------------------------------- 상담 Schedule List --------------------------------- -->
				<div class="col-12">
					<div class="card top-selling overflow-auto">
						<div class="card-body">
							<h5 class="card-title d-flex align-items-end justify-content-between">
								<div>상담 스케줄 <span> | Today</span></div>
								<div><a class="icon" href="${pageContext.request.contextPath}/schedule/counselingAndAsList"><i class="bi bi-three-dots"></i></a></div>
								
							</h5>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">병원</th>
										<th scope="col">날짜</th>
										<th scope="col">시간</th>
									</tr>
								</thead>
								
								<!-- ajax로 채워질 거임 -->
								<tbody id="counselingTable">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- -------------------------------- 상담 Schedule List 끝 --------------------------------- -->

				<!-- -------------------------------- 시공 Schedule List --------------------------------- -->
				<div class="col-12">
					<div class="card top-selling overflow-auto">

						<div class="card-body pb-0">
							<h5 class="card-title d-flex align-items-end justify-content-between">
								<div>시공 스케줄 <span> | Today</span></div>
								<div><a class="icon" href="${pageContext.request.contextPath}/schedule/counselingAndAsList" ><i class="bi bi-three-dots"></i></a></div>
							</h5>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">병원</th>
										<th scope="col">시작일</th>
										<th scope="col">종료일</th>
										<th scope="col">부서</th>
									</tr>
								</thead>
								
								<!-- ajax로 채워질 거임 -->
								<tbody id="constructionTable">

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- -------------------------------- 시공 Schedule List 끝 --------------------------------- -->

			</div>
			<!-- End Right side columns -->

		</div>
	</section>

</main>
<!-- End #main -->


<script>
	const teamYear=[];
  	const designlabel=[];
  	const designdata=[];
  	const allSales=[];//월별 연매출
  	for(let i=0;i<12;i++){
  		allSales.push(0);
  		teamYear.push(0);
  	}
  	<c:forEach var="yearSales" items="${yearSales}">
  	allSales[Number(moment("${yearSales.thd}").format('MM'))-1]="${yearSales.tha}";
  	</c:forEach>
  	
 	<c:forEach var="history" items="${history}">   
  		teamYear[Number("${history.thtid}")-1]=(Number("${history.tha}"));
 	</c:forEach>
 	<c:forEach var="designcon" items="${designcon}">   
		designdata.push(Number("${designcon.cno}"));
		designlabel.push("${designcon.contArea}");
	</c:forEach>
	
  $(function(){
	 
		if("${salespercent}"[0]!="-"){
			$("#salesspan").text("increase");
			$("#salesper").css("color","red");
		} else{
			$("#salesspan").text("decrease");
			$("#salesper").css("color","blue");
		}
		if("${conpercent}"[0]!="-"){
			$("#conspan").text("increase");
			$("#salesper").css("color","red");
		}else{
			$("#conspan").text("decrease");
			$("#conpercent").css("color","blue");
		}
  
  })
  
  const teamLabels = ["전기","설비","벽지","가구"];
 
  
       const teamData = {
                                labels: teamLabels,
                                datasets: [
                                  {
                                    label: teamLabels,
                                    backgroundColor: [
                                      "rgba(255, 99, 132, 0.2)",
                                      "rgba(120, 100, 200, 0.2)",
                                      "rgba(2000, 200, 132, 0.2)",
                                      "rgba(200, 2000, 132, 0.2)"
                                    ],
                                    data:  [teamYear[0]+teamYear[1]+teamYear[2],teamYear[3]+teamYear[4]+teamYear[5],teamYear[6]+teamYear[7]+teamYear[8],teamYear[9]+teamYear[10]+teamYear[11]],
                                    fill: false,
                                    tension: 0.1,
                                  },

                                ],
                              };

                              const teamConfig = {
                                type: "doughnut",
                                data: teamData,
                                options: {
                             
                                  responsive: true,
                                  plugins: {
                                      datalabels: {
                                           formatter: (value,teamData) => {
                                                  const datapoints = teamData.chart.data.datasets[0].data
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
                             

                              const team = new Chart(document.getElementById("teamChart"),teamConfig);
                              const designData = {
                                      labels: designlabel,
                                      datasets: [
                                        {
                                          label: designlabel,
                                          backgroundColor: [
                                        	  "rgb(32, 54, 68)",
                                              "#212529",
                                              "rgba(2000, 200, 132, 0.2)",
                                              "#df9974",
                                              "#8d8581",
                                              "rgba(255, 99, 132, 0.2)",
                                          ],
                                          data: designdata,
                                          fill: false,
                                          tension: 0.1,
                                        },

                                      ],
                                    };

                                    const designConfig = {
                                      type: "doughnut",
                                      data: designData,
                                      options: {
                                   
                                        responsive: true,
                                        plugins: {
                                            datalabels: {
                                                 
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
                                      
                                    };
                                   

                      const design = new Chart(document.getElementById("designChart"),designConfig);
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
                   
                   
                  
                      const yearChart = new Chart(document.getElementById("yearChart"), yearConfig);
                      document.addEventListener("DOMContentLoaded", () => {
                          new ApexCharts(document.querySelector("#reportsChart"), {
                            series: [
                              {
                                name: "Sales",
                                data: allSales,
                              },
                              {
                                  name: "Contract",
                                  data: [101, 302, 405, 302, 304, 502, 401, 407, 404, 501, 600, 602],
                                },
                              
                              
                            ],
                            yaxis: [
                                {
                                  title: {
                                    text: "Sales"
                                  },
                                },
                                {
                                  opposite: true,
                                  title: {
                                    text: "Contract"
                                  }
                                }
                              ],
                            chart: {
                              height: 350,
                              type: "area",
                              toolbar: {
                                show: false,
                              },
                              
                            },
                            markers: {
                              size: 4,
                            },
                            colors: ["#444444", "rgb(198, 171, 124)"],
                            fill: {
                              type: "gradient",
                              gradient: {
                                shadeIntensity: 1,
                                opacityFrom: 0.3,
                                opacityTo: 0.4,
                                stops: [0, 90, 100],
                              },
                            },
                            dataLabels: {
                              enabled: false,
                            },
                            stroke: {
                              curve: "smooth",
                              width: 2,
                            },
                            xaxis: {
                              categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                            },
                            tooltip: {
                              x: {
                                format: "yyyy-MM",
                              },
                            },
                          }).render();
                        });
	$(function() {
		notificationTimer = setInterval( function () {
			//----------------------------------------------------------------------------------
			$.ajax({
	        	url: 'dashNotification',
	            type: 'post',
	        }).done(function (result){
				
	        	var title = result.requestDetailsList[0];
	        	
	        	$("#notificationTitle").html(title.hospital.hname);
				$("#notificationNo").html(result.totalCount);		
				
				var str ="";
				str += "<li class='dropdown-header'>새로운 소식 " + result.totalCount + "개가 있습니다</li><li><hr class='dropdown-divider'></li>"

		        $.each(result.requestDetailsList,function(index,list){
		        	var text = list.rdTitle + " 상담신청";
		        	var date = list.rdApplicationdate.substr(0,10);
					str += "<li class='notification-item'><i class='bi bi-check-circle text-warning'></i><div><h4>" + text +"</h4><p>" + list.hospital.hname + " : " + date + "</p></div></li><li><hr class='dropdown-divider'></li>";

				})
				
				str += "<li class='dropdown-footer'><a href='${pageContext.request.contextPath}/schedule/counselingAndAsList'>전체보기</a></li>";
				
				$("#notificationList").html(str);	
			});
			//----------------------------------------------------------------------------------
		}, 1000); 
	});
	
	
	//---------------------------------------상담 스케줄 리스트-------------------------------------------
	$(function() {
		counselingTimer = setInterval( function () {
			$.ajax({
	        	url: 'dashCounselingList',
	            type: 'post',
	        }).done(function (result){

				var str ="";

		        $.each(result.counselingScheduleList,function(index,list){
		        	var date_month = list.counScheStartdate.substr(5,2);
		        	var date_day = list.counScheStartdate.substr(8,2);
		        	var time = list.counScheStartdate.substr(10,12);
		        	var time2 = time.substr(0,3) + "시";
					str += "<tr><td class='fw-bold'>" + list.hospital.hname + "</td><td>" + date_month + "/"+ date_day + "</td><td>" + time2 + "</td></tr>";

				})
				
				$("#counselingTable").html(str);	
			});
		}, 1000); 
	});

	//---------------------------------------시공 스케줄 리스트-------------------------------------------
	$(function() {
		constructionTimer = setInterval( function () {
			$.ajax({
	        	url: 'dashConstructionList',
	            type: 'post',
	        }).done(function (result){
				
				var str ="";

		        $.each(result.constructionScheduleList,function(index,list){
		        	var date1_month = list.consScheStartdate.substr(5,2);
		        	var date1_day = list.consScheStartdate.substr(8,2);
		        	var date2_month = list.consScheStartdate.substr(5,2);
		        	var date2_day = list.consScheStartdate.substr(8,2);
		        	
					str += "<tr><td class='fw-bold'>" + list.consScheHospitalName + "</td><td>" + date1_month + "/" + date1_day + "</td><td>" + date2_month + "/" + date2_day + "</td><td>" + list.team.tcategory + "</td></tr>";

				})
				
				$("#constructionTable").html(str);	
			});
		}, 1000); 
	});
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	$(function(){
		$({ val : 0 }).animate({ val : Number("${todaySales}") }, {
			  duration: 1500,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#todaySale").text("$"+num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#todaySale").text("$"+num);
			  }
		
		});
		$({ val : 0 }).animate({ val : Number("${salespercent}") }, {
			  duration: 1000,
			  step: function() {
			    var num = numberWithCommas(this.val.toFixed(1));
			    $("#salesper").text(num+"%");
			  },
			  complete: function() {
			    var num = numberWithCommas(this.val.toFixed(1));
			    $("#salesper").text(num+"%");
			  }
		
		});
		$({ val : 0 }).animate({ val : Number("${salespercent}") }, {
			  duration: 1000,
			  step: function() {
			    var num = numberWithCommas(this.val.toFixed(1));
			    $("#salesper").text(num+"%");
			  },
			  complete: function() {
			    var num = numberWithCommas(this.val.toFixed(1));
			    $("#salesper").text(num+"%");
			  }
		
		});
		$({ val : 0 }).animate({ val : Number("${todayCon}") }, {
			  duration: 500,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#todayCon").text(num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#todayCon").text(num);
			  }
		
		});
		$({ val : 0 }).animate({ val : Number("${conpercent}") }, {
			  duration: 500,
			  step: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#conpercent").text(num);
			  },
			  complete: function() {
			    var num = numberWithCommas(Math.floor(this.val));
			    $("#conpercent").text(num);
			  }
		
		});
	});
	
 </script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>