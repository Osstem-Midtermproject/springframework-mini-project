<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<style>
.table {
	text-align: center;
}

.btn-outline-primary {
	padding: 3px;
	border: none;
	color: black;
}

.btn-outline-warning {
	padding: 2.5px;
}

.btn-outline-primary:hover {
	color: #fff;
	background-color: orange;
	border-color: orange;
}

th a {
	color: black;
}

.table-bordered th:hover {
	color: #fff;
	background-color: orange;
	border-color: orange;
}

.location th a:hover {
	color: white;
}

th:focus {
	background-color: #f59342;
}

button:focus {
	background-color: orange;
	color: white;
	border: white;
	box-shadow: 0 0 0 0.25rem rgba(216, 13, 13, 0.5);
}

.btn-check:focus+.btn-outline-primary, .btn-outline-primary:focus {
	box-shadow: 0 0 0 0.25rem rgba(240, 114, 11, 0.87);
}

.page-link:focus {
	z-index: 3;
	color: #ffffff;
	background-color: rgba(240, 114, 11, 0.87);
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgba(87, 81, 81, 0.25);
}
</style>

<script>
    

    function mouseOver(num){
      document.getElementById("go").src = "${pageContext.request.contextPath}/resources/images/map_images/local-map-on" + num + ".png";
    }

    function map_click(num){
      var name = "location" + num;
      setTimeout(() => {
        document.getElementById(name).focus()
      }, 100);
    }
  </script>

