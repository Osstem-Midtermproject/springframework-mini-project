<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
	<div class="d-flex flex-column">
		<div class="card">
			<div class="card-body align-items-center vw-90">

				<h5 class="card-title">Schedule List</h5>

				<!-- 체크박스들이 들어갈 공간 -->
				<div class="bg-light" id="select"
					style="margin-bottom: 1rem; padding: 0.8rem;">

					<!-- 카테고리 선택하는 체크박스 -->
					<div class="d-flex text-center mb-2">
						<span class="" style="padding-right: 3rem; font-weight: 600;">종류</span>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox1"
								name="categoryCheckbox" checked> <label class=""
								for="categoryCheckbox1">상담</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox2"
								name="categoryCheckbox" checked> <label class=""
								for="categoryCheckbox2">AS</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox3"
								name="categoryCheckbox" checked> <label class=""
								for="categoryCheckbox3">시공</label>
						</div>
					</div>

					<!-- 기간 선택하는 체크박스 -->
					<div class="d-flex text-center mb-2">
						<span class="" style="padding-right: 3rem; font-weight: 600;">기간</span>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="periodCheckbox5"
								onclick="onClickPeriodCheckbox(this)" name="periodCheckbox"
								checked> <label class="" for="periodCheckbox5">전체</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="periodCheckbox1"
								onclick="onClickPeriodCheckbox(this)" name="periodCheckbox">
							<label class="" for="periodCheckbox1">1일</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="periodCheckbox2"
								onclick="onClickPeriodCheckbox(this)" name="periodCheckbox">
							<label class="" for="periodCheckbox2">7일</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="periodCheckbox3"
								onclick="onClickPeriodCheckbox(this)" name="periodCheckbox">
							<label class="" for="periodCheckbox3">1개월</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="periodCheckbox4"
								onclick="onClickPeriodCheckbox(this)" name="periodCheckbox">
							<label class="" for="periodCheckbox4">3개월</label>
						</div>
					</div>

					<!-- 정렬 선택하는 체크박스 -->
					<div class="d-flex text-center mb-2">
						<span class="" style="padding-right: 3rem; font-weight: 600;">정렬</span>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="sortCheckbox1"
								onclick="onClickSortCheckbox(this)" name="sortCheckbox" checked>
							<label class="" for="sortCheckbox1">최신순(시작일기준)</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="sortCheckbox2"
								onclick="onClickSortCheckbox(this)" name="sortCheckbox">
							<label class="" for="sortCheckbox2">최신순(종료일기준)</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="sortCheckbox3"
								onclick="onClickSortCheckbox(this)" name="sortCheckbox">
							<label class="" for="sortCheckbox3">거래금액순(고가)</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="sortCheckbox4"
								onclick="onClickSortCheckbox(this)" name="sortCheckbox">
							<label class="" for="sortCheckbox4">거래금액순(저가)</label>
						</div>
					</div>
				</div>

				<script>
              function onClickPeriodCheckbox(checked){
                var obj = document.getElementsByName("periodCheckbox");
                for(let value of obj){
                  if(value != checked){
                    value.checked=false;
                  }
                }
              }

              function onClickSortCheckbox(checked){
                var obj = document.getElementsByName("sortCheckbox");
                for(let value  of obj){
                  if(value !== checked){
                    value.checked=false;
                  }
                }
              }
              console.log(1);
            </script>

				<table class="table datatable" style="font-size: small;">
					<tr class="text-900">
						<th>번호</th>
						<th>병원이름</th>
						<th>일정</th>
						<th>병원 위치</th>
						<th>세부 내용</th>
						<th>연락처</th>
						<th>거래금액</th>
					</tr>
					</thead>
					<tbody>
						<tr class="border-bottom border-200">
							<td class="fw-bold">1</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">강윤치과</a></td>
							<td>2022.05.22 - 2022.05.30</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 시공</td>
							<td>010-1111-1111</td>
							<td>280,000,000</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">2</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">병천치과</a>
							</td>
							<td>2022.05.22 - 2022.05.24</td>
							<td>부천시 중동 56</td>
							<td>벽지 AS</td>
							<td>010-2222-2222</td>
							<td>3,000,000</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">3</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">혜현치과</a>
							</td>
							<td>2022.05.21</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 상담</td>
							<td>010-3333-3333</td>
							<td>무상</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">4</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">주영치과</a>
							</td>
							<td>2022.05.21</td>
							<td>서울시 마곡동 34번길</td>
							<td>리모델링 상담</td>
							<td>010-4444-4444</td>
							<td>무상</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">5</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">마그네슘치과</a>
							</td>
							<td>2022.05.21</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 상담</td>
							<td>010-5555-5555</td>
							<td>무상</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">6</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">칼슘치과</a>
							</td>
							<td>2022.05.20</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 시공</td>
							<td>010-6666-6666</td>
							<td>2,380,000,000</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">7</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">비타민치과</a>
							</td>
							<td>2022.05.19</td>
							<td>서울시 마곡동 34번길</td>
							<td>AS 상담</td>
							<td>010-7777-7777</td>
							<td>무상</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">8</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">미네랄치과</a>
							</td>
							<td>2022.05.18 - 2022.05.22</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 시공</td>
							<td>010-8888-8888</td>
							<td>4,280,000,000</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">9</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">루테인치과</a>
							</td>
							<td>2022.05.17</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 상담</td>
							<td>010-9999-9999</td>
							<td>무상</td>
						</tr>
						<tr class="border-bottom border-200">
							<td class="fw-bold">10</td>
							<td><a
								href="${pageContext.request.contextPath}/hospital/processing/detail">오메가3치과</a>
							</td>
							<td>2022.05.16</td>
							<td>서울시 마곡동 34번길</td>
							<td>인테리어 상담</td>
							<td>010-0000-0000</td>
							<td>무상</td>
						</tr>
					</tbody>
				</table>
				<style>
input[type="checkbox"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 2px solid #bcbcbc;
	border-radius: 4px;
	cursor: pointer;
	height: 16px;
	outline: 0;
	width: 16px;
}

input[type="checkbox"]:checked {
	background: #bcbcbc;
}
</style>


				<!-- 페이징 -->
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
	</div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>