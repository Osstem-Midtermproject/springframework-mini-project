<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

    <div class="card">
      <div class="card-body">
        <h5 class="card-title">회원 관리</h5>

        <!-- Table with hoverable rows -->

        <!-- 검색 및 검색 종류 -->
        <div class="search-bar">
          <form class="search-form d-flex align-items-center" method="POST" action="#">
            <div class="col-xs-4">
              <select class="form-select" id="validationCustom04" required="" style="height: 30px; font-size: small;" >
                <option selected="" disabled="" value="">종류</option>
                <option>아이디</option>
                <option>성명</option>
                <option>이메일</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid state.
              </div>
            </div>
            <input type="text" name="query" placeholder="Search" title="Enter search keyword">
            <button type="submit" title="Search"><i class="bi bi-search"></i></button>
          </form>
        </div>

        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">아이디</th>
              <th scope="col">병원 이름</th>
              <th scope="col">병원 위치</th>
              <th scope="col">전화</th>
              <th scope="col">병원장</th>
              <th scope="col">가입일</th>
              <!-- 수정 버튼과 탈퇴 버튼 -->
              <th scope="col">관리</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Brandon</td>
              <td>경찰병원</td>
              <td>울릉도 동남쪽 200리</td>
              <td>010-1234-1234</td>
              <td>전병천</td>
              <td>2016-05-25</td>
              <td>버튼1/버튼2</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>kosa</td>
              <td>소방소병원</td>
              <td>서울시 부산구 130</td>
              <td>010-1234-1234</td>
              <td>김강윤</td>
              <td>2011-04-21</td>
              <td>버튼1/버튼2</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>qoffldkd</td>
              <td>군인병원</td>
              <td>강원도 평창시 321</td>
              <td>010-1234-1234</td>
              <td>김혜현</td>
              <td>2006-05-25</td>
              <td>버튼1/버튼2</td>
            </tr>
            <tr>
              <th scope="row">4</th>
              <td>dlfidz</td>
              <td>저쪽병원</td>
              <td>충청북도 충남시</td>
              <td>010-1234-1234</td>
              <td>이주영</td>
              <td>2132-05-25</td>
              <td>버튼1/버튼2</td>
            </tr>
          </tbody>
        </table>
        <!-- End Table with hoverable rows -->

      </div>
    </div>

  </main><!-- End #main -->


<%@ include file="/WEB-INF/views/common/footer.jsp"%>