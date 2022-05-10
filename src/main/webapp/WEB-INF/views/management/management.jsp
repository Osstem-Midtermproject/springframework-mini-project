<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<main id="main" class="main">
	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>회원관리</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item active">회원관리</li>
				</ol>
			</nav>
		</div>
	</div>

	<div class="card" style="padding: 20px 0 15px 0; margin-bottom: 0.5rem;">
		<div class="card-body" style="padding-top: 20px;">
			<table class="table datatable table-borderless">
				<thead  class="bg-light">
					<tr>
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
					<c:forEach var="board" items="${boards}">
						<tr>
						
							<td>${board.userid}</td>
							<td>${board.hospital.hname}</td>
							<td>${board.uaddress}</td>
							<td>${board.uphonenumber}</td>
							<td>${board.uname}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.umembershipdate}"/></td>
<%-- 							<button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/management/modify_management'">수정</button>
 --%>              					<td><button type="button" class="btn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/management/deletemanagement?hdln=${board.hospital.hdln}'">삭제</button></td>
              					
						</tr>
					</c:forEach>

				</tbody>
			</table>


			  <%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			
		<!-- 	<div class="card-body"
						style="display: flex; justify-content: center;">
						Basic Pagination
						<nav style="align-items: center;">
							<ul id="pagingul">
							</ul>
						</nav>
						
						 <nav style="align-items: center;"> 
              <ul id="pagingul">
              </ul>
            </nav> -->


		</div>
	</div>


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
</main>
<!-- End #main -->

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
	background-color: rgb(43 71 90 / 86%);
	border-color: rgb(43 71 90 / 86%);
}

button:focus {
	background-color: rgb(43 71 90 / 86%);
	color: white;
	border: white;
	box-shadow: 0 0 0 0.25rem rgba(216, 13, 13, 0.5);
}

.btn-check:focus+.btn-outline-primary, .btn-outline-primary:focus {
	
}
</style>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>