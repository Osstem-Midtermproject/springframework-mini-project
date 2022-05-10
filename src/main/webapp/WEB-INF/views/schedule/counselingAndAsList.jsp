<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
    <div class="dentist_processing">

 	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>상담/AS</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item">스케줄</li>
					<li class="breadcrumb-item">리스트</li>
					<li class="breadcrumb-item active">상담/AS</li>
				</ol>
			</nav>
		</div>
	</div>

      </div><!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">새소식</h5>
                
                <div class="d-flex justify-content-between">                
                                   
                    <!-- ----------------------- calendar --------------------------->
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
                <h5 class="card-title">상담 & AS 스케줄 리스트</h5>
                
                <div class="d-flex justify-content-between">                  
                    <div class="col-sm-3 d-flex align-items-center">
					  <input type="date" class="form-control" id="startdate1">
					  <span style="margin: 0.2rem;">~</span>
					  <input type="date" class="form-control" id="enddate1">
					</div>
                  
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
                          <option selected value="1">상담</option>
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

    //Notification List : 시작일과 종료일이 모두 선택되었을 때만 작동	
	$('#enddate').change(function() {
		let sdate = $("#startdate").val();
		let edate = $("#enddate").val();
		
		if(sdate !== '' && edate !== ''){
			notificationList(1);
		}
	});
    
    //Counseling & AS Schedule List : 시작일과 종료일이 모두 선택되었을 때만 작동	
	$('#enddate1').change(function() {
		let sdate1 = $("#startdate1").val();
		let edate1 = $("#enddate1").val();
		
		if(sdate1 !== '' && edate1 !== ''){
			//1이면 상담 2이면 AS
			var scheduleListStatus = $("#selectAsOrCounseling option:selected").val();
			console.log(scheduleListStatus);

			if(scheduleListStatus == 1){
				selectScheduleList(1);
			}else if(scheduleListStatus == 2){
				selectAsScheduleList(1);
			}
		}
	});
	
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
		//시작일 종료일
		let sdate = $("#startdate").val();
		let edate = $("#enddate").val();
		
		//시작일과 종료일이 선택되지 않았다면 일괄적으로 이번 년도로 검색 
		if(sdate === '' && edate === ''){
			sdate='2022-01-01';
			edate='2022-12-31';
		}

		//검색된 병원명 가져오기
		let searchBar = $("#searchBar").val();
		
        $.ajax({
        	url: 'notificationList',
            type: 'post',
            data: {"searchBar": searchBar , "sdate":sdate, "edate":edate, "pageNo": no}
        }).done(function (result){
                    	        
	       	var str="";
	
	        $.each(result.notificationList,function(index,list){
	        	
	        	console.log(list);
				var t = list.rdCounDate.substr(10,13);
				var time1 = t.substr(0,3) + "시"
	        	var content = list.rdContent;
	        	
	        	if(list.rdContent.length > 60){
	        		content = list.rdContent.substr(0,61) + "...";
		        	var s ="<td data-bs-toggle='tooltip' data-bs-placement='bottom' title='" + list.rdContent + "'>"+ content + "</td>";
	        		content += s;
	        	}else{
	        		content="<td>"+ list.rdContent + "</td>";
	        	}
	        	
<<<<<<< HEAD
				str = str + "<tr style='cursor:pointer;' onClick = location.href='processing/detail?hdln="+list.rdDln +"'><td>"+list.rdNo+"</td><td>"+list.hospital.hname+"</td>" + content + "<td>"+list.rdTitle+"</td><td>"+list.rdApplicationdate.substr(0,10)+"</td><td>"+
=======
				str = str + "<tr><td>"+list.rdNo+"</td><td onClick = location.href='processing/detail?hdln="+list.rdDln +"'>"+list.hospital.hname+"</td>" + content + "<td>"+list.rdTitle+"</td><td>"+list.rdApplicationdate.substr(0,10)+"</td><td>"+
>>>>>>> refs/remotes/origin/JY
	        	list.rdCounDate.substr(0,10) + time1 +"</td><td><button id='confirmation' type='button' class='btn btn-sm btn-dark' onclick='confirmation(" + list.rdDln +")'>확정</button></td><tr>";
	
			})   
	
	        $("#notificationListTable").html(str);
	                    	  
	        var str2 ="<ul class='pagination justify-content-center'>";
	        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='notificationList(1)'><span>&laquo;</span></a></li>"; 
	         
    	  	if(result.groupNo > 1){
    	  		var no = result.startPageNo-1;
    	  		str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='notificationList("+ no +")'><span>&lsaquo;</span></a></li>";
    	  	}
	        
	        for(var i=result.startPageNo; i<=result.endPageNo; i++){
	            if(i != result.pageNo){
	                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='notificationList(" +i + ")'>" +i +"</a></li>";
	            }else{
	                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link text-primary' onclick='notificationList(" +i + ")'>" +i +"</a></li>";
	            }
	        }

	    	if(result.groupNo < result.totalGroupNo){
	        	var num = result.endPageNo +1;
	        	str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='notificationList(" + num + ")'><span>&rsaquo;</span></a></li>";
			}
	        
	        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='notificationList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
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
		
		//시작일 종료일
		let sdate1 = $("#startdate1").val();
		let edate1 = $("#enddate1").val();
		
		//시작일과 종료일이 선택되지 않았다면 일괄적으로 이번 년도로 검색 
		if(sdate1 === '' && edate1 === ''){
			sdate1='2022-01-01';
			edate1='2022-12-31';
		}
		
        let searchBar = $("#searchBar2").val();
        
        $.ajax({
        	url: 'selectScheduleList',
            type: 'post',
            data: {"searchBar": searchBar, "sdate1":sdate1, "edate1":edate1, "pageNo": no}
        }).done(function (result){
                    
        console.log(result);
        
       	var str="";

        $.each(result.counselingScheduleList,function(index,list){

			var date1 = list.counScheStartdate.substr(0, 10);
			var t = list.counScheStartdate.substr(10,13);
			var time1 = t.substr(0,3) + "시"
			
        	var content1 = list.counScheContent;

        	if(list.counScheContent.length > 50){
        		content1 = list.counScheContent.substr(0,51) + "...";
	        	var s ="<td data-bs-toggle ='tooltip' data-bs-placement='top' title='" + list.counScheContent + "'>"+ content1 + "</td>";
        		content1 += s;
        	}else{
        		content1="<td>"+ list.counScheContent + "</td>";
        	}
			
			str = str + "<tr style='cursor:pointer;' onClick = location.href='processing/detail?hdln="+list.hospital.hdln +"'><td>"+list.counNo+"</td><td>"+"상담"+
        	"</td><td>"+list.hospital.hname+"</td><td>"+list.counScheAddress+
        	"</td>" + content1 + "<td>"+date1+"</td><td>"+time1+"</td><tr>";

		})   

        $("#scheduleListTable").html(str);
                    	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectScheduleList(1)'><span>&laquo;</span></a></li>";
	  	if(result.groupNo > 1){
	  		var no = result.startPageNo-1;
	  		str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectScheduleList("+ no +")'><span>&lsaquo;</span></a></li>";
	  	} 
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
            if(i != result.pageNo){
                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }else{
                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link text-primary' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }
        }
    	if(result.groupNo < result.totalGroupNo){
      	  var num = result.endPageNo +1;
      	  str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectScheduleList(" + num + ")'><span>&rsaquo;</span></a></li>";
        }
        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectScheduleList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";
        
		$("#scheduleListPager").html(str2);
			
		});
	}
    
	//AS 스케줄 리스트를 보여주는
	function selectAsScheduleList(no) { 
    	
		//시작일 종료일
		let sdate1 = $("#startdate1").val();
		let edate1 = $("#enddate1").val();
		
		//시작일과 종료일이 선택되지 않았다면 일괄적으로 이번 년도로 검색 
		if(sdate1 === '' && edate1 === ''){
			sdate1='2022-01-01';
			edate1='2022-12-31';
		}
		
        let searchBar = $("#searchBar2").val();
        $.ajax({
        	url: 'selectAsScheduleList',
            type: 'post',
            data: {"searchBar": searchBar, "sdate1":sdate1, "edate1":edate1, "pageNo": no}
        }).done(function (result){
                            
       	var str="";

        $.each(result.asScheduleList,function(index,list){
        	
			var date = list.asStartDate.substr(0, 10);	
			var t = list.asStartDate.substr(10,13);
			var time = t.substr(0,3) + "시"
			
			str = str + "<tr><td>"+list.asNo+"</td><td>"+"AS"+
        	"</td><td>"+list.hospital.hname+"</td><td>"+ list.asAddress +
        	"</td><td>"+list.asContent+"</td><td>"+date+"</td><td>"+time+"</td><tr>";

		})   

        $("#scheduleListTable").html(str);
                    	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList(1)'><span>&laquo;</span></a></li>";
	  	if(result.groupNo > 1){
	  		var no = result.startPageNo-1;
	  		str2 += "<li class='page-item'><a class='page-link' onclick='selectScheduleList("+ no +")'><span>&lsaquo;</span></a></li>";
	  	} 
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
            if(i != result.pageNo){
                str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }else{
                str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='selectScheduleList(" +i + ")'>" +i +"</a></li>";
            }
        }
    	if(result.groupNo < result.totalGroupNo){
      	  var num = result.endPageNo +1;
      	  str2 += "<li class='page-item'><a class='page-link' onclick='selectScheduleList(" + num + ")'><span>&rsaquo;</span></a></li>";
        }
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectScheduleList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";
        
		$("#scheduleListPager").html(str2);
			
		});
	}
    
</script>