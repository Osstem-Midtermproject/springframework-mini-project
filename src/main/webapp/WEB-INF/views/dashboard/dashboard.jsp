<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
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
					<div class="col-xxl-4  col-md-5">
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
												<h6>$${todaySales}</h6>
												<span class="text-danger small pt-1 fw-bold">${salespercent}%</span><span id="salesspan" class="text-muted small pt-2 ps-1"></span>
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
												<h6>${todayCon}</h6>
												<span class="text-danger small pt-1 fw-bold">${conpercent}</span> <span id="conspan" class="text-muted small pt-2 ps-1"></span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Contract Card -->
						</div>
					</div>

					<div class="col-xxl-8 col-md-7 d-flex flex-row">
						<!-- 분기별 디자인 매출액 -->
						<div class="col-6">
							<div class="card">
								<div class="card-body pb-0">
									<h5 class="card-title">
										Department<span>| Quarterly</span>
									</h5>
									<div>
										<canvas id="teamChart" style="min-height: 34vh; min-width: 16vw"></canvas>
									</div>

								</div>
							</div>
							<!-- End Website Traffic -->
						</div>

						<div class="col-6">
							<div class="card">
								<div class="card-body pb-0">
									<h5 class="card-title">
										Design<span>| Quarterly</span>
									</h5>
									<div>
										<canvas id="designChart" style="min-height: 34vh; min-width: 16vw"></canvas>
									</div>


								</div>
							</div>
							<!-- End Website Traffic -->
						</div>
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
								<canvas id="yearChart"></canvas>
								

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

				<!-- Recent Activity -->
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">
							New Notification
							<p>
								<span> - Today</span>
							</p>
						</h5>

						<div class="activity dropdown d-flex justify-content-center align-items-center" style="padding-bottom: 15px;">
							<div class="alarm">
								<span>미래치과 상담신청</span>
							</div>

							<a class="text-center icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell-fill notification-icon" style="font-size: 3rem;"></i> <span class="badge bg-danger badge-number align-text-top">4</span>
							</a>
							<!-- End Notification Icon -->

							<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
								<li class="dropdown-header">새로운 소식 4개가 있습니다</li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li class="notification-item"><i class="bi bi-check-circle text-warning"></i>
									<div>
										<h4>상담 신청</h4>
										<p>미래치과 : 2022.04.16</p>
									</div></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li class="notification-item"><i class="bi bi-check-circle text-warning"></i>
									<div>
										<h4>AS 신청</h4>
										<p>주영치과 : 2022.04.15</p>
									</div></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li class="notification-item"><i class="bi bi-check-circle text-warning"></i>
									<div>
										<h4>상담 신청</h4>
										<p>미래치과 : 2022.04.09</p>
									</div></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li class="notification-item"><i class="bi bi-check-circle text-warning"></i>
									<div>
										<h4>상담 신청</h4>
										<p>미래치과 : 2022.04.06</p>
									</div></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li class="dropdown-footer"><a href="${pageContext.request.contextPath}/hospital/processing">전체보기</a></li>

							</ul>
							<!-- End Notification Dropdown Items -->
						</div>
						<div class="d-flex">
							<br>
						</div>

					</div>
				</div>
				<!-- End Recent Activity -->


				<!-- Top Selling -->
				<div class="col-12">
					<div class="card top-selling overflow-auto">

						<div class="card-body pb-0">
							<h5 class="card-title">
								AS/상담 Schedule <span> | Today</span>
							</h5>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">Category</th>
										<th scope="col">Dental name</th>
										<th scope="col">Date</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fw-bold">AS</td>
										<td>주영치과</td>
										<td>4월 11일</td>
									</tr>
									<tr>
										<td class="fw-bold">AS</td>
										<td>병천치과</td>
										<td>4월 11일</td>
									</tr>
									<tr>
										<td class="fw-bold">상담</td>
										<td>혜현치과</td>
										<td>4월 09일</td>
									</tr>
									<tr>
										<td class="fw-bold">상담</td>
										<td>강윤치과</td>
										<td>4월 08일</td>
									</tr>
									<tr>
										<td class="fw-bold">AS</td>
										<td>혜현치과</td>
										<td>4월 07일</td>
									</tr>
								</tbody>
							</table>

						</div>

					</div>
				</div>
				<!-- End Top Selling -->

				<!-- Top Selling -->
				<div class="col-12">
					<div class="card top-selling overflow-auto">

						<div class="card-body pb-0">
							<h5 class="card-title">
								시공 Schedule <span> | Today</span>
							</h5>
							<table class="table table-borderless">
								<thead>
									<tr>
										<th scope="col">Category</th>
										<th scope="col">Dental name</th>
										<th scope="col">Date</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="fw-bold">벽지</td>
										<td>주영치과</td>
										<td>4월 11일</td>
									</tr>
									<tr>
										<td class="fw-bold">전기</td>
										<td>병천치과</td>
										<td>4월 11일</td>
									</tr>
									<tr>
										<td class="fw-bold">인테리어</td>
										<td>혜현치과</td>
										<td>4월 09일</td>
									</tr>
									<tr>
										<td class="fw-bold">인테리어</td>
										<td>강윤치과</td>
										<td>4월 08일</td>
									</tr>
									<tr>
										<td class="fw-bold">전기</td>
										<td>혜현치과</td>
										<td>4월 07일</td>
									</tr>
								</tbody>
							</table>

						</div>

					</div>
				</div>
				<!-- End Top Selling -->

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
	 
		if("${todaySales}"[0]!="-"){
			$("#salesspan").text("increase");
			
		} else{
			$("#salesspan").text("decrease");
		}
		if("${todayCon}"[0]!="-"){
			$("#conspan").text("increase");
		}else{
			$("#conspan").text("decrease");
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
                                        	  "rgba(255, 99, 132, 0.2)",
                                              "rgba(120, 100, 200, 0.2)",
                                              "rgba(2000, 200, 132, 0.2)",
                                              "rgba(200, 2000, 132, 0.2)",
                                              "rgba(200, 200, 2002, 0.2)",
                                              "rgba(200, 10, 132, 0.2)",
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
  </script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>