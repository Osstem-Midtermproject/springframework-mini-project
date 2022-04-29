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
	box-shadow: 0 0 0 0.25rem rgba(216, 13, 13, 0.5);
}

.btn-check:focus+.btn-outline-primary, .btn-outline-primary:focus {
	box-shadow: 0 0 0 0.25rem rgba(240, 114, 11, 0.87);
}

.page-link:focus {
	z-index: 3;
	color: #ffffff;
	background-color: rgba(240, 114, 11, 0.87);
	outline: 0;
	box-shadow: 0 0 0 0.25rem rgba(87, 81, 81, 0.25);
}
</style>

<script>
    

//지도 위에 마우스를 올려 놓을 시 해당 지역이 선택 된 상태의 이미지로 ㅂ전환 된다.
    function mouseOver(num){
      document.getElementById("go").src = "${pageContext.request.contextPath}/resources/images/map_images/local-map-on" + num + ".png";

      };
		   
      function kakaoMap(address, name){
		
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



  </script>



<main id="main" class="main">

	<div class="card">
		<div class="card-body">

			<h5 class="card-title">병원 목록</h5>

			<!-- Table with hoverable rows -->

			<!-- 검색 및 검색 종류 -->


			<div class="d-flex align-items-center ">
				<div class="col d-flex justify-content-start">
					<select class="form-select border-1"
						style="font-weight: bold; width: 10rem; margin-bottom: 1rem;">
						<option selected>전체</option>
						<option value="1">병원</option>
						<option value="2">전화</option>
					</select>


					<div class="search-bar">
						<form class="search-form d-flex align-items-center" method="POST"
							action="#">
							<input type="text" name="query" placeholder="Search"
								title="Enter search keyword">
							<button type="button" class="btn btn-outline-warning ">
								<i class="bi bi-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 이미지별 위치 값 별도 지정 할 것 -->
			<div class="center-find hide md-inline-block">
				<div class="map-wrap">
					<div class="hover-warp"
						style="display: flex; justify-content: center;">

						<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

						<div id="dl">

							<script>
						
						//페이지 로드 시 자동으로 실행하는 데 파라미터 값을 읽어온다. 이 때 파라미터 값을 읽고 이미지를 불러 올 수 있게 if문으로 번호로 변경하였다. 
						$(document).ready(function(){ 
							const urlParams = new URL(location.href).searchParams;

							const name = urlParams.get('locationHaddress');
							console.log(name);

							if(name == '강원'){
								lo = '1';
							} else if(name == '서울'){
								lo = '2';
							} else if(name == '인천'){
								lo = '3';
							} else if(name == '경기'){
								lo = '4';
							} else if(name == '대구'){
								lo = '5';
							} else if(name == '울산'){
								lo = '6';
							} else if(name == '경북'){
								lo = '7';
							} else if(name == '충북'){
								lo = '8';
							} else if(name == '대전'){
								lo = '9';
							}else if(name == '충남'){
								lo = '10';
							}else if(name == '전북'){
								lo = '11';
							}else if(name == '광주'){
								lo = '12';
							}else if(name == '전남'){
								lo = '13';
							}else if(name == '부산'){
								lo = '14';
							}else if(name == '경남'){
								lo = '15';
							}else if(name == '제주'){
								lo = '16';
							} 
							
							 var name2 = "location" + lo;
						     
							 //하단의 지역구 테이블에도 선택 된 상태로 둔다.
						        document.getElementById(name2).focus();
						      
							//이미지를 고정 및 전환한다.
							$("#go").attr("src", "${pageContext.request.contextPath}/resources/images/map_images/local-map-on" + lo +".png");
							
							  
							//$("#go").attr("src", "${pageContext.request.contextPath}/resources/images/map_images/local-map-on" + lo +".png");
						});

						
							
						</script>


							<img scr="" usemap="#Map" class="map-img" id="go">

						</div>

						<map name="Map" id="Map">
							<area class="kangwon" tabindex="0" shape="poly"
								coords="127,11,117,27,72,28,92,53,97,66,105,89,137,98,167,101,172,87"
								onmouseover="mouseOver(1);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=강원'">
							<area class="seoul" tabindex="0" shape="poly"
								coords="55,67,45,73,51,80,60,74" onmouseover="mouseOver(2);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=서울'">
							<area class="incheon" tabindex="0" shape="poly"
								coords="29,74,41,79,36,85,27,80,25,74"
								onmouseover="mouseOver(3);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=인천'">

							<area class="kyungki" tabindex="0" shape="poly"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경기'"
								coords="53,37,72,45,77,60,81,74,91,84,85,103,69,115,50,113,35,79,34,65"
								onmouseover="mouseOver(4);">

							<area class="daegu" tabindex="0" shape="poly"
								coords="146,184,137,186,134,195,139,199,147,198,149,190"
								onmouseover="mouseOver(5);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=대구'">
							<area class="ulsan" tabindex="0" shape="poly"
								coords="186,189,179,201,181,206,189,206,194,194"
								onmouseover="mouseOver(6);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=울산'">
							<area class="kyungbuk" tabindex="0" shape="poly"
								coords="183,107,172,115,156,114,139,121,134,131,106,141,105,160,112,174,108,191,123,204,148,208,171,200,182,182"
								onmouseover="mouseOver(7);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경북'">
							<area class="chungbuk" tabindex="0" shape="poly"
								coords="132,111,116,107,107,107,91,109,74,121,74,124,76,135,70,142,82,151,91,175,98,180,94,155,94,137"
								onmouseover="mouseOver(8);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=충북'">
							<area class="daejeon" tabindex="0" shape="poly"
								coords="72,159,72,165,76,161" onmouseover="mouseOver(9);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=대전'">
							<area class="chungnam" tabindex="0" shape="poly"
								coords="10,126,31,157,33,176,62,172,79,178,65,160,63,144,56,127"
								onmouseover="mouseOver(10);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=충남'">
							<area class="jeonbuk" tabindex="0" shape="poly"
								coords="27,208,23,221,31,227,39,221,52,220,59,230,77,226,81,218,84,199,95,190,86,187,68,187,48,179,35,187,35,195"
								onmouseover="mouseOver(11);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=전북'">
							<area class="kwangju" tabindex="0" shape="poly"
								coords="41,235,48,240,47,248,40,247,39,239"
								onmouseover="mouseOver(12);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=광주'">
							<area class="jeonnam" tabindex="0" shape="poly"
								coords="16,227,13,241,17,258,15,268,2,286,21,299,33,291,43,291,59,272,67,273,81,259,90,251,76,235,49,234,40,227,25,234"
								onmouseover="mouseOver(13);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=전남'">
							<area class="busan" tabindex="0" shape="poly"
								coords="169,236,163,242,163,249,177,243"
								onmouseover="mouseOver(14);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=부산'";>
							<area class="kyungnam" tabindex="0" shape="poly"
								coords="99,195,87,211,89,227,87,243,97,256,110,252,115,260,126,255,142,243,157,244,169,232,179,236,186,214,143,216,113,212"
								onmouseover="mouseOver(15);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경북'">
							<area class="jeju" tabindex="0" shape="poly"
								coords="64,320,41,327,33,327,24,325,28,314,51,305,63,306,68,311"
								onmouseover="mouseOver(16);"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=제주'">
						</map>
					</div>
				</div>
			</div>

			<div class="card" style="margin-top: 30px;">
				<div class="card-body">
					<!-- Bordered Table -->
					<table class="table table-bordered">
						<!-- 키보드 초점을 받을 수 없는 div, span과 같은 요소도 초점을 받을 수 있도록 만들어 줍니다 -->

						<tr>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=강원'"
								id="location1">강원</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경기'"
								id="location4">경기</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경남'"
								id="location15">경남</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=경북'"
								id="location7">경북</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=광주'"
								id="location12">광주</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=대구'"
								id="location5">대구</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=대전'"
								id="location9">대전</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=부산'"
								id="location14">부산</th>
						</tr>
						<tr>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=서울'"
								id="location2">서울</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=울산'"
								id="location6">울산</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=인천'"
								id="location3">인천</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=전남'"
								id="location13">전남</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=전북'"
								id="location11">전북</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=제주'"
								id="location16">제주</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=충남'"
								id="location10">충남</th>
							<th tabindex="0" scope="col"
								onclick="location.href='${pageContext.request.contextPath}/hospital/location/detail?locationHaddress=충북'"
								id="location8">충북</th>
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





						<tbody>

							<c:forEach var="location" items="${locationHospital}">
								<tr class="tak">

									<td>${location.hno}</td>
									<td>${location.hname}</td>
									<td>${location.haddress}</td>
									<td>${location.hpn}</td>
									<td><button type="button" class="btn btn-outline-primary"
											onclick="location.href='${pageContext.request.contextPath}/management/modify_management'">내역보기</button></td>
									<td><button type="button" class="btn btn-outline-primary"
											onclick="kakaoMap('${location.haddress}', '${location.hname}')">지도</button></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>




					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>


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
</style>

				</div>
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>