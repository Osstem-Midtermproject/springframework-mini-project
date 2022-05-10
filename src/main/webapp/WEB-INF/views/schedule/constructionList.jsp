<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
    <div class="dentist_processing">

 	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>시공</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item">스케줄</li>
					<li class="breadcrumb-item">리스트</li>
					<li class="breadcrumb-item active">시공</li>
				</ol>
			</nav>
		</div>
	</div><!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body" style="padding-top: 40px;">
                <div class="d-flex justify-content-between">                  
					<!-- 카테고리 선택하는 체크박스 -->
					<div class="d-flex align-items-center" style="margin-bottom: 1rem;">
						<div class="d-flex"><h5 class="" style="padding-right: 3rem; font-weight: 500; margin-bottom: 0;">시공 카테고리</h5></div>
			
						<div class="d-flex align-items-center" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox1" name="checkBox"
								value="전기" onclick="selectList()" checked="checked"> <h6
								class="" for="categoryCheckbox1" style="margin-left: 0.2rem; margin-bottom: 0;">전기</h6>
						</div>
						<div class="d-flex align-items-center" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox2" name="checkBox"
								value="설비" onclick="selectList()" checked="checked"> <h6
								class="" for="categoryCheckbox2" style="margin-left: 0.2rem; margin-bottom: 0;">설비</h6>
						</div>
						<div class="d-flex align-items-center" style="padding-right: 2rem; margin-bottom: 0;">
							<input type="checkbox" id="categoryCheckbox3" name="checkBox"
								value="도배" onclick="selectList()" checked="checked"> <h6
								class="" for="categoryCheckbox3" style="margin-left: 0.2rem; margin-bottom: 0;">도배</h6>
						</div>
						<div class="d-flex align-items-center" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox4" name="checkBox"
								value="가구" onclick="selectList()" checked="checked"> <h6
								class="" for="categoryCheckbox4" style="margin-left: 0.2rem; margin-bottom: 0;">가구</h6>
						</div>
					</div>
                 
					<!-- 검색 및 검색 종류 -->
					<div class="search-bar">
						<div class="search-form d-flex align-items-center" method="POST">
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
                      <th scope="col">병원명</th>
                      <th scope="col">병원주소</th>
                      <th scope="col">시작일</th>
                      <th scope="col">종료일</th>
                      <th scope="col">카테고리</th>
                      <th scope="col">담당팀</th>
                    </tr>
                  </thead>
                  <tbody id="constructionListTable">

                  </tbody>
                </table>
                <!-- End Table with stripped rows -->
                
                <div id="constructionListTablePager">
                
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
		selectList(1);
	});
			
	$('#searchButton').submit(function(e){
		e.preventDefault();
	});
					
    function selectList(no) { 
    	
        var checkboxValues = [];
        
        $("input[name='checkBox']:checked").each(function() {
            checkboxValues.push($(this).val());
        }); 
        
        if(checkboxValues.length == 0){
	        $("#constructionListTable").html(" ");
	        
	        var onePage = "<ul class='pagination justify-content-center'>";
	        onePage += "<li class='page-item'><a class='page-link'><span>&laquo;</span></a></li>";
	        onePage += "<li class='page-item'><a class='page-link'>1</a></li>";
	        onePage += "<li class='page-item'><a class='page-link'><span>&raquo;</span></a></li><ul>";
	        
			$("#constructionListTablePager").html(onePage);
        }
    	        
        let searchBar = $("#searchBar").val();
       
        $.ajax({
        	url: 'selectList',
            type: 'post',
            data: {"checkArray": checkboxValues, "searchBar": searchBar , "pageNo": no}
        }).done(function (result){
        	console.log(result);
        
       		var str="";

	        $.each(result.constructionScheduleList,function(index,list){
	        	var today = new Date();

	        	var year = today.getFullYear();
	        	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	        	var day = ('0' + today.getDate()).slice(-2);

	        	var dateString = year + '-' + month  + '-' + day;
	        	
	        	var sdate = list.consScheStartdate.substr(0,10);
	        	var edate = list.consScheEnddate.substr(0, 10);
	        	
	        	if(dateString>edate){
	        		str = str + "<tr style='cursor:pointer;' class='text-muted' onClick = location.href='processing/detail?hdln="+list.consScheDln +"'><td>"+list.consNo+
		        	"</td><td>"+list.consScheHospitalName+"</td><td>"+list.consScheAddress+"</td><td>"+sdate+
		        	"</td><td>"+edate+"</td><td>"+list.constructionCategory.consCateType+"</td><td>"+list.team.tcategory+"</td><tr>";
	        	}else{
					str = str + "<tr style='cursor:pointer;' onClick = location.href='processing/detail?hdln="+list.consScheDln +"'><td>"+list.consNo+
		        	"</td><td>"+list.consScheHospitalName+"</td><td>"+list.consScheAddress+"</td><td>"+sdate+
		        	"</td><td>"+edate+"</td><td>"+list.constructionCategory.consCateType+"</td><td>"+list.team.tcategory+"</td><tr>";
	        	}
	        	
			})   

	        $("#constructionListTable").html(str);
	                    	  
	        var str2 ="<ul class='pagination justify-content-center'>";
	        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectList(1)'><span>&laquo;</span></a></li>";
	        
		  	if(result.groupNo > 1){
		  		var no = result.startPageNo-1;
		  		str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectList("+ no +")'><span>&lsaquo;</span></a></li>";
		  	}
	        
	        for(var i=result.startPageNo; i<=result.endPageNo; i++){
	            if(i != result.pageNo){
	                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectList(" +i + ")'>" +i +"</a></li>";
	            }else{
	                str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link text-primary' onclick='selectList(" +i + ")'>" +i +"</a></li>";
	            }
	        }
	        
	    	if(result.groupNo < result.totalGroupNo){
	      	  var num = result.endPageNo +1;
	      	  str2 += "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectList(" + num + ")'><span>&rsaquo;</span></a></li>";
	        }
	        
	        str2 = str2 + "<li style='cursor:pointer;' class='page-item'><a class='page-link' onclick='selectList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
	        str2 = str2 + "</ul>";
	        
			$("#constructionListTablePager").html(str2);
			
		});
	}
    
</script>