<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<<<<<<< HEAD
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<main id="main" class="main">
	<div class="analysis_team">
		<div class="d-flex flex-row">
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
								<button id="btnall" class="btn btn-sm btn-outline-secondary" onclick="show1()">전체</button>
								<button id="btn1" class="btn btn-sm btn-outline-secondary" onclick="show1()">1분기</button>
								<button id="btn2"class="btn btn-sm btn-outline-secondary" onclick="show2()">2분기</button>
								<button id="btn3"class="btn btn-sm btn-outline-secondary" onclick="show3()">3분기</button>
								<button id="btn4"class="btn btn-sm btn-outline-secondary" onclick="show4()">4분기</button>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Osstem Hospital</h5>
					<div class="chart-container">
						<canvas id="myChart3" style="height: 25vh; width: 45vw"></canvas>
					</div>
				</div>
			</div>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Electricity Team</h5>
							<div class="chart-container">
								<canvas id="electricityDoughnutChart1" style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Equipment Team</h5>
							<div class="chart-container">
								<canvas id="electricityDoughnutChart2" style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Papering Team</h5>
							<div class="chart-container">
								<canvas id="electricityDoughnutChart3" style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Furniture Team</h5>
							<div class="chart-container">
								<canvas id="electricityDoughnutChart4" style="height: 25vh; width: 50vw"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
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
		{	$('#btnall').hover(function(){
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
=======

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
>>>>>>> refs/remotes/origin/JY
