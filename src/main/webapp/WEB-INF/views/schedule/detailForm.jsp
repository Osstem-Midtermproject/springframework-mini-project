<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<main id="main" class="main">
      <div class="d-flex flex-column">
        <h4 class="card-title">일정상세</h5>
        <hr />
        <div class="card">
          <div class="card-body">
            <form>
              <div class="form-group mt-2 mb-4">
                <label for="utitle">일정내용</label>
                <input type="utitle" class="form-control" id="title" />
              </div>
              <div class="d-flex" style="margin-bottom: 1rem; font-weight: 600; font-size: 0.8rem">
                <div style="margin-right: 2rem">
                  <label for="fromDate">시작일: </label>
                  <input style="width: 6rem; height: 1.5rem" class="text" name="fromDate" id="fromDate" />
                  <input type="text" name="time1" value="" placeholder="시간선택"  id="time1" required size="8" maxlength="5">
                </div>
                <div>
                  <label for="toDate">종료일: </label>
                  <input style="width: 6rem; height: 1.5rem" type="text" name="toDate" id="toDate" />
                  <input type="text" name="time1" value="" placeholder="시간선택"  id="time2" required size="8" maxlength="5">
                </div>
              </div>
              <div class="dropdown">
                <span>일정</span>
                <button class="btn dropdown-toggle border-4" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">일정구분</button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="#">As</a></li>
                  <li><a class="dropdown-item" href="#">상담</a></li>
                  <li><a class="dropdown-item" href="#">시공</a></li>
                </ul>
              </div>
              <hr />
              <div class="form-group mt-2 mb-4">
                <span>담당자 : 김강윤</span>
              </div>
              <div class="form-group mt-2 mb-4">
                <span>신청인 : 이주영</span>
              </div>
              <div class="form-group mt-2 mb-4">
                <span>병원명 : 오스템병원</span>
              </div>
              <div class="form-group mt-2 mb-4">
                <label for="utitle">장소</label>
                <input type="utitle" class="form-control" id="title" />
              </div>
              <div class="form-group mt-2 mb-4">
                <label for="utitle">내용</label>
                <input type="utitle" class="form-control" id="title" style="height: 200px" />
              </div>
              <div class="form-group mt-2 mb-4 text-center">
                <button class="btn border-0 btn-primary mr-2" style="width: 110px; background-color: rgb(238, 115, 14);">확인</button>
                <button class="btn border-0 btn-primary ml-2"style="width: 110px; background-color: rgb(238, 115, 14);">취소</button>
              </div>    
            </form>
          </div>
        </div>
      </div>
    </main>

 <script>
      
      $(function (){
        $("#time1").timepicker({
            timeFormat : "HH:mm",
		    interval : 30,
		    dynamic : false,
		    dropdown : true,
		    scrollbar : true
        });
        $("#time2").timepicker({
            timeFormat : "HH:mm",
		    interval : 30,
		    dynamic : false,
		    dropdown : true,
		    scrollbar : true,
        
        });

      });
      $(document).ready(function(){
            $("#time1").timepicker('setTime', new Date());
           
      });
      $(function () {
        // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

        //시작일.
        $("#fromDate").datepicker({
          showOn: "both", // 달력을 표시할 타이밍 (both: focus or button)
          buttonImage: "${pageContext.request.contextPath}/resources/images/calendar-check.svg", // 버튼 이미지
          buttonImageOnly: true, // 버튼 이미지만 표시할지 여부
          dateFormat: "yy-mm-dd", // 날짜의 형식
          changeMonth: true, // 월을 이동하기 위한 선택상자 표시여부
          onClose: function (selectedDate) {
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#toDate").datepicker("option", "minDate", selectedDate);
          },
        });

        //종료일
        $("#toDate").datepicker({
          showOn: "both",
          buttonImage: "${pageContext.request.contextPath}/resources/images/calendar-check.svg",
          buttonImageOnly: true,
          dateFormat: "yy-mm-dd",
          changeMonth: true,
          //minDate: 0, // 오늘 이전 날짜 선택 불가
          onClose: function (selectedDate) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
            $("#fromDate").datepicker("option", "maxDate", selectedDate);
          },
        });
      });
    </script>
 <%@ include file="/WEB-INF/views/common/footer.jsp"%>