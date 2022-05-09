<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>

<div class="container pt-2">
	<div class="row align-items-center">
		<div class="text-center" style="width: 100%; border-bottom: solid rgb(32, 54, 68); margin-bottom: 2rem; padding-bottom: 1rem;">
			<span style="font-weight: 600; font-size: 1.7rem; color: rgb(32, 54, 68); margin-bottom: 1rem; padding-bottom: 1rem;">진행 내역 확인</span>
		</div>
	<div class="" style="width: 80%; margin: auto;">

		<div class="d-flex"  style="margin-right: 10%;">
			<!-- 카테고리 선택하는 체크박스 -->
			<div class="col d-flex align-items-ceter" style="margin-bottom: 1rem;">
				<span class="" style="padding-right: 3rem; font-weight: 600;">카테고리</span>
	
				<div class="" style="padding-right: 2rem;">
					<input type="checkbox" id="categoryCheckbox1" name="checkBox" value="상담" onclick="checkBox()" checked="checked"> <label class="" for="categoryCheckbox1">상담</label>
				</div>
				<div class="" style="padding-right: 2rem;">
					<input type="checkbox" id="categoryCheckbox2" name="checkBox" value="계약" onclick="checkBox()" checked="checked"> <label class="" for="categoryCheckbox2">계약</label>
				</div>
				<div class="" style="padding-right: 2rem;">
					<input type="checkbox" id="categoryCheckbox3" name="checkBox" value="시공" onclick="checkBox()" checked="checked"> <label class="" for="categoryCheckbox3">시공</label>
				</div>
				<div class="" style="padding-right: 2rem;">
					<input type="checkbox" id="categoryCheckbox4" name="checkBox" value="AS" onclick="checkBox()" checked="checked"> <label class="" for="categoryCheckbox4">AS</label>
				</div>
			</div>
		</div>
		

		<!-- 리스트 -->
		<table class="table table-hover" style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
			<thead>
				<th scope="col">번호</th>
				<th scope="col">병원이름</th>
				<th scope="col">병원장</th>
				<th scope="col">전화번호</th>
				<th scope="col">날짜</th>
				<th scope="col">진행상태</th>
			</thead>
			<tbody id="progressListBody">

			</tbody>
		</table>
		<!-- 페이징 -->
		<div id="progressListPager">
		
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>


<script type="text/javascript">
		
		$(document).ready(function(){
			checkBox(1);
		});
                    
        function checkBox(no) { 
            var checkboxValues = [];
            
            $("input[name='checkBox']:checked").each(function(i) {
                checkboxValues.push($(this).val());
            }); 
        	
            
            if(checkboxValues.length == 0){
    	        $("#progressListBody").html(" ");
    	        
    	        var onePage = "<ul class='pagination justify-content-center'>";
    	        onePage += "<li class='page-item'><a class='page-link'><span>&laquo;</span></a></li>";
    	        onePage += "<li class='page-item'><a class='page-link'>1</a></li>";
    	        onePage += "<li class='page-item'><a class='page-link'><span>&raquo;</span></a></li><ul>";
    	        
    			$("#progressListPager").html(onePage);
            }
            
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
        	    	
        	    	var c1 = "";
        	    	var c2 = "";
        	    	var cate = list.pcategory;
        	    	
        	    	//전기, 설비, 도배, 가구
				    if(list.pcategory== "1"){
				    	c1="전기 시작";
				    	c2="전기 완료";
				    }else if(list.pcategory== "2"){
				    	c1="설비 시작";
				    	c2="설비 완료";
				    }else if(list.pcategory=="3"){
				    	c1="도배 시작";
				    	c2="도배 완료";
				    }else if(list.pcategory=="4"){
				    	c1="가구 시작";
				    	c2="가구 완료";
				    }else if(list.pcategory=="5"){
				    	c1="상담 시작";
				    	c2="상담 완료";
				    }else if(list.pcategory=="계약"){
				    	c1="계약 시작";
				    	c2="계약 완료";
				    }else if(list.pcategory=="AS"){
				    	c1="AS 시작";
				    	c2="AS 완료";
				    }
        	          
        	    	var date2 = list.penddate;
        	    	date2 = date2.substr(0,10);
        	    	
					var no2 = list.pno*2-1;
        	    	str = str + "<tr><td>"+no2+
        	        "</td><td>"+list.hospital.hname+"</td><td>"+list.hospital.hdirector+
        	        "</td><td>"+list.hospital.hpn+"</td><td>"+date2+"</td><td>"+c2+
        	        "</td></tr>";
        	        
        	    	var date1 = list.pdate;
        	    	date1 = date1.substr(0,10);
        	    	
					var no1 = list.pno*2;
        	    	str = str + "<tr><td>"+no1+
        	        "</td><td>"+list.hospital.hname+"</td><td>"+list.hospital.hdirector+
        	        "</td><td>"+list.hospital.hpn+"</td><td>"+date1+"</td><td>"+c1+
        	        "</td></tr>";
        	    })
        	    
    	    	$("#progressListBody").html(str);
        	  
        	    var str2 ="<ul class='pagination justify-content-center'>";
        	    str2 = str2 + "<li class='page-item'><a class='page-link' onclick='checkBox(1)'><span>&laquo;</span></a></li>";
        	    	
        	  	if(result.groupNo > 1){
        	  		var no = result.startPageNo-1;
        	  		str2 += "<li class='page-item'><a class='page-link' onclick='checkBox("+ no +")'><span>&lsaquo;</span></a></li>";
        	  	}   
        	    
        	    for(var i=result.startPageNo; i<=result.endPageNo; i++){
        	    		console.log(i);
        	    		if(i != result.pageNo){
        	    			str2 = str2 + "<li class='page-item'><a class='page-link' onclick='checkBox(" +i + ")'>" +i +"</a></li>";
        	    		}else{
        	    			str2 = str2 + "<li class='page-item'><a class='page-link text-primary' onclick='checkBox(" +i + ")'>" +i +"</a></li>";
        	    		}
        	    }
        	    
        		if(result.groupNo < result.totalGroupNo){
              	  var num = result.endPageNo +1;
              	  str2 += "<li class='page-item'><a class='page-link' onclick='checkBox(" + num + ")'><span>&rsaquo;</span></a></li>";
                }
        	    
            	str2 = str2 + "<li class='page-item'><a class='page-link' onclick='checkBox("+result.totalPageNo+")'><span>&raquo;</span></a></li>";
        	    str2 = str2 + "</ul>";
            	console.log(str2);
            	
        	    $("#progressListPager").html(str2);

            });
		}


</script>