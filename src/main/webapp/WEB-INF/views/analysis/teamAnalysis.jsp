<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<main id="main" class="main">
   <div class="analysis_team">
	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>부서</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item">분석통계</li>
					<li class="breadcrumb-item active">부서</li>
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
							<canvas id="myChart3" style="height: 25vh; width: 45vw"></canvas>
					</div>
	            </div>
          	</div>
       	</div>
   	</div>

    <section class="section">
       <div class="row">
          <div class="col-lg-3">
             <div class="card">
                <div class="card-body">
                   <h5 class="card-title">전기</h5>
                   <div class="chart-container">
                      <canvas id="electricityDoughnutChart1" style="height: 25vh; width: 50vw"></canvas>
                   </div>
                </div>
             </div>
          </div>

          <div class="col-lg-3">
             <div class="card">
                <div class="card-body">
                   <h5 class="card-title">설비</h5>
                   <div class="chart-container">
                      <canvas id="electricityDoughnutChart2" style="height: 25vh; width: 50vw"></canvas>
                   </div>
                </div>
             </div>
          </div>

          <div class="col-lg-3">
             <div class="card">
                <div class="card-body">
                   <h5 class="card-title">도배</h5>
                   <div class="chart-container">
                      <canvas id="electricityDoughnutChart3" style="height: 25vh; width: 50vw"></canvas>
                   </div>
                </div>
             </div>
          </div>

          <div class="col-lg-3">
             <div class="card">
                <div class="card-body">
                   <h5 class="card-title">가구</h5>
                   <div class="chart-container">
                      <canvas id="electricityDoughnutChart4" style="height: 25vh; width: 50vw"></canvas>
                   </div>
                </div>
             </div>
          </div>
       </div>
    </section>
