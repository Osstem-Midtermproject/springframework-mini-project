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
                <h5 class="card-title">신청 내역</h5>
                
                <div class="d-flex">
                  <div class="col-sm-2 d-flex align-items-center">
                    <input type="date" class="form-control">
                    <span style="margin: 0.2rem;">~</span>
                    <input type="date" class="form-control">
                  </div>
                </div>

                <!-- Table with stripped rows -->
                <table class="table datatable">
                  <thead>
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">병원</th>
                      <th scope="col">신청일</th>
                      <th scope="col" colspan="2">제목</th>
                      <th scope="col">연락처</th>
                      <!-- <th scope="col">
                        <select class="form-select border-0" style="font-weight: bold;">
                          <option selected>구분</option>
                          <option value="1">AS</option>
                          <option value="2">상담</option>
                        </select>
                      </th> -->
                      <th scope="col">상태</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="progress" items="${progresses}">
                  	  <tr style="cursor:pointer;" onClick = "location.href='processing/detail?pdln=${progress.pdln}'">
                        <th scope="row">1</th>
                        <td>${progress.hospital.hname}</td>
                         <td><fmt:formatDate value="${progress.pdate}" pattern="yyyy-MM-dd"/></td>
                        <td colspan="2">${progress.pcontent}</td>
                        <td>${progress.hospital.hpn}</td>
                        <td>${progress.pcategory}</td>                        
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
                      <th scope="col">번호</th>
                      <th scope="col">병원</th>
                      <th scope="col">날짜</th>
                      <th scope="col" colspan="2">세부내용</th>
                      <th scope="col">연락처</th>
                      <th scope="col">
                        <select class="form-select border-0 bg-light" style="font-weight: bold;">
                          <option selected>진행상황</option>
                          <option value="1">상담예정</option>
                          <option value="2">상담중</option>
                          <option value="3">추가상담</option>
                          <option value="4">계약진행중</option>
                          <option value="5">계약완료</option>
                          <option value="6">시공중</option>
                        </select>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="progress" items="${progresses}">
                  	  <tr style="cursor:pointer;" onClick = "location.href='processing/detail?pdln=${progress.pdln}&pdate=${progress.pdate}'">
                        <th scope="row">1</th>
                        <td>${progress.hospital.hname}</td>
                         <td><fmt:formatDate value="${progress.pdate}" pattern="yyyy-MM-dd"/></td>
                        <td colspan="2">${progress.pcontent}</td>
                        <td>${progress.hospital.hpn}</td>
                        <td>${progress.pcategory}</td>                        
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