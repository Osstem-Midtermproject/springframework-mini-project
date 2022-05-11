<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>


<div class="row align-items-center mx-5 px-4">
	<div class="text-center"
		style="width: 100%; border-bottom: solid #f26522; margin-bottom: 2rem;">
		<span style="font-weight: 600; font-size: 1.5rem; color: #f26522;">회원정보
			및 병원정보 확인</span>
	</div>
	<div class="" style="width: 60%; margin: auto; font-size: smaller;">
		<table class="table table-hover">
			<thead class="thead-light">
				<th colspan="2" style="font-size: medium;">회원 정보</th>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>${user.userid}</td>
				</tr>
			<%-- 	<tr>
					<td>비밀번호</td>
					<td id="userpassword">${user.upassword}</td>
				</tr> --%>
				<tr>
					<td>이름</td>
					<td>${user.uname}</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${user.hospital.hemail}</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>${user.uphonenumber}</td>
				</tr>
			</tbody>
		</table>
		
		<script>
			let passwordTd = window.document.getElementById("userpassword");
			let password = window.document.getElementById("userpassword").innerText;
			
			console.log(password);
			console.log(password.length);

			let str = "";
			
		    for (let i=0; i <password.length; i++) {
		    	if(i<3){
		    		str+=password.charAt(i);
		    	}else{
					str+="*";	    		
		    	}
		    }		    
		    passwordTd.innerText=str;
		</script>

		<table class="table table-hover">
			<thead class="thead-light">
				<th colspan="2" style="font-size: medium;">병원 정보</th>
			</thead>
			<tbody>
				<tr>
					<td>병원 이름</td>
					<td>${user.hospital.hname}</td>
				</tr>
				<tr>
					<td>병원 주소</td>
					<td>${user.hospital.haddress}</td>
				</tr>
				<tr>
					<td>병원 전화번호</td>
					<td>${user.hospital.hpn}</td>
				</tr>
				<tr>
					<td>병원 개업일</td>
					<td>${user.hospital.hod}</td>
				</tr>
			</tbody>
		</table>

	</div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>