</main>
<!-- End #main -->
<script>
   const allSales=[];//월별 연매출
   const partTeamYear=[];//팀별 연매출
   const partTeamFirst=[];
   const partTeamSecond=[];
   const partTeamThird=[];
   const partTeamFourth=[];
   for(let i=0;i<12;i++){
        partTeamYear.push(0);
        partTeamFirst.push(0);
        partTeamSecond.push(0);
        partTeamThird.push(0);
        partTeamFourth.push(0);
     }
     $(function () 
      {   $('#btnall').hover(function(){
         $.ajax({
               url:"teamajax",
               type:'post',
              data:{"sdate":"2022-01-01",
                       "edate":"2022-12-31"
              }
               
             }).done((data)=>{
              yearChart.data.datasets[0].data=partTeamYear;
                electeam.data.datasets[0].data= [partTeamYear[0],partTeamYear[1],partTeamYear[2]];
                equipteam.data.datasets[0].data= [partTeamYear[3],partTeamYear[4],partTeamYear[5]];
                paperingteam.data.datasets[0].data= [partTeamYear[6],partTeamYear[7],partTeamYear[8]];
                furnitureteam.data.datasets[0].data= [partTeamYear[9],partTeamYear[10],partTeamYear[11]];
                yearChart.update();
                electeam.update();
                equipteam.update();
                paperingteam.update();
                furnitureteam.update();
                
                
             });
         
          }, function() {
                
          });
          $('#btn1').hover(function(){
             $.ajax({
                  url:"teamajax",
                  type:'post',
                 data:{"sdate":"2022-01-01",
                          "edate":"2022-03-31"
                 }
                  
                }).done((data)=>{
                 
                 for(s of data.sales){
                    partTeamFirst[Number(s.thtid)-1]=Number(s.tha);
                 }
                 console.log(partTeamFirst);
                 yearChart.data.datasets[0].data=partTeamFirst;
                   electeam.data.datasets[0].data= [partTeamFirst[0],partTeamFirst[1],partTeamFirst[2]];
                   equipteam.data.datasets[0].data= [partTeamFirst[3],partTeamFirst[4],partTeamFirst[5]];
                   paperingteam.data.datasets[0].data= [partTeamFirst[6],partTeamFirst[7],partTeamFirst[8]];
                   furnitureteam.data.datasets[0].data= [partTeamFirst[9],partTeamFirst[10],partTeamFirst[11]];
                   yearChart.update();
                   electeam.update();
                   equipteam.update();
                   paperingteam.update();
                   furnitureteam.update();
                   
                   
                });
          }, function() {
            
          });
          $('#btn2').hover(function(){
             $.ajax({
                  url:"teamajax",
                  type:'post',
                 data:{"sdate":"2022-04-01",
                          "edate":"2022-06-30"
                 }
                  
                }).done((data)=>{
                   for(s of data.sales){
                       partTeamSecond[Number(s.thtid)-1]=Number(s.tha);
                    }
                 yearChart.data.datasets[0].data=partTeamSecond;
                 electeam.data.datasets[0].data= [partTeamSecond[0],partTeamSecond[1],partTeamSecond[2]];
                 equipteam.data.datasets[0].data= [partTeamSecond[3],partTeamSecond[4],partTeamSecond[5]];
                 paperingteam.data.datasets[0].data= [partTeamSecond[6],partTeamSecond[7],partTeamSecond[8]];
                 furnitureteam.data.datasets[0].data= [partTeamSecond[9],partTeamSecond[10],partTeamSecond[11]];
                 yearChart.update();
                 electeam.update();
                 equipteam.update();
                 paperingteam.update();
                 furnitureteam.update();
                   
                   
                });
          }, function() {
            
          });
          $('#btn3').hover(function(){
             $.ajax({
                  url:"teamajax",
                  type:'post',
                 data:{"sdate":"2022-07-01",
                          "edate":"2022-09-30"
                 }
                  
                }).done((data)=>{
                   for(s of data.sales){
                       partTeamThird[Number(s.thtid)-1]=Number(s.tha);
                    }
                 
                 yearChart.data.datasets[0].data=partTeamThird;
                 electeam.data.datasets[0].data= [partTeamThird[0],partTeamThird[1],partTeamThird[2]];
                 equipteam.data.datasets[0].data= [partTeamThird[3],partTeamThird[4],partTeamThird[5]];
                 paperingteam.data.datasets[0].data= [partTeamThird[6],partTeamThird[7],partTeamThird[8]];
                 furnitureteam.data.datasets[0].data= [partTeamThird[9],partTeamThird[10],partTeamThird[11]];
                 yearChart.update();
                 electeam.update();
                 equipteam.update();
                 paperingteam.update();
                 furnitureteam.update();
                   
                   
                });
          }, function() {
             
          });
          $('#btn4').hover(function(){
             $.ajax({
                  url:"teamajax",
                  type:'post',
                 data:{"sdate":"2022-10-01",
                          "edate":"2022-12-31"
                 }
                  
                }).done((data)=>{
                   for(s of data.sales){
                       partTeamFourth[Number(s.thtid)-1]=Number(s.tha);
                    } 
                 
                 yearChart.data.datasets[0].data=partTeamFourth;   
                  electeam.data.datasets[0].data= [partTeamFourth[0],partTeamFourth[1],partTeamFourth[2]];
                  equipteam.data.datasets[0].data= [partTeamFourth[3],partTeamFourth[4],partTeamFourth[5]];
                  paperingteam.data.datasets[0].data= [partTeamFourth[6],partTeamFourth[7],partTeamFourth[8]];
                  furnitureteam.data.datasets[0].data= [partTeamFourth[9],partTeamFourth[10],partTeamFourth[11]];
                  yearChart.update();
                  electeam.update();
                  equipteam.update();
                  paperingteam.update();
                  furnitureteam.update();
                   
                   
                });
          }, function() {
             
          });
      });
  
    <c:forEach var="sales" items="${sales}">   
      partTeamYear[Number("${sales.thtid}")-1]=(Number("${sales.tha}"));
   </c:forEach>
    console.log(partTeamYear);
 
   const dataCount = 3;
    const numberCfg = {count: dataCount};
   
    const labels = ["A팀", "B팀", "C팀"];
    const electricityData = {
      labels: labels,
      datasets: [
        {
          label: "월별 매출 추이",
          backgroundColor: [
            "rgba(255, 99, 132, 0.2)",
            "rgba(120, 100, 200, 0.2)",
            "rgba(2000, 200, 132, 0.2)"
          ],
          data: [partTeamYear[0],partTeamYear[1],partTeamYear[2]],
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
            datalabels: {
                formatter: (value, electricityData) => {
                       const datapoints = electricityData.chart.data.datasets[0].data
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
   

    const electeam = new Chart(document.getElementById("electricityDoughnutChart1"), electricityConfig);
    
    const equipmentData = {
             labels: labels,
             datasets: [
               {
                 label: "월별 매출 추이",
                 backgroundColor: [
                   "rgba(255, 99, 132, 0.2)",
                   "rgba(120, 100, 200, 0.2)",
                   "rgba(2000, 200, 132, 0.2)"
                 ],
                 data: [partTeamYear[3],partTeamYear[4],partTeamYear[5]],
                 fill: false,
                 tension: 0.1,
               },

             ],
           };

           const equipmentConfig = {
             type: "doughnut",
             data:  equipmentData,
             options: {
               responsive: true,
               plugins: {
                   datalabels: {
                        formatter: (value, equipmentData) => {
                               const datapoints =  equipmentData.chart.data.datasets[0].data
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
          

           const equipteam = new Chart(document.getElementById("electricityDoughnutChart2"),equipmentConfig);
           
           const paperingData = {
                    labels: labels,
                    datasets: [
                      {
                        label: "월별 매출 추이",
                        backgroundColor: [
                          "rgba(255, 99, 132, 0.2)",
                          "rgba(120, 100, 200, 0.2)",
                          "rgba(2000, 200, 132, 0.2)"
                        ],
                        data:  [partTeamYear[6],partTeamYear[7],partTeamYear[8]],
                        fill: false,
                        tension: 0.1,
                      },

                    ],
                  };

                  const paperingConfig = {
                    type: "doughnut",
                    data: paperingData,
                    options: {
                      
                      responsive: true,
                      plugins: {
                          datalabels: {
                               formatter: (value, paperingData) => {
                                      const datapoints = paperingData.chart.data.datasets[0].data
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
                 

                  const paperingteam = new Chart(document.getElementById("electricityDoughnutChart3"),paperingConfig);
                  
                  
                  const furnitureData = {
                           labels: labels,
                           datasets: [
                             {
                               label: "월별 매출 추이",
                               backgroundColor: [
                                 "rgba(255, 99, 132, 0.2)",
                                 "rgba(120, 100, 200, 0.2)",
                                 "rgba(2000, 200, 132, 0.2)"
                               ],
                               data:  [partTeamYear[9],partTeamYear[10],partTeamYear[11]],
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
                                 datalabels: {
                                      formatter: (value, furnitureData) => {
                                             const datapoints = furnitureData.chart.data.datasets[0].data
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
                        

                         const furnitureteam = new Chart(document.getElementById("electricityDoughnutChart4"),furnitureConfig);
     
  
        
        const yearLabels = ["전기A", "전기B", "전기C", "설비A", "설비B", "설비C","도배A","도배B","도배C","가구A","가구B","가구C"];
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
              data: partTeamYear,
              fill: false,
              tension: 0.1,
            },
          ],
        };
     
      
        const yearConfig = {
          type: "bar",
          data: yearData,
          options: {               
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
     
        const yearChart = new Chart(document.getElementById("myChart3"), yearConfig);
        
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>