<main id="main" class="main">

	<div class="card">
		<div class="card-body">
			<h5 class="card-title">병원 목록</h5>

			<!-- Table with hoverable rows -->

			<!-- 검색 및 검색 종류 -->
			

			<div class="d-flex align-items-center ">
				<div class="col d-flex justify-content-start">
					<select class="form-select border-1"
						style="font-weight: bold; width: 10rem; margin-bottom: 1rem;">
						<option selected>전체</option>
						<option value="1">병원</option>
						<option value="2">전화</option>
					</select>
				
			
					<div class="search-bar">
						<form class="search-form d-flex align-items-center" method="POST" action="#">
							<input type="text" name="query" placeholder="Search" title="Enter search keyword">
							<button type="button" class="btn btn-outline-warning ">
								<i class="bi bi-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>	

			<!-- 이미지별 위치 값 별도 지정 할 것 -->
			<div class="center-find hide md-inline-block">
				<div class="map-wrap">
					<div class="hover-warp"
						style="display: flex; justify-content: center;">
						<img
							src="${pageContext.request.contextPath}/resources/images/map_images/local-map-on1.png"
							usemap="#Map" class="map-img" id="go">
						<map name="Map" id="Map">
							<area class="kangwon" tabindex="0" shape="poly"
								coords="127,11,117,27,72,28,92,53,97,66,105,89,137,98,167,101,172,87"
								onmouseover="mouseOver(1);" onclick="map_click(1)">
							<area class="seoul" tabindex="0" shape="poly"
								coords="55,67,45,73,51,80,60,74" onmouseover="mouseOver(2);"
								onclick="map_click(2)">
							<area class="incheon" tabindex="0" shape="poly"
								coords="29,74,41,79,36,85,27,80,25,74"
								onmouseover="mouseOver(3);" onclick="map_click(3)">
							<area class="kyungki" tabindex="0" shape="poly"
								coords="53,37,72,45,77,60,81,74,91,84,85,103,69,115,50,113,35,79,34,65"
								onmouseover="mouseOver(4);" onclick="map_click(4)">
							<area class="daegu" tabindex="0" shape="poly"
								coords="146,184,137,186,134,195,139,199,147,198,149,190"
								onmouseover="mouseOver(5);" onclick="map_click(5)">
							<area class="ulsan" tabindex="0" shape="poly"
								coords="186,189,179,201,181,206,189,206,194,194"
								onmouseover="mouseOver(6);" onclick="map_click(6)">
							<area class="kyungbuk" tabindex="0" shape="poly"
								coords="183,107,172,115,156,114,139,121,134,131,106,141,105,160,112,174,108,191,123,204,148,208,171,200,182,182"
								onmouseover="mouseOver(7);" onclick="map_click(7)">
							<area class="chungbuk" tabindex="0" shape="poly"
								coords="132,111,116,107,107,107,91,109,74,121,74,124,76,135,70,142,82,151,91,175,98,180,94,155,94,137"
								onmouseover="mouseOver(8);" onclick="map_click(8)">
							<area class="daejeon" tabindex="0" shape="poly"
								coords="72,159,72,165,76,161" onmouseover="mouseOver(9);"
								onclick="map_click(9)">
							<area class="chungnam" tabindex="0" shape="poly"
								coords="10,126,31,157,33,176,62,172,79,178,65,160,63,144,56,127"
								onmouseover="mouseOver(10);" onclick="map_click(10)">
							<area class="jeonbuk" tabindex="0" shape="poly"
								coords="27,208,23,221,31,227,39,221,52,220,59,230,77,226,81,218,84,199,95,190,86,187,68,187,48,179,35,187,35,195"
								onmouseover="mouseOver(11);" onclick="map_click(11)">
							<area class="kwangju" tabindex="0" shape="poly"
								coords="41,235,48,240,47,248,40,247,39,239"
								onmouseover="mouseOver(12);" onclick="map_click(12)">
							<area class="jeonnam" tabindex="0" shape="poly"
								coords="16,227,13,241,17,258,15,268,2,286,21,299,33,291,43,291,59,272,67,273,81,259,90,251,76,235,49,234,40,227,25,234"
								onmouseover="mouseOver(13);" onclick="map_click(13)">
							<area class="busan" tabindex="0" shape="poly"
								coords="169,236,163,242,163,249,177,243"
								onmouseover="mouseOver(14);" onclick="map_click(14)";>
							<area class="kyungnam" tabindex="0" shape="poly"
								coords="99,195,87,211,89,227,87,243,97,256,110,252,115,260,126,255,142,243,157,244,169,232,179,236,186,214,143,216,113,212"
								onmouseover="mouseOver(15);" onclick="map_click(15)">
							<area class="jeju" tabindex="0" shape="poly"
								coords="64,320,41,327,33,327,24,325,28,314,51,305,63,306,68,311"
								onmouseover="mouseOver(16);" onclick="map_click(16)";>
						</map>
					</div>
				</div>
			</div>

			<div class="card" style="margin-top: 30px;">
				<div class="card-body">
					<!-- Bordered Table -->
					<table class="table table-bordered">
						<!-- 키보드 초점을 받을 수 없는 div, span과 같은 요소도 초점을 받을 수 있도록 만들어 줍니다 -->
						<tr>
							<th tabindex="0" scope="col" onclick="mouseOver(1)"
								id="location1">강원</th>
							<th tabindex="0" scope="col" onclick="mouseOver(4)"
								id="location4">경기</a></th>
							<th tabindex="0" scope="col" onclick="mouseOver(15)"
								id="location15">경남</th>
							<th tabindex="0" scope="col" onclick="mouseOver(7)"
								id="location7">경북</th>
							<th tabindex="0" scope="col" onclick="mouseOver(12)"
								id="location12">광주</th>
							<th tabindex="0" scope="col" onclick="mouseOver(5)"
								id="location5">대구</th>
							<th tabindex="0" scope="col" onclick="mouseOver(9)"
								id="location9">대전</th>
							<th tabindex="0" scope="col" onclick="mouseOver(14)"
								id="location14">부산</th>
						</tr>
						<tr>
							<th tabindex="0" scope="col" onclick="mouseOver(2)"
								id="location2">서울</th>
							<th tabindex="0" scope="col" onclick="mouseOver(6)"
								id="location6">울산</th>
							<th tabindex="0" scope="col" onclick="mouseOver(3)"
								id="location3">인천</th>
							<th tabindex="0" scope="col" onclick="mouseOver(13)"
								id="location13">전남</th>
							<th tabindex="0" scope="col" onclick="mouseOver(11)"
								id="location11">전북</th>
							<th tabindex="0" scope="col" onclick="mouseOver(16)"
								id="location16">제주</th>
							<th tabindex="0" scope="col" onclick="mouseOver(10)"
								id="location10">충남</th>
							<th tabindex="0" scope="col" onclick="mouseOver(8)"
								id="location8">충북</th>
						</tr>
					</table>
					<!-- End Bordered Table -->


					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">병원 이름</th>
								<th scope="col">주소</th>
								<th scope="col">전화</th>
								<th scope="col">내역보기</th>
								<th scope="col">약도</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>독도 병원</td>
								<td>울릉도 동남쪽 200리</td>
								<td>02-1234-2345</td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/hospital/contractHistory'">내역</button></td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='https://dokdo.mofa.go.kr/kor/'">약도보기</button></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>울릉도 병원</td>
								<td>울릉도 동남쪽 100리</td>
								<td>02-1234-2345</td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/hospital/contractHistory'">내역</button></td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='https://dokdo.mofa.go.kr/kor/'">약도보기</button></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>이쪽 병원</td>
								<td>울릉도 동남쪽 400리</td>
								<td>02-1234-2345</td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/hospital/contractHistory'">내역</button></td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='https://dokdo.mofa.go.kr/kor/'">약도보기</button></td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td>저쪽 병원</td>
								<td>저쪽은 어떠리</td>
								<td>02-1234-2345</td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/hospital/contractHistory'">내역</button></td>
								<td><button type="button" class="btn btn-outline-primary" onclick="location.href='https://dokdo.mofa.go.kr/kor/'">약도보기</button></td>
							</tr>
						</tbody>
					</table>
			

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
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>