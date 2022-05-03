<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">
    <div class="dentist_processing">

      <div class="pagetitle">
        <h1>Construction Schedule List</h1>
 
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Schedule</li>
            <li class="breadcrumb-item">List</li>
            <li class="breadcrumb-item active">Construction</li>
          </ol>
        </nav>

      </div><!-- End Page Title -->

      <section class="section">
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">시공 스케줄</h5>
                
                <div class="d-flex justify-content-between">                  
					<!-- 카테고리 선택하는 체크박스 -->
					<div class="d-flex " style="margin-bottom: 1rem;">
						<span class="" style="padding-right: 3rem; font-weight: 600;">시공 카테고리</span>
			
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox1" name="checkBox"
								value="전기" onclick="selectList()" checked="checked"> <label
								class="" for="categoryCheckbox1">전기</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox2" name="checkBox"
								value="설비" onclick="selectList()" checked="checked"> <label
								class="" for="categoryCheckbox2">설비</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox3" name="checkBox"
								value="도배" onclick="selectList()" checked="checked"> <label
								class="" for="categoryCheckbox3">도배</label>
						</div>
						<div class="" style="padding-right: 2rem;">
							<input type="checkbox" id="categoryCheckbox4" name="checkBox"
								value="가구" onclick="selectList()" checked="checked"> <label
								class="" for="categoryCheckbox4">가구</label>
						</div>
					</div>
                 
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
                      <th scope="col">병원명</th>
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
        
        $("input[name='checkBox']:checked").each(function(i) {
            checkboxValues.push($(this).val());
        }); 
    	
        console.log(checkboxValues);
        
        var allData = { "checkArray": checkboxValues };
    	
        let searchBar = $("#searchBar").val();
        $.ajax({
        	url: 'selectList',
            type: 'post',
            data: {"checkArray": checkboxValues, "searchBar": searchBar , "pageNo": no}
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
        $("#constructionListTable").html(str);
                    	  
        var str2 ="<ul class='pagination justify-content-center'>";
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectList(1)'><span>&laquo;</span></a></li>";
        
	  	if(result.groupNo > 1){
	  		var no = result.startPageNo-1;
	  		str2 += "<li class='page-item'><a class='page-link' onclick='selectList("+ no +")'><span>&lsaquo;</span></a></li>";
	  	}
        
        for(var i=result.startPageNo; i<=result.endPageNo; i++){
            if(i != result.pageNo){
                str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectList(" +i + ")'>" +i +"</a></li>";
            }else{
                str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='selectList(" +i + ")'>" +i +"</a></li>";
            }
        }
        
    	if(result.groupNo < result.totalGroupNo){
      	  var num = result.endPageNo +1;
      	  str2 += "<li class='page-item'><a class='page-link' onclick='selectList(" + num + ")'><span>&rsaquo;</span></a></li>";
        }
        
        str2 = str2 + "<li class='page-item'><a class='page-link' onclick='selectList("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        str2 = str2 + "</ul>";
        
		$("#constructionListTablePager").html(str2);
			
		});
	}
    
</script>