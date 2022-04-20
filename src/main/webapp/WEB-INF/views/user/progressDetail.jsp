<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>

            <div class="row align-items-center mx-5 px-4"> 
                <div class="text-center" style="width: 100%; border-bottom: solid #f26522; margin-bottom: 2rem;">
                    <span style="font-weight: 600; font-size: 1.5rem; color: #f26522;">진행 내역 확인</span>
                </div>
                <div class="" style="width: 80%; margin: auto;">

                    <!-- 카테고리 선택하는 체크박스 -->
                    <div class="d-flex " style="margin-bottom: 1rem;">
                        <span class="" style="padding-right: 3rem; font-weight: 600;">카테고리</span>
                        <div class="" style="padding-right: 2rem; ">
                            <input type="checkbox" id="jb-checkbox1" >
                            <label class="" for="jb-checkbox1">상담</label>
                        </div>
                        <div class="" style="padding-right: 2rem;">
                            <input type="checkbox" id="jb-checkbox2">
                            <label class="" for="jb-checkbox2">AS</label>
                        </div>
                        <div class="" style="padding-right: 2rem;">
                            <input type="checkbox" id="jb-checkbox3" >
                            <label class="" for="jb-checkbox3">시공</label>
                        </div>

                    </div>
                    <hr>

                    <!-- 날짜 선택 -->
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
                    
                  <!-- 날짜 선택 -->
                    <form>
                        <div class="d-flex" style="margin-bottom: 1rem; font-weight: 600; font-size: 0.8rem;">
                            <div style="margin-right: 2rem;">
                                <label for="fromDate">시작일: </label>
                                <input  style="width: 6rem; height: 1rem;" class="text" name="fromDate" id="fromDate">             
                            </div>
                            <div>
                                <label for="toDate">종료일: </label>
                                <input style="width: 6rem; height: 1rem;" type="text" name="toDate" id="toDate">
                            </div>
                        </div>

                    </form>

                    <!-- 리스트 -->
                    <table class="table table-hover" style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
                        <thead>
                            <th scope="col">번호</th>
                            <th scope="col">병원이름</th>
                            <th scope="col">담당자 이름</th>
                            <th scope="col">담당자 전화번호</th>
                            <th scope="col">날짜</th>
                            <th scope="col">카테고리</th>
                            <th scope="col">상태</th>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>강윤치과 송파점</td>
                                <td>전병천</td>
                                <td>010-1111-1234</td>
                                <td>2022-02-17</td>
                                <td>시공</td>
                                <td>진행중</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>강윤치과 송파점</td>
                                <td>전병천</td>
                                <td>010-1111-1234</td>
                                <td>2022-02-11</td>
                                <td>계약</td>
                                <td>계약완료</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>강윤치과 송파점</td>
                                <td>전병천</td>
                                <td>010-1111-1234</td>
                                <td>2022-02-02</td>
                                <td>상담</td>
                                <td>상담완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>강윤치과 본점</td>
                                <td>이주영</td>
                                <td>010-9999-1234</td>
                                <td>2021-08-22</td>
                                <td>AS</td>
                                <td>AS완료</td>
                            </tr>
                            <tr>
                                <th scope="row">5</th>
                                <td>강윤치과 본점</td>
                                <td>이주영</td>
                                <td>010-9999-1234</td>
                                <td>2021-08-12</td>
                                <td>AS</td>
                                <td>AS신청</td>
                            </tr>
                            
                        </tbody>
                    </table>
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
    </div>


<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>