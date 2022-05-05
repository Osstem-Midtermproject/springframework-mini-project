<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

	<div class="pagetitle">
		<h1>Dashboard</h1>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">

			<!-- Left side columns -->
			<div class="col-lg-8">
				<!-- 첫번째줄 -->
				<div class="row">
					<div class="col-xxl-5 col-md-5">
						<!-- 매출액/계약건수 -->
						<div class="row d-flex flex-column">
							<!-- 매출액 -->
							<!-- Sales Card -->
							<div>
								<div class="card info-card sales-card" OnClick="location.href ='${pageContext.request.contextPath}/analysis/analysis'" style="cursor: pointer;">
									<div class="filter">
										<a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
										<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
											<li class="dropdown-header text-start">
												<h6>Filter</h6>
											</li>
											<li><a class="dropdown-item" href="#">Today</a></li>
											<li><a class="dropdown-item" href="#">This Month</a></li>
											<li><a class="dropdown-item" href="#">This Year</a></li>
										</ul>
									</div>

									<div class="card-body">
										<h5 class="card-title">
											Sales <span>| Today</span>
										</h5>
										<div class="d-flex align-items-center">
											<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
												<i class="bi bi-cash-coin"></i>
											</div>
											<div class="ps-3">
												<h6>$4,000</h6>
												<span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>
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
									<div class="filter">
										<a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
										<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
											<li class="dropdown-header text-start">
												<h6>Filter</h6>
											</li>
											<li><a class="dropdown-item" href="#">Today</a></li>
											<li><a class="dropdown-item" href="#">This Month</a></li>
											<li><a class="dropdown-item" href="#">This Year</a></li>
										</ul>
									</div>

									<div class="card-body">
										<h5 class="card-title">
											Contract <span>| Today</span>
										</h5>
										<div class="d-flex align-items-center">
											<div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
												<i class="bi bi-people-fill"></i>
											</div>
											<div class="ps-3">
												<h6>5건</h6>
												<span class="text-danger small pt-1 fw-bold">2건</span> <span class="text-muted small pt-2 ps-1">increase</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Contract Card -->
						</div>
					</div>

					<div class="col-xxl-7 col-md-7">
						<!-- 분기별 디자인 매출액 -->
						<div class="card" OnClick="location.href ='${pageContext.request.contextPath}/analysis/design'" style="cursor: pointer;">
							<div class="card-body pb-0">
								<h5 class="card-title">
									Design <span>| Quarterly</span>
								</h5>
								<div id="designSalesChart" style="min-height: 20rem;" class="echart"></div>
								<script>
                     document.addEventListener("DOMContentLoaded", () => {
                       echarts.init(document.querySelector("#designSalesChart")).setOption({
                         tooltip: {
                           trigger: 'item'
                         },
                         legend: {
                           top: '5%',
                           left: 'center'
                         },
                         series: [{
                           name: 'Access From',
                           type: 'pie',
                           radius: ['40%', '70%'],
                           avoidLabelOverlap: false,
                           label: {
                             show: false,
                             position: 'center'
                           },
                           emphasis: {
                             label: {
                               show: true,
                               fontSize: '18',
                               fontWeight: 'bold'
                             }
                           },
                           labelLine: {
                             show: false
                           },
                           data: [{
                               value: 500,
                               name: '1분기'
                             },
                             {
                               value: 735,
                               name: '2분기'
                             },
                             {
                               value: 580,
                               name: '3분기'
                             },
                             {
                               value: 484,
                               name: '4분기'
                             }
                           ]
                         }]
                       });
                     });
                   </script>
							</div>
						</div>
						<!-- End Design Sales -->
					</div>
				</div>

				<!-- 두번째줄 -->
				<div class="row">
					<!-- Reports -->
					<div class="col-12">
						<div class="card" OnClick="location.href ='${pageContext.request.contextPath}/analysis/analysis'" style="cursor: pointer;">
							<div class="card-body">
								<h5 class="card-title">Analysis</h5>

								<!-- Line Chart -->
								<div id="reportsChart"></div>

								<script>
	                  document.addEventListener("DOMContentLoaded", () => {
	                    new ApexCharts(document.querySelector("#reportsChart"), {
	                      series: [{
	                        name: 'Sales',
	                        data: [3188, 4088, 2888, 5188, 4288, 8288, 5688, 4488, 5088, 6288, 7788, 8088],
	                      }, {
	                        name: 'Contract',
	                        data: [101, 302, 405, 302, 304, 502, 401, 407, 404, 501, 600, 602]
	                      }],
	                      chart: {
	                        height: 350,
	                        type: 'area',
	                        toolbar: {
	                          show: false
	                        },
	                      },
	                      markers: {
	                        size: 4
	                      },
	                      colors: ['rgb(147, 147, 138)', '#f26522'],
	                      fill: {
	                        type: "gradient",
	                        gradient: {
	                          shadeIntensity: 1,
	                          opacityFrom: 0.3,
	                          opacityTo: 0.4,
	                          stops: [0, 90, 100]
	                        }
	                      },
	                      dataLabels: {
	                        enabled: false
	                      },
	                      stroke: {
	                        curve: 'smooth',
	                        width: 2
	                      },
	                      xaxis: {
	                        categories: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	                      },
	                      tooltip: {
	                        x: {
	                          format: 'yyyy-MM'
	                        },
	                      }
	                    }).render();
	                  });
	                </script>
								<!-- End Line Chart -->
							</div>
						</div>
					</div>
					<!-- End Reports -->
				</div>
			</div>
			<!-- End Left side columns -->

			<!-- Right side columns -->
			<div class="col-lg-4">

				<!-- --------------------------------- Notification--------------------------------- -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							New Notification <span> | Today</span>
						</h5>
						<div class="activity dropdown d-flex justify-content-center align-items-center" style="padding-bottom: 15px;">
							<div class="alarm align-items-center justify-content-center">
								<span id="notificationTitle"></span><br> <span>상담신청</span>
							</div>
							<a class="text-center icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell-fill notification-icon" style="font-size: 3rem;"></i> <span class="badge bg-danger badge-number align-text-top" id="notificationNo"></span>
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
						<div class="card-body pb-0">
							<h5 class="card-title">
								Counseling Schedule <span> | Today</span>
								<a class="icon" href="${pageContext.request.contextPath}/schedule/counselingAndAsList"><i class="bi bi-three-dots"></i></a>
							</h5>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">Dental name</th>
										<th scope="col">Date</th>
										<th scope="col">Time</th>
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
							<h5 class="card-title">
								Construction Schedule <span> | Today</span>
								<a class="icon" href="${pageContext.request.contextPath}/schedule/counselingAndAsList" ><i class="bi bi-three-dots"></i></a>
							</h5>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">Dental name</th>
										<th scope="col">Start Date</th>
										<th scope="col">End Date</th>
										<th scope="col">Category</th>
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

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	
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
		        	var date = list.counScheStartdate.substr(0,10);
		        	var time = list.counScheStartdate.substr(10,12);
		        	var time2 = time.substr(0,3) + "시";
					str += "<tr><td class='fw-bold'>" + list.hospital.hname + "</td><td>" + date + "</td><td>" + time2 + "</td></tr>";

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
				console.log(result);
				var str ="";

		        $.each(result.constructionScheduleList,function(index,list){
		        	var date1 = list.consScheStartdate.substr(0,10);
		        	var date2 = list.consScheEnddate.substr(0,10);
					str += "<tr><td class='fw-bold'>" + list.consScheHospitalName + "</td><td>" + date1 + "</td><td>" + date2 + "</td><td>" + list.team.tcategory + "</td></tr>";

				})
				
				$("#constructionTable").html(str);	
			});
		}, 1000); 
	});
	
 </script>