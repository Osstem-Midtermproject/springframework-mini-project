<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<style>
.table {
	text-align: center;
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
	background-color: orange;
	border-color: orange;
}

th a {
	color: black;
}

.table-bordered th:hover {
	color: #fff;
	background-color: orange;
	border-color: orange;
}

.location th a:hover {
	color: white;
}

th:focus {
	background-color: #f59342;
}

button:focus {
	background-color: orange;
	color: white;
	border: white;
	box-shadow: 0 0 0 0.1rem rgba(216, 13, 13, 0.5);
}

.btn-check:focus+.btn-outline-primary, .btn-outline-primary:focus {
	box-shadow: 0 0 0 0.1rem rgba(240, 114, 11, 0.87);
}

.page-link:focus {
	z-index: 3;
	color: #ffffff;
	background-color: rgba(240, 114, 11, 0.87);
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgba(87, 81, 81, 0.25);
}

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

<script>
    

//지도 위에 마우스를 올려 놓을 시 해당 지역이 선택 된 상태의 이미지로 ㅂ전환 된다.
    function mouseOver(num){
      document.getElementById("go").src = "${pageContext.request.contextPath}/resources/images/map_images/local-map-on" + num + ".png";

      };
		   
   	function kakaoMap(address, name){
		console.log("fdhskfsjnfn");
		//카카오 지도 APi를 사용하여 주소를 검색하여 해당 주소의 위도와 경로르 받아온다. 
   		$.ajax({
 	  		url:'https://dapi.kakao.com/v2/local/search/address.json?query=' + address,
 		   	type:'GET',
 	      	headers: {'Authorization' : 'KakaoAK 6923e9425d562a292a262dc06dfae757'},
 		    success:function(data){
	    		console.log(address)
			    console.log(data);
 	            	
 	            	//주소가 잘 못 된 경우가 있는데 이럴때는 병원 명을 사용하여 검색하였다.
 	            	if(data['documents'].length > 0){

 	            	//받은 위도와 경도를 기준으로 link를 타고 출력한다.
 	                   	var map_url_x = data['documents'][0]['x'];
 	                   	var map_url_y = data['documents'][0]['y'];
 	                   	var url = "https://map.kakao.com/link/map/" + name +","+map_url_y +","+map_url_x;
 	                   	console.log(url);
 	                    window.open(url);
 	                    
 	            	} else { //병원명 검색을 사용하고 같은 이름의 병원이 여러개 있을 시 병원 카테고리에 속하고 지역시와 지역구가 일치하는 곳을 출력한다. 
 	            		$.ajax({
 	 	    	       		url:'https://dapi.kakao.com/v2/local/search/keyword.json?query=' + name,
 	 	    	           	type:'GET',
 	 	    	           	headers: {'Authorization' : 'KakaoAK 6923e9425d562a292a262dc06dfae757'},
 	 	    	            success:function(data){
 	 	    	            	console.log(data);
 	 	    	                for(var i = 0; i < data['documents'].length; i++){
 	 	    	                	console.log(data['documents'][i]['road_address_name']);
 	 	    	                    if((data['documents'][i]['category_group_code'] == "HP8") && (data['documents'][i]['road_address_name'].slice(0,4)==address.slice(0,4))){
 	 	    	                        var map_url = data['documents'][i]['place_url'];
 	 	    	                        window.open(map_url);
 	 	    	                    } 
 	 	    	                }
 	 	    	            },
 	 	    	            error : function(e){
 	 	    	               console.log(e);
 	 	    	            }
 	 	    	    	});
 	            	}
 	            },
 	            error : function(e){
 	            
 	     	    }
 		});
    };
    
  	//이미지 클릭시 ajax로 이미지 변경
	$(function(){
		$('.locationmap').on("click",function(){
			//id값을 가져온다
			let location = $(this).attr('id');
			let locationKR = '강원';
			if(location == '1'){
				locationKR = '강원';
			} else if(location == '2'){
				locationKR = '서울';
			} else if(location == '3'){
				locationKR = '인천';
			} else if(location == '4'){
				locationKR = '경기';
			} else if(location == '5'){
				locationKR = '대구';
			} else if(location == '6'){
				locationKR = '울산';
			} else if(location == '7'){
				locationKR = '경북';
			} else if(location == '8'){
				locationKR = '충북';
			} else if(location == '9'){
				locationKR = '대전';
			}else if(location == '10'){
				locationKR = '충남';
			}else if(location == '11'){
				locationKR = '전북';
			}else if(location == '12'){
				locationKR = '광주';
			}else if(location == '13'){
				locationKR = '전남';
			}else if(location == '14'){
				locationKR =' 부산';
			}else if(location == '15'){
				locationKR = '경남';
			}else if(location == '16'){
				locationKR = '제주';
			} 
			
			console.log(location);
			console.log(locationKR);
			
			$.ajax({
				url:"mapimage",
				type:'post',
			    data:{"location":location, "locationKR":locationKR}
			}).done(data => {
					console.log(location);
					var imgTag = "<img";
					imgTag += " src = '${pageContext.request.contextPath}/resources/images/map_images/local-map-on" + location + ".png' usemap='#Map' class='map-img' id='go'>";
					
					console.log(imgTag);
					//$("#go").html(data.totalFileNum);
					$(".locationmap."+location).focus();
					$("#dl").html(imgTag);
					
					// 가져온 리스트를 출력하는데 이상하게 each가 안 먹히므로 for로 대체한다.
						 
					var List = data.detailLocationList;
					console.log(List);
					
					var listTag = "";
					for(var i = 0; i < List.length; i++){
						listTag += "<tr>";
						listTag += "<td>" + List[i].hno + "</td>";
						listTag += "<td>" + List[i].hname + "</td>";
						listTag += "<td>" + List[i].haddress + "</td>";
						listTag += "<td>" + List[i].hpn + "</td>";
						
						listTag += "<td><button type='button' class='btn btn-outline-primary'";
						listTag += "onclick=\"location.href='${pageContext.request.contextPath}/schedule/processing/detail?hdln=" + List[i].hdln + "'\">내역보기</button></td>";
						
						listTag += "<td><button type='button' class='btn btn-outline-primary'";
						listTag += "onclick=\"kakaoMap('"+  List[i].haddress  + "','"  + List[i].hname + "')\">지도</button></td>";
						listTag += "</tr>";
						
					/* 	<button type="button" class="btn btn-outline-primary"
							onclick="kakaoMap('${location.haddress}', '${location.hname}')">지도</button> */
						
					}
					$(".detailList").html(listTag);
					
					
				/* 	<tr class="detailList">

					<td>${location.hno}</td>
					<td>${location.hname}</td>
					<td>${location.haddress}</td>
					<td>${location.hpn}</td>
					<td><button type="button" class="btn btn-outline-primary"
							onclick="location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=${location.hdln}'">내역보기</button></td>
					<td><button type="button" class="btn btn-outline-primary"
							onclick="kakaoMap('${location.haddress}', '${location.hname}')">지도</button></td>

				</tr> */
					
				
			})
		})
	});

  </script>

