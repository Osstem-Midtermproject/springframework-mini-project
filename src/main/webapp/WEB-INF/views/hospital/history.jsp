<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
      <div class="d-flex flex-column">
        <div class="card">
            <div class="card-body align-items-center">

            <h5 class="card-title">Hospital History</h5>
            
            <!-- 리스트에 보여줄 항목을 선택하는 부분 -->
            <div class="bg-light"  id="select" style=" margin-bottom: 1rem; padding: 0.8rem; ">

                <!-- 날짜 선택 -->
                <form>
                    <div class="d-flex" style="margin-bottom: 1rem; font-weight: 600;">
                        <div style="margin-right: 1rem;">
                            <input  style="width: 8rem; height: 1.7rem; " class="text" name="fromDate" id="fromDate" placeholder="fromDate">         
                        </div>
                        <span style="margin-right: 1rem;">~</span>
                        <div>
                            <input style="width: 8rem; height: 1.7rem;" type="text" name="toDate" id="toDate" placeholder="toDate">
                        </div>
                    </div>
                </form>

                <!-- 날짜 선택 스크립트-->
                <script>
                    $(function() {        
                        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
        
                        //시작일.
                        $('#fromDate').datepicker({
                            showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                            buttonImage: "${pageContext.request.contextPath}/resources/images/calendar-check.svg", // 버튼 이미지
                            buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                            dateFormat: "yy-mm-dd",             // 날짜의 형식
                            changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                            onClose: function( selectedDate ) {    
                                // 시작일(fromDate) datepicker가 닫힐때
                                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                                $("#toDate").datepicker( "option", "minDate", selectedDate );
                            }                
                        });
        
                        //종료일
                        $('#toDate').datepicker({
                            showOn: "both", 
                            buttonImage: "${pageContext.request.contextPath}/resources/images/calendar-check.svg", 
                            buttonImageOnly : true,
                            dateFormat: "yy-mm-dd",
                            changeMonth: true,
                            //minDate: 0, // 오늘 이전 날짜 선택 불가
                            onClose: function( selectedDate ) {
                                // 종료일(toDate) datepicker가 닫힐때
                                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                                $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                            }                
                        });
                    });     
                </script>


                <!-- 병원 검색바 -->
                <div class="search-bar" style=" font-weight: 600;">
                    <form class="search-form d-flex align-items-center justify-content-start" method="POST" action="#">
                        <input type="text" name="query" placeholder="Search Hospital" title="Enter search keyword">
                        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                    </form>
                </div><!-- End Search-Bar -->
                
            </div><!-- 리스트에 보여줄 항목을 선택하는 부분 끝 -->

            <div class="d-flex align-items-center "> 
                <div class="col d-flex justify-content-start">
                    <select class="form-select border-1" style="font-weight: bold; width: 10rem;  margin-bottom: 1rem;">
                        <option selected>전체</option>
                        <option value="1">상담</option>
                        <option value="2">시공</option>
                        <option value="3">AS</option>
                    </select>
    
                    <select class="form-select border-1" style="font-weight: bold; width: 10rem; margin-bottom: 1rem;">
                        <option selected>상태</option>
                        <option value="1">상담예정</option>
                        <option value="2">상담중</option>
                        <option value="3">추가상담</option>
                        <option value="4">계약진행중</option>
                        <option value="5">계약완료</option>
                        <option value="6">시공중</option>
                    </select>
                </div>

                <div class="col d-flex justify-content-end" >
                    <select class="form-select border-1" style="font-weight: bold; width: 11rem; margin-bottom: 1rem;">
                        <option selected>정렬</option>
                        <option value="1">일정순(오름차순)</option>
                        <option value="2">일정순(내림차순)</option>
                        <option value="3">거래금액순(오름차순)</option>
                        <option value="4">거래금액순(내림차순)</option>
                    </select>
                </div>
            </div>
            
            <!-- 리스트 & 페이징-->
            <div>
                <div style="margin-bottom: 2rem;">
                    <table class="table table-dashboard mb-0 table-borderless fs--1 border-200 text-center" style="font-size: small;">
                        <thead class="bg-light">
                            <tr class="text-900">
                                <th>번호</th>
                                <th>병원이름</th>
                                <th>일정</th>
                                <th>세부 내용</th>
                                <th>거래금액</th>
                                <th>종류</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">1</td>
                                <td >주영치과</td>
                                <td >2022.09.24 - 2022.09.26</td>
                                <td>벽지 AS</td>
                                <td>무상</td>
                                <td>AS</td>
                                <td>AS예정</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">2</td>
                                <td >주영치과</td>
                                <td >2022.09.23</td>
                                <td>벽지 AS 상담</td>
                                <td>무상</td>
                                <td>상담</td>
                                <td>상담완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">3</td>
                                <td >주영치과</td>
                                <td >2022.09.21</td>
                                <td>벽지 AS 신청</td>
                                <td>무상</td>
                                <td>AS</td>
                                <td>신청완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">4</td>
                                <td >주영치과</td>
                                <td >2022.07.09</td>
                                <td>시공 완료 후 확인</td>
                                <td>420,000,000</td>
                                <td>시공</td>
                                <td>시공완료확인</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">5</td>
                                <td >주영치과</td>
                                <td >2022.06.29 - 2022.07.07</td>
                                <td>인테리어 시공</td>
                                <td>???</td>
                                <td>시공</td>
                                <td>시공완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">6</td>
                                <td >주영치과</td>
                                <td >2022.06.16 - 2022.06.28</td>
                                <td>벽지 시공</td>
                                <td>???</td>
                                <td>시공</td>
                                <td>시공완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">8</td>
                                <td >주영치과</td>
                                <td >2022.05.25 - 2022.06.15</td>
                                <td>전기 시공</td>
                                <td>???</td>
                                <td>시공</td>
                                <td>시공완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">7</td>
                                <td >주영치과</td>
                                <td >2022.05.19</td>
                                <td>인테리어 계약</td>
                                <td>계약금 : 40,000,000</td>
                                <td>계약</td>
                                <td>계약완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">9</td>
                                <td >주영치과</td>
                                <td >2022.05.17</td>
                                <td>인테리어 추가 상담</td>
                                <td>무상</td>
                                <td>상담</td>
                                <td>상담완료</td>
                            </tr>
                            <tr class="border-bottom border-200">
                                <td class="fw-bold">10</td>
                                <td >주영치과</td>
                                <td >2022.05.16</td>
                                <td>인테리어 상담</td>
                                <td>무상</td>
                                <td>상담</td>
                                <td>상담완료</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
    
                <!-- 페이징 -->
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
      </div>
    </main>
   
<%@ include file="/WEB-INF/views/common/footer.jsp"%>