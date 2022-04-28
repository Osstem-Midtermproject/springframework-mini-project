<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>

<div class="row align-items-center mx-5 px-4">
	<div class="text-center"
		style="width: 100%; border-bottom: solid #f26522; margin-bottom: 2rem;">
		<span style="font-weight: 600; font-size: 1.5rem; color: #f26522;">진행
			내역 확인</span>
	</div>
	<div class="" style="width: 80%; margin: auto;">

		<!-- 카테고리 선택하는 체크박스 -->
		<div class="d-flex " style="margin-bottom: 1rem;">
			<span class="" style="padding-right: 3rem; font-weight: 600;">카테고리</span>

			<div class="" style="padding-right: 2rem;">
				<input type="checkbox" id="categoryCheckbox1" name="checkBox"
					value="상담" onclick="checkBox()" checked="checked"> <label
					class="" for="categoryCheckbox1">상담</label>
			</div>
			<div class="" style="padding-right: 2rem;">
				<input type="checkbox" id="categoryCheckbox2" name="checkBox"
					value="계약" onclick="checkBox()" checked="checked"> <label
					class="" for="categoryCheckbox2">계약</label>
			</div>
			<div class="" style="padding-right: 2rem;">
				<input type="checkbox" id="categoryCheckbox3" name="checkBox"
					value="시공" onclick="checkBox()" checked="checked"> <label
					class="" for="categoryCheckbox3">시공</label>
			</div>
			<div class="" style="padding-right: 2rem;">
				<input type="checkbox" id="categoryCheckbox4" name="checkBox"
					value="AS" onclick="checkBox()" checked="checked"> <label
					class="" for="categoryCheckbox4">AS</label>
			</div>
		</div>


		<!-- 날짜 선택 -->
		<script>
            $(function() {        
                            // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
                            // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

                            //시작일.
                            $('#fromDate').datepicker({
                                showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
                                buttonImage: "${pageContext.request.contextPath}/resources/images/calendar-check.svg", // 버튼 이미지
                                buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
                                dateFormat: "yy-mm-dd",             // 날짜의 형식
                                changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
                                onClose: function( selectedDate ) {    
                                    // 시작일(fromDate) datepicker가 닫힐때
                                    // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                                    $("#toDate").datepicker( "option", "minDate", selectedDate );
                                }                
                            });

                            //종료일
                            $('#toDate').datepicker({
                                showOn: "both", 
                                buttonImage: "${pageContext.request.contextPath}/resources/images/calendar-check.svg", 
                                buttonImageOnly : true,
                                dateFormat: "yy-mm-dd",
                                changeMonth: true,
                                //minDate: 0, // 오늘 이전 날짜 선택 불가
                                onClose: function( selectedDate ) {
                                    // 종료일(toDate) datepicker가 닫힐때
                                    // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                                    $("#fromDate").datepicker( "option", "maxDate", selectedDate );
                                }                
                            });
                        });

                    </script>

		<!-- 날짜 선택 -->
		<form>
			<div class="d-flex"
				style="margin-bottom: 1rem; font-weight: 600; font-size: 0.8rem;">
				<div style="margin-right: 2rem;">
					<label for="fromDate">시작일: </label> <input
						style="width: 6rem; height: 1rem;" class="text" name="fromDate"
						id="fromDate">
				</div>
				<div>
					<label for="toDate">종료일: </label> <input
						style="width: 6rem; height: 1rem;" type="text" name="toDate"
						id="toDate">
				</div>
			</div>

		</form>

		<!-- 리스트 -->
		<table class="table table-hover"
			style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
			<thead>
				<th scope="col">번호</th>
				<th scope="col">병원이름</th>
				<th scope="col">병원장</th>
				<th scope="col">전화번호</th>
				<th scope="col">날짜</th>
				<th scope="col">진행상태</th>
			</thead>
			<tbody id="progressListTbody">
				<c:forEach var="progress" items="${hospitalprogressList}"
					varStatus="status">
					<tr>
						<th id="pno" scope="row">${progress.pno}</th>
						<td id="hname">${progress.hospital.hname}</td>
						<td id="hdirector">${progress.hospital.hdirector}</td>
						<td id="hpn">${progress.hospital.hpn}</td>
						<td id="pdate"><fmt:formatDate value="${progress.pdate}"
								pattern="yyyy-MM-dd" /></td>
						<td id="pcategory">${progress.pcategory}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 -->
		<div id="pager2">
			<%@ include file="/WEB-INF/views/common/pagination2.jsp"%>
		</div>

	</div>
</div>

<script type="text/javascript">
                    
                    function checkBox(no) { 
                    	console.log("s");
                        var checkboxValues = [];
                        
                        $("input[name='checkBox']:checked").each(function(i) {
                            checkboxValues.push($(this).val());
                        }); 
                    	
                        console.log(checkboxValues);
                        
                        var allData = { "checkArray": checkboxValues };      
                        $.ajax({
                    		url: 'checkBox',
                    		type: 'post',
                    		data: { "checkArray": checkboxValues, "pageNo": no}
                    	}).done(function (result){
                    		console.log(${result.hospitalprogressList.pno});
                    		console.log(result);
                    		
                    		var str="";
                    		
                    	    $.each(result.hospitalprogressList,function(index,list){
                    	    	str = str + "<tr><td>"+list.pno+
                    	        "</td><td>"+list.hospital.hname+"</td><td>"+list.hospital.hdirector+
                    	        "</td><td>"+list.hospital.hpn+"</td><td>"+list.pdate+"</td><td>"+list.pcategory+
                    	        "</td></tr>";

                    	    })
                    	    
                	    	$("#progressListTbody").html(str);
                    	  
                    	    var str2 ="<ul class='pagination justify-content-center'>";
                    	    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='checkBox(1)'><span>&laquo;</span></a></li>";
                    	    	for(var i=result.startPageNo; i<=result.endPageNo; i++){
                    	    		console.log(i);
                    	    		if(i != result.pageNo){
                    	    			str2 = str2 + "<li class='page-item'><a class='page-link' onclick='checkBox(" +i + ")'>" +i +"</a></li>";
                    	    		}else{
                    	    			str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='checkBox(" +i + ")'>" +i +"</a></li>";

                    	    		}
                    	    	}
                        	    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='checkBox("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
                    	    	str2 = str2 + "</ul>";
                        	console.log(str2);

                    	    $("#pager2").html(str2);
                    	});
                    }
      	
                    </script>

<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>