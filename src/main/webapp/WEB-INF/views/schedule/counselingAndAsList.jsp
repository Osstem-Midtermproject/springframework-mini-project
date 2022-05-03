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
                <h5 class="card-title">Notification List</h5>
                
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
							<button id="searchButton" type="button" title="Search" onclick="notificationList(1)">
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
                      <th scope="col">병원명</th>
                      <th scope="col">내용</th>
                      <th scope="col">제목</th>
                      <th scope="col">신청일</th>
                      <th scope="col">상담예정일</th>
                      <th scope="col">상태</th>
                    </tr>
                  </thead>
                  <tbody id="notificationListTable">

                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                
                <!-- pagination이 들어갈 자리 -->
                <div id="notificationListPager">
					                
                </div>
              </div>
            </div>

         <!------------------------------------------------------------------------------------>
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
							<input id="searchBar2" type="text" name="query"
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
                      	<select class="form-select border-0 bg-light" id="selectAsOrCounseling" style="font-weight: bold;">
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

	//select box에서 상담이 선택되면 상담 스케줄 리스트를 보여주고, AS가 선택되면 AS 스케줄 리스트를 보여준다
	$('#selectAsOrCounseling').change(function() {
		if(this.value==2){
			selectAsScheduleList(1);
		}else{
			selectScheduleList(1);
		}
	});
			
	$(document).ready(function(){
		notificationList(1);
		selectScheduleList(1);
	});
			
	$('#searchScheduleListButton').submit(function(e){
		e.preventDefault();
	});
	
	
	//알림 리스트를 보여주는-------------------------------------------------------------------------
	function notificationList(no) { 
    	
        let searchBar = $("#searchBar").val();
        $.ajax({
        	url: 'notificationList',
            type: 'post',
            data: {"searchBar": searchBar , "pageNo": no}
        }).done(function (result){
                    
	        console.log(result);
	        
	       	var str="";
	
	        $.each(result.notificationList,function(index,list){
	        	console.log(list.rdAddress);
	        	var arr = new Array();
	        	arr[0]=
	        	
				
				str = str + "<tr><td>"+list.rdNo+"</td><td>"+list.hospital.hname+"</td><td>"+ list.rdContent +
	        	"</td><td>"+list.rdTitle+"</td><td>"+list.rdApplicationdate+"</td><td>"+
	        	list.rdCounDate +"</td><td><button id='confirmation' type='button' class='btn btn-sm btn-dark' onclick='confirmation(" + list.rdDln +")'>확정하기</button></td><tr>";
	
			})   
	
	        $("#notificationListTable").html(str);
	                    	  
	        var str2 ="<ul class='pagination justify-content-center'>";
	        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='notificationList(1)'><span>&laquo;</span></a></li>"; 
	        
	        for(var i=result.startPageNo; i<=result.endPageNo; i++){
	            if(i != result.pageNo){
	                str2 = str2 + "<li class='page-item'><a class='page-link' onclick='notificationList(" +i + ")'>" +i +"</a></li>";
	            }else{
	                str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='notificationList(" +i + ")'>" +i +"</a></li>";
	            }
	        }
	        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='notificationList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
	        str2 = str2 + "</ul>";
	        
			$("#notificationListPager").html(str2);
				
		});
	}
			
	//확정하기 버튼이 눌리면 실행되는----------------------------------------------------------------------------
	function confirmation(dln){
		$.ajax({
        	url: 'confirmation',
            type: 'post',
            data: {"dln": dln}
        }).done(function (){
    		notificationList(1);
    		selectScheduleList(1);
		});
		
	}
	
	//상담 스케줄 리스트를 보여주는----------------------------------------------------------------------------- 
    function selectScheduleList(no) { 
    	
        let searchBar = $("#searchBar2").val();
        
        $.ajax({
        	url: 'selectScheduleList',
            type: 'post',
            data: {"searchBar": searchBar , "pageNo": no}
        }).done(function (result){
                    
        console.log(result);
        
       	var str="";

        $.each(result.constructionScheduleList,function(index,list){

			var date1 = list.counScheStartdate.substr(0, 10);
			var time1 = list.counScheStartdate.substr(11,13);
			
			str = str + "<tr><td>"+list.counNo+"</td><td>"+"상담"+
        	"</td><td>"+list.counScheAddress+"</td><td>"+list.hospital.hname+
        	"</td><td>"+list.counScheContent+"</td><td>"+date1+"</td><td>"+time1+"</td><tr>";

		})   

        $("#scheduleListTable").html(str);
                    	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList(1)'><span>&laquo;</span></a></li>";
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
            if(i != result.pageNo){
                str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }else{
                str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }
        }
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";
        
		$("#scheduleListPager").html(str2);
			
		});
	}
    
	//AS 스케줄 리스트를 보여주는
	function selectAsScheduleList(no) { 
    	
        let searchBar = $("#searchBar2").val();
        $.ajax({
        	url: 'selectAsScheduleList',
            type: 'post',
            data: {"searchBar": searchBar , "pageNo": no}
        }).done(function (result){
                    
        console.log(result);
        
       	var str="";

        $.each(result.asScheduleList,function(index,list){
        	

			var date = list.asStartDate.substr(0, 10);
		
			var time = list.asStartDate.substr(11,13);
			
			str = str + "<tr><td>"+list.asNo+"</td><td>"+"AS"+
        	"</td><td>"+list.hospital.hname+"</td><td>"+ list.asAddress +
        	"</td><td>"+list.asContent+"</td><td>"+date+"</td><td>"+time+"</td><tr>";

		})   

        $("#scheduleListTable").html(str);
                    	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList(1)'><span>&laquo;</span></a></li>";
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
            if(i != result.pageNo){
                str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }else{
                str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }
        }
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";
        
		$("#scheduleListPager").html(str2);
			
		});
	}
    
</script>