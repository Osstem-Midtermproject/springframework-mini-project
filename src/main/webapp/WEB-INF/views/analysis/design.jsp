<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Design</h1>

      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item">Analysis</li>
          <li class="breadcrumb-item active">Design</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Thema</h5>

              <!-- Pie Chart -->
              <div id="pieChart-thema"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#pieChart-thema"), {
                    series: [60, 25, 15, 10],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['화이트', '블랙', '우드', '기타']
                  }).render();
                });
              </script>
              <!-- End Pie Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">테마별 Best - white and pink</h5>

                <div style="height: 352.7px;">
                  <img src="${pageContext.request.contextPath}/resources/images/analysis_design_themaBest.jpg" style="height: 100%;width: 100%;">
                </div>

            </div>
          </div>
        </div>
        
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Area</h5>

              <!-- Pie Chart -->
              <div id="pieChart-area"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#pieChart-area"), {
                    series: [44, 55, 13, 43],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['200~150', '150~100', '100~50', '기타']
                  }).render();
                });
              </script>
              <!-- End Pie Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">면적별 Best - 실용적인 진료</h5>

                <div style="height: 352.7px;">
                  <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" style="height: 100%;width: 100%;">
                </div>
            </div>
          </div>
        </div>
        
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Pie Chart</h5>

              <!-- Pie Chart -->
              <div id="pieChart-budget"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  new ApexCharts(document.querySelector("#pieChart-budget"), {
                    series: [55, 13, 43, 22],
                    chart: {
                      height: 350,
                      type: 'pie',
                      toolbar: {
                        show: true
                      }
                    },
                    labels: ['고예산', '평균예산', '저예산', '기타']
                  }).render();
                });
              </script>
              <!-- End Pie Chart -->

            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">예산별 Best - 효율적 배치</h5>

                <div style="height: 352.7px;">
                  <img src="${pageContext.request.contextPath}/resources/images/analysis_design_budgetBest.jpg" style="height: 100%;width: 100%;">
                </div>

            </div>
          </div>
        </div>
      </div>
    </section>
  </main><!-- End #main -->
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>