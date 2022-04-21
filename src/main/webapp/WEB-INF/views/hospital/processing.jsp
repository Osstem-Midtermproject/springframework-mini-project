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
                      <th scope="col">
                        <select class="form-select border-0" style="font-weight: bold;">
                          <option selected>구분</option>
                          <option value="1">AS</option>
                          <option value="2">상담</option>
                        </select>
                      </th>
                      <th scope="col">상태</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">1</th>
                      <td>연세치과</td>
                      <td>2022-04-03</td>
                      <td colspan="2">AS 신청합니다.</td>
                      <td>010-1111-1111</td>
                      <td>AS</td>
                      <td>불확정</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">2</th>
                      <td>고운맘치과</td>
                      <td>2022-04-10</td>
                      <td colspan="2">AS 신청합니다.</td>
                      <td>010-2222-2222</td>
                      <td>AS</td>
                      <td>불확정</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">3</th>
                      <td>연세유라인치과</td>
                      <td>2022-04-13</td>
                      <td colspan="2">시공상담 신청합니다.</td>
                      <td>010-3333-3333</td>
                      <td>상담</td>
                      <td>불확정</td>
                    </tr>
                    
                  </tbody>
                </table>
                <!-- End Table with stripped rows -->

                <nav>
                  <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                      <a class="page-link" href="#">
                        <span>&laquo;</span>
                      </a>
                    </li>
                    <li class="page-item disabled">
                      <a class="page-link" href="#">
                        <span>&lsaquo;</span>
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item disabled">
                      <a class="page-link" href="#">
                        <span>&rsaquo;</span>
                      </a>
                    </li>
                    <li class="page-item disabled">
                      <a class="page-link" href="#">
                        <span>&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
                
              </div>
            </div>

            <div class="card">
              <div class="card-body">
                <h5 class="card-title">진행 상황</h5>
                
                <div class="d-flex justify-content-between">                  
                  <%@ include file="/WEB-INF/views/common/calendar.jsp"%>
                  <%@ include file="/WEB-INF/views/common/searchbar.jsp"%>
                </div>

                <!-- Table with stripped rows -->
                <table class="table datatable">
                  <thead>
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">병원</th>
                      <th scope="col">시공일</th>
                      <th scope="col">착공일</th>
                      <th scope="col" colspan="2">세부내용</th>
                      <th scope="col">연락처</th>
                      <th scope="col">
                        <select class="form-select border-0" style="font-weight: bold;">
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
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">1</th>
                      <td>퍼펙트치과의원</td>
                      <td >2022-04-03</td>
                      <td>2022-05-03</td>
                      <td colspan="2">내부 설비 인테리어</td>
                      <td>010-1111-1111</td>
                      <td>시공중</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">2</th>
                      <td>서울혜치과의원</td>
                      <td>미정</td>
                      <td>미정</td>
                      <td colspan="2">내부 설비 인테리어</td>
                      <td>010-2222-2222</td>
                      <td>상담중</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">3</th>
                      <td>강남레옹치과의원</td>
                      <td>미정</td>
                      <td>미정</td>
                      <td colspan="2">진찰실 리모델링</td>
                      <td>010-3333-3333</td>
                      <td>계약중</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">4</th>
                      <td>엔치과의원</td>
                      <td>미정</td>
                      <td>미정</td>
                      <td colspan="2">개원 인테리어 신청</td>
                      <td>010-4444-4444</td>
                      <td>계약중</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">5</th>
                      <td>화이트드림치의원</td>
                      <td>2022-04-13</td>
                      <td>2022-05-13</td>
                      <td colspan="2">로비 리모델링</td>
                      <td>010-5555-5555</td>
                      <td>시공중</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">6</th>
                      <td>킹콩치과의원</td>
                      <td>미정</td>
                      <td>미정</td>
                      <td colspan="2">개원 인테리어</td>
                      <td>010-6666-6666</td>
                      <td>상담예정</td>
                    </tr>
                    <tr style="cursor:pointer;" onClick = "location.href='${pageContext.request.contextPath}/hospital/processing/detail'">
                      <th scope="row">7</th>
                      <td>강남케이탑치과의원</td>
                      <td>미정</td>
                      <td>미정</td>
                      <td colspan="2">대기실, 인포메이션 리모델링</td>
                      <td>010-7777-7777</td>
                      <td>상담예정</td>
                    </tr>

                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                
                <%@ include file="/WEB-INF/views/common/pagination.jsp"%>

                <div class="search-bar">
                  <form class="search-form d-flex align-items-center justify-content-center" method="POST" action="#">
                    <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                    <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                  </form>
                </div><!-- End Search-Bar -->

              </div>
            </div>
          </div>

        </div>
      </section>
    </div>
  </main><!-- End #main -->
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>