<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<style>
	.card border{
		width:180px;
	}
	

</style>

<main id="main" class="main">
    <div class="dentist_processing">

      <div class="pagetitle">
        <h1>Processing</h1>
        
            <c:forEach var="information" items="${detailTeamInformation}">
                  <div>${information.tsales}</div>
                  <div>dfaef</div>
		   </c:forEach>
		   <div>dfdf</div>
		   
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
            <div class="col-sm-12">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title"></h5>
                  
                  <!-- Team Card -->
              
                  
                   
                  <div class="d-flex justify-content-between">
                    <div class="card border" id = "Rl">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 17일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                      
                    
         
                      </div>
                    </div><!-- End Tem Card -->

                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 18일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        
                      </div>
                    </div><!-- End Tem Card -->

                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 19일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        
                        
                      </div>
                    </div><!-- End Tem Card -->
                    
                    

                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 20일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                     
                        
                      </div>
                    </div><!-- End Tem Card -->
                    </div>
                    
                    <div class="d-flex justify-content-between">
                    
                    

                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 21일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        
                        
                      </div>
                    </div><!-- End Tem Card -->
                         

 
                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 22일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        
                        
                      </div>
                    </div><!-- End Tem Card -->
                    <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">4월 23일</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                        <hr>
                        <h6>퍼펙트치과의원</h6>
                        <div class="card-detail">
                          내부 설비 인테리어
                        </div>
                   
                        
                      </div>
                    </div><!-- End Tem Card -->
                    
                      <div class="card border">
                      <div class="card-body d-flex flex-column">
                        <div class="d-flex align-items-center justify-content-between">
                          <h5 class="card-title">이동</h5>
                          <div>
                            <i class="bi bi-plus"></i>
                            <i class="bi bi-x"></i>
                          </div>
                        </div>

                        <h6>날짜 변경</h6>
                        <div class="card-detail">
                          <   >
                        </div>
                   
                        
                      </div>
                    </div><!-- End Tem Card -->
                    
                    
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