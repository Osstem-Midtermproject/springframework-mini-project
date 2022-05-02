<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
    <div class="dentist_processing">

      <div class="pagetitle">
        <h1>Counseling & AS Schedule List</h1>
 
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Schedule</li>
            <li class="breadcrumb-item">List</li>
            <li class="breadcrumb-item active">Counseling & AS</li>
          </ol>
        </nav>

      </div><!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">알림 내역</h5>
                
                <div class="d-flex justify-content-between">                  
                  
					<!-- 카테고리 선택하는 체크박스 -->
					<div class="d-flex " style="margin-bottom: 1rem;">
						<span class="" style="padding-right: 3rem; font-weight: 600;">상담 & AS </span>
			
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox1" name="checkBox"
								value="상담" onclick="selectList()" checked="checked"> <label
								class="" for="categoryCheckbox1">상담</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox2" name="checkBox"
								value="AS" onclick="selectList()" checked="checked"> <label
								class="" for="categoryCheckbox2">AS</label>
						</div>
					</div>
                 
                    <%@ include file="/WEB-INF/views/common/calendar.jsp"%>
                 
                 
					<!-- 검색 및 검색 종류 -->
					<div class="search-bar">
						<div class="search-form d-flex align-items-center" method="POST"
							action="#">
							<div class="col-xs-4">
								<div class="invalid-feedback">Please select a valid state.</div>
							</div>
							<input id="searchBar" type="text" name="query"
								placeholder="Search Hospital" value="${searchBar}"
								title="Enter search keyword">
							<button id="searchButton" type="button" title="Search" onclick="selectList(1)">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
                  
                </div>

                <!-- Table with stripped rows -->
                <table class="table datatable table-borderless">
                  <thead class="bg-light">
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">병원</th>
                      <th scope="col">신청인</th>
                      <th scope="col">시공일</th>
                      <th scope="col">연락처</th>
                      <th scope="col">
                      	<select class="form-select border-0 bg-light" style="font-weight: bold;">
                          <option selected>시공상태</option>
                          <option value="1">시공대기중</option>
                          <option value="2">시공중</option>
                          <option value="3">시공완료</option>
                        </select>
                      </th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                <%@ include file="/WEB-INF/views/common/pagination.jsp"%>
                
              </div>
            </div>

         <!---------------------------- pagination 추가 ------------------------------->
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Counseling & AS Schedule List</h5>
                
                <div class="d-flex justify-content-between">                  
                    <%@ include file="/WEB-INF/views/common/calendar.jsp"%>
                  
                  	<!-- 검색 및 검색 종류 -->
					<div class="search-bar">
						<div class="search-form d-flex align-items-center" method="POST"
							action="#">
							<div class="col-xs-4">
								<div class="invalid-feedback">Please select a valid state.</div>
							</div>
							<input id="searchBar" type="text" name="query"
								placeholder="Search Hospital" value="${searchBar}"
								title="Enter search keyword">
							<button id="searchScheduleListButton" type="button" title="Search" onclick="selectScheduleList(1)">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
                </div>

                <!-- Table with stripped rows -->
                <table class="table datatable table-borderless">
                  <thead class="bg-light">
                    <tr>
                      <th scope="col">순서</th>
                      <th scope="col">
                      	<select class="form-select border-0 bg-light" style="font-weight: bold;">
                          <option selected>구분</option>
                          <option value="1">상담</option>
                          <option value="2">AS</option>
                        </select>
                      </th>
                      <th scope="col">병원명</th>
                      <th scope="col">병원주소</th>
                      <th scope="col">세부내용</th>
                      <th scope="col">상담일</th>
					  <th scope="col">예정시간</th>                      
                    </tr>
                  </thead>
                  <tbody id="scheduleListTable">

                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                
     			<!-- 페이지네이션 -->
     			<div id="scheduleListPager">
	                   			
     			</div>
              </div>
	         </div>
          </div>
        </div>
      </section>
    </div>
  </main><!-- End #main -->
 
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script type="text/javascript">
			
	$(document).ready(function(){
		selectScheduleList(1);
	});
			
	$('#searchScheduleListButton').submit(function(e){
		e.preventDefault();
	});
					
    function selectScheduleList(no) { 
    	
        let searchBar = $("#searchBar").val();
        $.ajax({
        	url: 'selectScheduleList',
            type: 'post',
            data: {"searchBar": searchBar , "pageNo": no}
        }).done(function (result){
                    
        console.log(result);
        
       	var str="";

        $.each(result.constructionScheduleList,function(index,list){

        	console.log("y");
			str = str + "<tr onClick = location.href='processing/detail?hdln="+list.consScheDln +"'><td>"+list.consNo+
        	"</td><td>"+list.consScheHospitalName+"</td><td>"+list.consScheStartdate+
        	"</td><td>"+list.consScheEnddate+"</td><td>"+list.constructionCategory.consCateType+"</td><td>"+list.team.tcategory+"</td><tr>";

		})   

		console.log(str);
        $("#scheduleListTable").html(str);
                    	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectList(1)'><span>&laquo;</span></a></li>";
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
            if(i != result.pageNo){
                str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectList(" +i + ")'>" +i +"</a></li>";
            }else{
                str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='selectList(" +i + ")'>" +i +"</a></li>";
            }
        }
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";
        
		$("#scheduleListPager").html(str2);
			
		});
	}
    
</script>