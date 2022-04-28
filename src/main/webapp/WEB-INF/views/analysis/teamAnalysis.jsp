<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
	<div class="analysis_team">
		<div class="pagetitle">
			<h1>Team</h1>

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Home</li>
					<li class="breadcrumb-item">Analysis</li>
					<li class="breadcrumb-item active">Team</li>
				</ol>
			</nav>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Electricity Team</h5>
							<div class="chart-container">
								<canvas id="electricityDoughnutChart"
									style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Facility Team</h5>
							<div class="chart-container">
								<canvas id="facilityDoughnutChart"
									style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Wallpaper Team</h5>
							<div class="chart-container">
								<canvas id="wallpaperDoughnutChart"
									style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Furniture Team</h5>
							<div class="chart-container">
								<canvas id="furnitureDoughnutChart"
									style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
			      const dataCount = 3;
			      const numberCfg = {count: dataCount, min:0, max:100};
			
			      const labels = ["A팀", "B팀", "C팀"];
			      
			      const electricityData = {
			        labels: labels,
			        datasets: [
			          {
			              backgroundColor: [
			              "rgba(255, 99, 132, 0.2)",
			              "rgba(120, 100, 200, 0.2)",
			              "rgba(255, 200, 132, 0.2)"
			            ],
			            data: [],
			            fill: false,
			            tension: 0.1,
			          },
			
			        ],
			      };
			
			      const electricityConfig = {
			        type: "doughnut",
			        data: electricityData,
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
			      //데이터 추가
			      electricityData.datasets[0].data.push("${sumA1}");
			      electricityData.datasets[0].data.push("${sumB2}");
			      electricityData.datasets[0].data.push("${sumC3}");
			
			      const electricityDoughnutChart = new Chart(document.getElementById("electricityDoughnutChart"), electricityConfig);

			      //설비
			      const facilityData = {
			        labels: labels,
			        datasets: [
			          {
			              backgroundColor: [
			              "rgba(255, 99, 132, 0.2)",
			              "rgba(120, 100, 200, 0.2)",
			              "rgba(255, 200, 132, 0.2)"
			            ],
			            data: [],
			            fill: false,
			            tension: 0.1,
			          },
			
			        ],
			      };
			
			      const facilityConfig = {
			        type: "doughnut",
			        data: facilityData,
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
			      //데이터 추가
			      facilityData.datasets[0].data.push("${sumA4}");
			      facilityData.datasets[0].data.push("${sumB5}");
			      facilityData.datasets[0].data.push("${sumC6}");
			
			      const facilityDoughnutChart = new Chart(document.getElementById("facilityDoughnutChart"), facilityConfig);

			      //도배
			      const wallpaperData = {
			        labels: labels,
			        datasets: [
			          {
			            backgroundColor: [
			              "rgba(255, 99, 132, 0.2)",
			              "rgba(120, 100, 200, 0.2)",
			              "rgba(255, 200, 132, 0.2)"
			            ],
			            data: [],
			            fill: false,
			            tension: 0.1,
			          },
			
			        ],
			      };
			
			      const wallpaperConfig = {
			        type: "doughnut",
			        data: wallpaperData,
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
			      //데이터 추가
			      wallpaperData.datasets[0].data.push("${sumA7}");
			      wallpaperData.datasets[0].data.push("${sumB8}");
			      wallpaperData.datasets[0].data.push("${sumC9}");
			
			      const wallpaperDoughnutChart = new Chart(document.getElementById("wallpaperDoughnutChart"), facilityConfig);

			      //가구
			      const furnitureData = {
			        labels: labels,
			        datasets: [
			          {
    			          backgroundColor: [
			              "rgba(255, 99, 132, 0.2)",
			              "rgba(120, 100, 200, 0.2)",
			              "rgba(255, 200, 132, 0.2)"
			            ],
			            data: [],
			            fill: false,
			            tension: 0.1,
			          },
			
			        ],
			      };
			
			      const furnitureConfig = {
			        type: "doughnut",
			        data: furnitureData,
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
			      //데이터 추가
			      furnitureData.datasets[0].data.push("${sumA10}");
			      furnitureData.datasets[0].data.push("${sumB11}");
			      furnitureData.datasets[0].data.push("${sumC12}");
			
			      const furnitureDoughnutChart = new Chart(document.getElementById("furnitureDoughnutChart"), furnitureConfig);
		    </script>

		</section>
	</div>
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>