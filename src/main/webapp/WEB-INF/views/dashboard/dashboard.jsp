<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
    </div><!-- End Page Title -->

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
                    <div class="card info-card sales-card">
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

                      <div class="card-body" >
                        <h5 class="card-title">Sales <span>| Today</span></h5>
                        <div class="d-flex align-items-center">
                          <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                            <i class="bi bi-cash-coin"></i>
                          </div>
                          <div class="ps-3" >
                            <h6>$4,000</h6>
                            <span class="text-danger small pt-1 fw-bold">12%</span> <span class="text-muted small pt-2 ps-1">increase</span>
                          </div>
                        </div>
                      </div>

                    </div>
                  </div><!-- End Sales Card -->
                  <!-- 계약건수 -->
                  <!-- Revenue Card -->
                  <div>
                    <div class="card info-card revenue-card">
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
                        <h5 class="card-title">Contract <span>| Today</span></h5>

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
                  </div><!-- End Revenue Card -->
                </div>
            </div>

            <div class="col-xxl-7 col-md-7">
              <!-- 분기별 매출액 -->
              <div class="">
                <div class="card">
                  <div class="card-body pb-0">
                    <h5 class="card-title">Sales <span>| Quarterly</span></h5>
                    <div id="trafficChart" style="min-height: 20rem;" class="echart"></div>
                    <script>
                      document.addEventListener("DOMContentLoaded", () => {
                        echarts.init(document.querySelector("#trafficChart")).setOption({
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
                </div><!-- End Website Traffic -->
              </div>
            </div>
        
          </div>
          <!-- 두번째줄 -->
          <div class="row">
              <!-- Reports -->
          <div class="col-12">
            <div class="card">

              <div class="card-body">
                <h5 class="card-title">Analysis </h5>

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
          </div><!-- End Reports -->
          </div>


        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">

          <!-- Recent Activity -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">New Notification <p> <span> - Today</span></p></h5>

              <div class="activity dropdown d-flex justify-content-center align-items-center" style="padding-bottom: 15px;">
                <div class="alarm">
                  <span>미래치과 상담신청</span>
                </div>  
                
                <a class="text-center icon" href="#" data-bs-toggle="dropdown">
                    <i class="bi bi-bell-fill notification-icon" style="font-size: 3rem;"></i>
                    <span class="badge bg-danger badge-number align-text-top">4</span>
                  </a><!-- End Notification Icon -->
                  
        
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                    <li class="dropdown-header">
                      You have 4 new notifications
                    </li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
        
                    <li class="notification-item">
                      <i class="bi bi-check-circle text-warning"></i>
                      <div>
                        <h4>상담 신청</h4>
                        <p>미래치과 : 2022.04.16</p>
                      </div>
                    </li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
        
                    <li class="notification-item">
                      <i class="bi bi-check-circle text-warning"></i>
                      <div>
                        <h4>AS 신청</h4>
                        <p>주영치과 : 2022.04.15</p>
                      </div>
                    </li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
        
                    <li class="notification-item">
                      <i class="bi bi-check-circle text-warning"></i>
                      <div>
                        <h4>상담 신청</h4>
                        <p>미래치과 : 2022.04.09</p>
                      </div>
                    </li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
        
                    <li class="notification-item">
                      <i class="bi bi-check-circle text-warning"></i>
                      <div>
                        <h4>상담 신청</h4>
                        <p>미래치과 : 2022.04.06</p>
                      </div>
                    </li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>

                    <li class="dropdown-footer">
                      <a href="#">Show all notifications</a>
                    </li>
        
                  </ul><!-- End Notification Dropdown Items -->
              </div>
              <div class="d-flex">
                <br>
              </div>

            </div>
          </div><!-- End Recent Activity -->

          
            <!-- Top Selling -->
            <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="card-body pb-0">
                  <h5 class="card-title">AS/상담 Schedule <span> | This week</span></h5>
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
                        <td >주영치과</td>
                        <td>4월 11일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">AS</td>
                        <td >병천치과</td>
                        <td>4월 11일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">상담</td>
                        <td>혜현치과</td>
                        <td>4월 09일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">상담</td>
                        <td >강윤치과</td>
                        <td>4월 08일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">AS</td>
                        <td >혜현치과</td>
                        <td>4월 07일</td>
                      </tr>
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End Top Selling -->

             <!-- Top Selling -->
             <div class="col-12">
              <div class="card top-selling overflow-auto">

                <div class="card-body pb-0">
                  <h5 class="card-title">시공 Schedule <span> | This week</span></h5>
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
                        <td >주영치과</td>
                        <td>4월 11일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">전기</td>
                        <td >병천치과</td>
                        <td>4월 11일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">인테리어</td>
                        <td>혜현치과</td>
                        <td>4월 09일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">인테리어</td>
                        <td >강윤치과</td>
                        <td>4월 08일</td>
                      </tr>
                      <tr>
                        <td class="fw-bold">전기</td>
                        <td >혜현치과</td>
                        <td>4월 07일</td>
                      </tr>
                    </tbody>
                  </table>

                </div>

              </div>
            </div><!-- End Top Selling -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

 <%@ include file="/WEB-INF/views/common/footer.jsp"%>