<main id="main" class="main">
	<div class="d-flex">
		<div class="pagetitle d-flex align-items-end">
			<h1>병원</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">홈</li>
					<li class="breadcrumb-item">병원</li>
					<li class="breadcrumb-item active">위치정보</li>
				</ol>
			</nav>
		</div>
	</div>

	<!-- 이미지별 위치 값 별도 지정 할 것 -->
	<div class="center-find hide md-inline-block" style="padding: 3rem 0 2rem 0; margin-bottom: 0.5rem;">
		<div class="map-wrap">
			<div class="hover-warp"
				style="display: flex; justify-content: center;">
	
				<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	
				<div id="dl">
	
					<img src="${pageContext.request.contextPath}/resources/images/map_images/local-map-on1.png" usemap="#Map" class="map-img" id="go">
	
				</div>
	
				<!-- 지도 바꾸기 ajax -->
	
				<map name="Map" id="Map">
					<area class="locationmap" tabindex="0" shape="poly" id="1" 
						coords="127,11,117,27,72,28,92,53,97,66,105,89,137,98,167,101,172,87" onmouseover="mouseOver(1);">
						
					<area class="locationmap" tabindex="0" shape="poly" id="2"
						coords="55,67,45,73,51,80,60,74" onmouseover="mouseOver(2);">
						
					<area class="locationmap" tabindex="0" shape="poly" id="3"
						coords="29,74,41,79,36,85,27,80,25,74" onmouseover="mouseOver(3);" value="3">
	
					<area class="locationmap" tabindex="0" shape="poly" id="4"
						coords="53,37,72,45,77,60,81,74,91,84,85,103,69,115,50,113,35,79,34,65" onmouseover="mouseOver(4);">
	
					<area class="locationmap" tabindex="0" shape="poly" id="5"
						coords="146,184,137,186,134,195,139,199,147,198,149,190" onmouseover="mouseOver(5);">
						
					<area class="locationmap" tabindex="0" shape="poly" id="6"
						coords="186,189,179,201,181,206,189,206,194,194"
						onmouseover="mouseOver(6);">
						
					<area class="locationmap" tabindex="0" shape="poly" id="7"
						coords="183,107,172,115,156,114,139,121,134,131,106,141,105,160,112,174,108,191,123,204,148,208,171,200,182,182"
						onmouseover="mouseOver(7);">
						
					<area class="locationmap" tabindex="0" shape="poly" id="8"
						coords="132,111,116,107,107,107,91,109,74,121,74,124,76,135,70,142,82,151,91,175,98,180,94,155,94,137"
						onmouseover="mouseOver(8);">
						
					<area class="locationmap" tabindex="0" shape="poly" id="9"
						coords="72,159,72,165,76,161" onmouseover="mouseOver(9);" >
					
					<area class="locationmap" tabindex="0" shape="poly" id="10"
						coords="10,126,31,157,33,176,62,172,79,178,65,160,63,144,56,127" onmouseover="mouseOver(10);">
					
					<area class="locationmap" tabindex="0" shape="poly" id="11"
						coords="27,208,23,221,31,227,39,221,52,220,59,230,77,226,81,218,84,199,95,190,86,187,68,187,48,179,35,187,35,195"
						onmouseover="mouseOver(11);">
					
					<area class="locationmap" tabindex="0" shape="poly" id="12"
						coords="41,235,48,240,47,248,40,247,39,239" onmouseover="mouseOver(12);">
				
					<area class="locationmap" tabindex="0" shape="poly" id="13"
						coords="16,227,13,241,17,258,15,268,2,286,21,299,33,291,43,291,59,272,67,273,81,259,90,251,76,235,49,234,40,227,25,234"
						onmouseover="mouseOver(13);">
				
					<area class="locationmap" tabindex="0" shape="poly" id="14"
						coords="169,236,163,242,163,249,177,243" onmouseover="mouseOver(14);">
					
					<area class="locationmap" tabindex="0" shape="poly" id="15"
						coords="99,195,87,211,89,227,87,243,97,256,110,252,115,260,126,255,142,243,157,244,169,232,179,236,186,214,143,216,113,212"
						onmouseover="mouseOver(15);">
					
					<area class="locationmap" tabindex="0" shape="poly" id="16"
						coords="64,320,41,327,33,327,24,325,28,314,51,305,63,306,68,311"onmouseover="mouseOver(16);">
				</map>
			</div>
		</div>
	</div>
	
	
	<div class="card-body" style="padding: 2rem;">
		<!-- Bordered Table -->
		<table class="table table-bordered">
			<!-- 키보드 초점을 받을 수 없는 div, span과 같은 요소도 초점을 받을 수 있도록 만들어 줍니다 -->

			<tr>
				<th tabindex="0" scope="col" class = "locationmap 1" id="1"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=강원'" --%>
					>강원</th>
				<th tabindex="0" scope="col" class = "locationmap 4" id="4" 
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경기'" --%>
					>경기</th>
				<th tabindex="0" scope="col" class = "locationmap 15" id="15"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경남'" --%>
					>경남</th>
				<th tabindex="0" scope="col" class = "locationmap 7" id="7"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경북'" --%>
					>경북</th>
				<th tabindex="0" scope="col" class = "locationmap 12" id="12"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=광주'" --%>
					>광주</th>
				<th tabindex="0" scope="col" class = "locationmap 5" id="5"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=대구'" --%>
					>대구</th>
				<th tabindex="0" scope="col" class = "locationmap 9" id="9"
				<%-- 	onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=대전'" --%>
					>대전</th>
				<th tabindex="0" scope="col" class = "locationmap 14" id="14"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=부산'" --%>
					>부산</th>
			</tr>
			<tr>
				<th tabindex="0" scope="col" class = "locationmap 2" id="2"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=서울'" --%>
					>서울</th>
				<th tabindex="0" scope="col" class = "locationmap 6" id="6"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=울산'" --%>
					>울산</th>
				<th tabindex="0" scope="col" class = "locationmap 3" id="3"
				<%-- 	onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=인천'" --%>
					>인천</th>
				<th tabindex="0" scope="col" class = "locationmap 13" id="13"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=전남'" --%>
					>전남</th>
				<th tabindex="0" scope="col" class = "locationmap 11" id="11"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=전북'" --%>
					>전북</th>
				<th tabindex="0" scope="col" class = "locationmap 16" id="16"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=제주'" --%>
					>제주</th>
				<th tabindex="0" scope="col" class = "locationmap 10" id="10"
					<%-- onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=충남'" --%>
					>충남</th>
				<th tabindex="0" scope="col" class = "locationmap 8" id="8"
					<%-- nclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=충북'" --%>
					>충북</th>
			</tr>


		</table>
		<!-- End Bordered Table -->


		<table class="table table-hover" id="info_table">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">병원 이름</th>
					<th scope="col">주소</th>
					<th scope="col">전화</th>
					<th scope="col">내역보기</th>
					<th scope="col">약도</th>
				</tr>
			</thead>

			<tbody class="detailList">
			
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
	</div>
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>