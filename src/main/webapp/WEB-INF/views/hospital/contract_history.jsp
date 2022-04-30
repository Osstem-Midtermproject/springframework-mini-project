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
          <div class="search-form d-flex align-items-center" method="POST" action="#">
            <div class="col-xs-4">
              <div class="invalid-feedback">
                Please select a valid state.
              </div>
            </div>
            <input id="searchBar" type="text" name="query" placeholder="Search Hospital" value="${searchBar}" title="Enter search keyword">
            <button id="searchButton" type="button" title="Search" onclick="searchH(1)"><i class="bi bi-search"></i></button>
          </div>
        </div>

		<table class="table table-hover"
			style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
			<thead>
				<th scope="col">번호</th>
				<th scope="col">병원이름</th>
				<th scope="col">병원장 이름</th>
				<th scope="col">계약일</th>
				<th scope="col">계약금</th>
				<th scope="col">계약상태</th>
				<th scope="col">계약서</th>
			</thead>
			<tbody id=contractListTable>
				<c:forEach var="contract" items="${contractList}" varStatus="status">
					<tr>
						<th scope="row">${status.index+1}</th>
						<td>${contract.hospital.hname}</td>
						<td>${contract.hospital.hdirector}</td>
						<td><fmt:formatDate value="${contract.contDate}" pattern="yyyy-MM-dd" /></td>
						<td>${contract.contDownPayment}</td>
						
						<c:if test="${contract.contStatus==1}">
							<td>계약완료</td>
						</c:if>
						<c:if test="${contract.contStatus==0}">
							<td>계약파기</td>
						</c:if>
						<c:if test="${contract.cont != null}">
							<td><a class="btn btn-sm btn-secondary"
								style="font-size: x-small;" href="contractFormPdfAdmin?file=${contract.cont}">계약서 보기</a></td>
						</c:if>
						<c:if test="${contract.cont == null}">
							<td><a class="btn btn-sm btn-secondary disabled"
								style="font-size: x-small;" href="contractFormPdfAdmin?file=${contract.cont}">계약서 보기</a></td>
						</c:if>
					</tr>
				</c:forEach>

			</tbody>
		</table>
        <!-- End Table with hoverable rows -->
        
         <div id="contractTableListPager">
			<%@ include file="/WEB-INF/views/common/pagination3.jsp"%>
		</div>

<script type="text/javascript">
					$('#searchButton').submit(function(e){
						e.preventDefault();
					});
					
                    function searchH(no) { 
                    	let searchBar = $("#searchBar").val();
                    	console.log(searchBar);
                        $.ajax({
                    		url: 'search',
                    		type: 'post',
                    		data: {"searchBar": searchBar , "pageNo": no}
                    	}).done(function (result){
                    		console.log(${result});
                    		console.log(result);
                    		
                    		var str="";

                    	    $.each(result.searchContractList,function(index,list){
                    	    	                        		
                        	    str = str + "<tr><td>"+list.cno+
                    	        "</td><td>"+list.hospital.hname+"</td><td>"+list.hospital.hdirector+
                    	        "</td><td>"+list.contDate+"</td><td>"+list.contDownPayment+"</td>";
                    	        
                    	        if(list.contStatus==1){
                    	        	str += "<td>계약완료</td>";
                    	        }else{
                    	        	str += "<td>계약파기</td>";
                    	        }
                    	        console.log(list.cont);
                    	        
                    	        if(list.cont != null){
                    	        	
                    	        	str += "<td><a class='btn btn-sm btn-secondary' style='font-size: x-small;' href='contractFormPdfAdmin?file='"+list.cont+"'>계약서 보기</a></td>";                   
                    	        }else{
                    	        	str += "<td><a class='btn btn-sm btn-secondary disabled' style='font-size: x-small;' href='contractFormPdfAdmin?file='"+list.cont+"'>계약서 보기</a></td>";
                    	        }
                    	        str += "</tr>";

                    	    })
                    	    
                	    	$("#contractListTable").html(str);
                    	  
                    	    var str2 ="<ul class='pagination justify-content-center'>";
                    	    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH(1)'><span>&laquo;</span></a></li>";
                    	    	for(var i=result.startPageNo; i<=result.endPageNo; i++){
                    	    		console.log(i);
                    	    		if(i != result.pageNo){
                    	    			str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH(" +i + ")'>" +i +"</a></li>";
                    	    		}else{
                    	    			str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='searchH(" +i + ")'>" +i +"</a></li>";
                    	    		}
                    	    	}
                        	    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='searchH("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
                    	    	str2 = str2 + "</ul>";
                        		console.log(str2);

                    	    $("#contractTableListPager").html(str2);
                    	});
                    }
      	
</script>

  </main><!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>