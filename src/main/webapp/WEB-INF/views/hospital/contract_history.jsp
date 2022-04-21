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

        <div class="card-body"
						style="display: flex; justify-content: center;">
						<!-- Basic Pagination -->
						<nav style="align-items: center;">
							<ul id="pagingul">
							</ul>
						</nav>
						
						 <nav style="align-items: center;"> 
              <ul id="pagingul">
              </ul>
            </nav>

            <script>
              let totalData=66;      //총 데이터 수
              let dataPerPage=10;   //한 페이지에 나타낼 수
              let pageCount=5;     //페이징에 나타낼 페이지 수
              let globalCurrentPage=1;    //현재 페이지       
               
              $(document).ready(function () {
                console.log("ready");
                /*
                $.ajax({
                  method: "GET",
                  url: "http://url/data?" + data,
                  dataType: "json",
                  success : function(d){
                    totalData=d.data.length;
                  }
                });
                */

                //글 목록 표시 호출 (테이블 생성)
                //displayData(1, dataPerPage);

                //페이징 표시 호출
                paging(totalData, dataPerPage, pageCount, 1);
              });

              function paging(totalData, dataPerPage, pageCount, currentPage){
                console.log("페이징");
                totalPage = Math.ceil(totalData/dataPerPage); //총 페이지 수
                console.log(totalPage);

                if(totalPage<pageCount){
                  pageCount=totalPage;
                }

                let pageGroup = Math.ceil(currentPage/pageCount);  //페이지 그룹
                let last = pageGroup*pageCount;  //화면에 보여질 마지막 페이지 번호
                
                if(last>totalPage) {
                  last=totalPage;
                }
                
                let first = last - (pageCount -1);  //화면에 보여질 첫번째 페이지 번호
                let next = last + 1;
                let prev = first - 1;
                
                let pageHtml = "";
                
                if(prev > 0){
                  pageHtml += '<li><a href="#" id="prev">이전</a></li>';
                }else{
                  pageHtml += '<li><a href="#" id="prev" class="disabled">이전</a></li>';
                }
                
                //페이징 번호 표시
                for(var i = first; i<=last; i++){
                  if(currentPage ==i ){
                    pageHtml += "<li class='on'><a href='#' id='" + i +"'>" + i + "</a></li>";
                  }else{
                    pageHtml += "<li><a href='#' id='" + i +"'>" + i + "</a></li>";
                  }
                }

                if(last<totalPage) {
                  pageHtml += "<li><a href='#' id='next'>다음</a></li>";
                }else{
                  pageHtml += "<li><a href='#' id='next' class='disabled'>다음</a></li>";
                }

                //$("#pagingul").html(pageHtml);
                document.getElementById("pagingul").innerHTML = pageHtml;

                //페이징 번호 클릭 이벤트
                $("#pagingul li a").click(function () {
                  console.log("a");
                  let $id = $(this).attr("id");
                  selectedPage = $(this).text();

                  if($id == "next") selectedPage = next;
                  if($id == "prev") selectedPage = prev;

                  //전역변수에 선택한 페이지 번호를 담는다
                  globalCurrentPage = selectedPage;

                  //페이징 표시 재호출
                  paging(totalData, dataPerPage, pageCount, selectedPage);

                  //글 목록 표시 재호출
                  //displayData(selectedPage, dataPerPage);
                });
              }

            </script>

            <style>
              #pagingul {
                  text-align: center;
                  list-style: none;
                  margin: 0;
                  padding: 0;
                  border-radius: 2px;
              }

              #pagingul li {
                  display: inline-flex;
                  text-align: center;
              }

              #pagingul li a {
                  display: block;
                  font-size: 14px;
                  padding: 9px 12px;
                  border: solid 1px #ccc;
                  border-radius: 2px;
                  box-sizing: border-box;
              }

              #pagingul li a.disabled {
                pointer-events: none;
                cursor: default;
              }
              #pagingul li.on {
                  background: #f26522;
                  border: solid 1px #f26522;

              }

              #pagingul li.on a {
                  color: #fff;
              }
            </style>

					</div>
    </div>

  </main><!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>