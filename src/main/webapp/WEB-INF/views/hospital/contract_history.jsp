<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

    <div class="card">
      <div class="card-body">
        <h5 class="card-title">계약 기록</h5>

        <!-- Table with hoverable rows -->

        <section class="section" >
            <div class="col-xs-3" style="display: flex; flex-flow: row; justify-content: center; ">
              <!-- Default Card -->
              <div class="card" style="width: 300px; height: 250px; margin-left:30px; margin-right:30px ;">
                <div class="card-body" >
                  <h5 class="card-title">Default Card</h5>
                  assumenda. 
                </div>
              </div><!-- End Default Card -->

              <div class="card" style="width: 300px; height: 250px; margin-left:30px; margin-right:30px ;">
                <div class="card-body" >
                  <h5 class="card-title">Default Card</h5>
                  assumenda. 
                </div>
              </div><!-- End Default Card -->

              <div class="card" style="width: 300px; height: 250px; margin-left:30px; margin-right:30px ;">
                <div class="card-body" >
                  <h5 class="card-title">Default Card</h5>
                  assumenda. 
                </div>
              </div><!-- End Default Card -->

              <div class="card" style="width: 300px; height: 250px; margin-left:30px; margin-right:30px ;">
                <div class="card-body" >
                  <h5 class="card-title">Default Card</h5>
                  assumenda. 
                </div>
              </div><!-- End Default Card -->
          </div>
        </section>

        <!-- 검색 및 검색 종류 -->
        <div class="search-bar">
          <form class="search-form d-flex align-items-center" method="POST" action="#">
            <div class="col-xs-4">
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
              <th scope="col">계약일</th>
              <th scope="col">종류</th>
              <th scope="col">병원 이름</th>
              <th scope="col">계약 내역</th>
              <th scope="col">계약금액</th>
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
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>kosa</td>
              <td>소방소병원</td>
              <td>서울시 부산구 130</td>
              <td>010-1234-1234</td>
              <td>김강윤</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>qoffldkd</td>
              <td>군인병원</td>
              <td>강원도 평창시 321</td>
              <td>010-1234-1234</td>
              <td>김혜현</td>
            </tr>
            <tr>
              <th scope="row">4</th>
              <td>dlfidz</td>
              <td>저쪽병원</td>
              <td>충청북도 충남시</td>
              <td>010-1234-1234</td>
              <td>이주영</td>
            </tr>
          </tbody>
        </table>
        <!-- End Table with hoverable rows -->

        <div class="card-body" style="display: flex; justify-content: center;">
          <!-- Basic Pagination -->
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="#">Prev</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
          </nav><!-- End Basic Pagination -->

      </div>
    </div>

  </main><!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>