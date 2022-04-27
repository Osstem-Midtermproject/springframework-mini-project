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
            <li class="breadcrumb-item">Dentist</li>
            <li class="breadcrumb-item active">Processing</li>
          </ol>
        </nav>

      </div><!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">시공 내역</h5>
                
                <div class="d-flex justify-content-between">                  
                  <%@ include file="/WEB-INF/views/common/calendar.jsp"%>
                  <%@ include file="/WEB-INF/views/common/searchbar.jsp"%>
                </div>

                <!-- Table with stripped rows -->
                <table class="table datatable table-borderless">
                  <thead class="bg-light">
                    <tr>
                      <th scope="col">순서</th>
                      <th scope="col">병원</th>
                      <th scope="col">신청인</th>
                      <th scope="col">시공일</th>
                      <th scope="col">연락처</th>
                      <th scope="col">
                      	<select class="form-select border-0 bg-light" style="font-weight: bold;">
                          <option selected>시공상태</option>
                          <option value="1">시공대기중</option>
                          <option value="2">시공중</option>
                          <option value="3">시공완료</option>
                        </select>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="hospital" items="${hospitals}">
                  	  <tr style="cursor:pointer;" onClick = "location.href='processing/detail?hdln=${hospital.hdln}'">
                        <th scope="row">1</th>
                        <td>${hospital.hname}</td>
                        <td>${hospital.hdirector}</td>
                        <td><fmt:formatDate value="${hospital.progress.pdate}" pattern="yyyy-MM-dd"/></td>
                        <td>${hospital.hpn}</td>
                        <td>${hospital.progress.pcategory}</td>                        
                      <tr>
                    </c:forEach>
                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                <%@ include file="/WEB-INF/views/common/pagination.jsp"%>
                
              </div>
            </div>

         <!---------------------------- pagination 추가 ------------------------------->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">진행 상황</h5>
                
                <div class="d-flex justify-content-between">                  
                  <%@ include file="/WEB-INF/views/common/calendar.jsp"%>
                  <%@ include file="/WEB-INF/views/common/searchbar.jsp"%>
                </div>

                <!-- Table with stripped rows -->
                <table class="table datatable table-borderless">
                  <thead class="bg-light">
                    <tr>
                      <th scope="col">순서</th>
                      <th scope="col">
                      	<select class="form-select border-0 bg-light" style="font-weight: bold;">
                          <option selected>구분</option>
                          <option value="1">상담</option>
                          <option value="2">AS</option>
                        </select>
                      </th>
                      <th scope="col">병원</th>
                      <th scope="col">신청인</th>
                      <th scope="col">일자</th>
                      <th scope="col">연락처</th>
					  <th scope="col">
                      	<select class="form-select border-0 bg-light" style="font-weight: bold;">
                          <option selected>진행상태</option>
                          <option value="1">상담대기중</option>
                          <option value="2">상담중</option>
                          <option value="3">상담완료</option>
                          <option value="4">AS대기중</option>
                          <option value="5">AS중</option>
                          <option value="6">AS완료</option>
                        </select>
                      </th>                      
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="hospital" items="${hospitals}">
                  	  <tr style="cursor:pointer;" onClick = "location.href='processing/detail?hdln=${hospital.hdln}'">
                        <th scope="row">1</th>
                        <td>상담</td>
                        <td>${hospital.hname}</td>
                        <td>${hospital.hdirector}</td>
                        <td><fmt:formatDate value="${hospital.progress.pdate}" pattern="yyyy-MM-dd"/></td>
                        <td>${hospital.hpn}</td>
                        <td>${hospital.progress.pcategory}</td>                        
                      <tr>
                    </c:forEach>
                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                
     			<!-- 페이지네이션 -->
                <%@ include file="/WEB-INF/views/common/pagination.jsp"%>
              </div>
	         </div>
          </div>
        </div>
      </section>
    </div>
  </main><!-- End #main -->
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>