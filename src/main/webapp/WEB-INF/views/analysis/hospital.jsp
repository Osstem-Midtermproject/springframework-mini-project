<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<main id="main" class="main">
	<div class="d-flex flex-column">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Osstem Hospital</h5>
				<div class="chart-container">
					<canvas id="myChart3" style="height: 25vh; width: 50vw"></canvas>
				</div>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Details</h5>
				<table class="table table-dashboard mb-0 table-borderless fs--1 border-200">
					<thead class="bg-light">
						<tr class="text-900">
							<th>계약일</th>
							<th>매출(천원)</th>
							<th>순이익(천원)</th>
							<th>영업이익(천원)</th>
							<th>순이익률(천원)</th>
							<th>영업이익률(천원)</th>
						</tr>
					</thead>
					<tbody>
						<tr class="border-bottom border-200">
							<td class="fw-semi-bold">2012-04-07</td>
							<td class="fw-semi-bold">32,100,000</td>
							<td class="fw-semi-bold">19,000,000</td>
							<td class="fw-semi-bold">13,100,000</td>
							<td class="fw-semi-bold">5%</td>
							<td class="fw-semi-bold">2%</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-semi-bold">2017-04-07</td>
							<td class="fw-semi-bold">72,100,000</td>
							<td class="fw-semi-bold">59,000,000</td>
							<td class="fw-semi-bold">23,100,000</td>
							<td class="fw-semi-bold">11%</td>
							<td class="fw-semi-bold">6%</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-semi-bold">2020-04-07</td>
							<td class="fw-semi-bold">132,100,000</td>
							<td class="fw-semi-bold">119,000,000</td>
							<td class="fw-semi-bold">13,100,000</td>
							<td class="fw-semi-bold">20%</td>
							<td class="fw-semi-bold">12%</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-semi-bold">2021-04-07</td>
							<td class="fw-semi-bold">232,100,000</td>
							<td class="fw-semi-bold">119,000,000</td>
							<td class="fw-semi-bold">113,100,000</td>
							<td class="fw-semi-bold">30%</td>
							<td class="fw-semi-bold">18%</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-semi-bold">2022-04-07</td>
							<td class="fw-semi-bold">-32,100,000</td>
							<td class="fw-semi-bold">-19,000,000</td>
							<td class="fw-semi-bold">-13,100,000</td>
							<td class="fw-semi-bold">-20%</td>
							<td class="fw-semi-bold">-12%</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>
<script>
  
	
	
      const labels = ["January", "February", "March", "April", "May", "June","July","August","October","September","November","December"];
      const data3 = {
        labels: labels,
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
            data: [],
            fill: false,
            tension: 0.1,
          },
        ],
      };
   
  
      const config3 = {
        type: "line",
        data: data3,
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
      const myChart3 = new Chart(document.getElementById("myChart3"), config3);
    </script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>