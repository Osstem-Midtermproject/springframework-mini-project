<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>


<main id="main" class="main">
    <div class="dentist_processing">

      <div class="pagetitle">
        <h1>Processing</h1>

        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item">Schedule</li>
            <li class="breadcrumb-item active">Team</li>
          </ol>
        </nav>

      </div><!-- End Page Title -->

      <section class="section">
        <div class="team">
          <div class="row">
            <div class="col-lg-9">
              <div class="card" style = "width:80rem">
                <div class="card-body">
                  <h5 class="card-title">고평가 팀</h5>

                  <div class="col-lg-4">

                    <!-- Team Card -->
                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">전기 A팀</h5>
                          <i class="bi bi-star-fill" style="filter: invert(88%) sepia(66%) saturate(1049%) hue-rotate(359deg) brightness(101%) contrast(103%);"></i>
                        </div>
                        <div class="img-wrapper d-flex align-items-center">
                          <i class="bi bi-person-circle"></i>
                          <i class="bi bi-person-circle"></i>
                          <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          <div>
                          	점수 </div>
                          	<br>
                          <div>
                          구성원 </div>
                          <br>
                          <div>개수</div>
                        </div>
                      </div>
                    </div><!-- End Tem Card -->
                  </div>
                </div>
              </div>
              
             
            
              <div class="card" style = "width:80rem">
                <div class="card-body">
                  <h5 class="card-title">팀 목록</h5>
                  <div class="team-wrapper d-flex">
                  
                  
                  
                  
                    <div class="col-lg-4">
                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=1'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">전기 A팀</h5>
                            <i class="bi bi-star-fill" style="filter: invert(88%) sepia(66%) saturate(1049%) hue-rotate(359deg) brightness(101%) contrast(103%);"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=2'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">전기 B팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=3'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">전기 C팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                    </div>

                    <div class="col-lg-4">

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=7'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">도배 A팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=8'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">도배 B팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=9'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">도배 C팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                    </div>
                    
                     <div class="col-lg-4">

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=10'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">가구 A팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=11'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">가구 B팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=12'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">가구 C팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                    </div>

                    <div class="col-lg-4">

                      <!-- Team Card -->
                      <div class="card border"  style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=4'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">설비 A팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border"style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=5'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">설비 B팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->

                      <!-- Team Card -->
                      <div class="card border" style = " width:15rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=6'">
                        <div class="card-body d-flex flex-column">
                          <div class="d-flex align-items-center">
                            <h5 class="card-title">설비 C팀</h5>
                            <i class="bi bi-star"></i>
                          </div>
                          <div class="img-wrapper d-flex align-items-center">
                            <i class="bi bi-person-circle"></i>
                            <i class="bi bi-person-circle"></i>
                            <img src="${pageContext.request.contextPath}/resources/images/analysis_design_areaBest.jpg" >
                          </div>
                        </div>
                      </div><!-- End Tem Card -->
                      </div>

                    </div>
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
  </main><!-- End #main -->
  
 <%@ include file="/WEB-INF/views/common/footer.jsp"%>