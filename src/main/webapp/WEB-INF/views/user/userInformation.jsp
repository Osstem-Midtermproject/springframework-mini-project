<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>

<div class="container pt-2">
	<div class="row align-items-center">
		<div class="text-center" style="width: 100%; border-bottom: solid rgb(32, 54, 68); margin-bottom: 2rem; padding-bottom: 1rem;">
			<span style="font-weight: 600; font-size: 1.7rem; color: rgb(32, 54, 68); margin-bottom: 1rem; padding-bottom: 1rem;">회원정보 및 병원정보 확인</span>
		</div>
		<div class="" style="width: 80%; margin: auto; font-size: smaller;">
			<div class="d-flex flex-column ">
				<div class="col-12">
					<table class="table m-0">
						<thead class="thead-light">
							<th colspan="3" style="font-size: medium;">회원 정보</th>
						</thead>
					</table>
				</div>
				<div class="d-flex align-items-center">
					<div class="col-4">
						<img src="https://cdn-icons-png.flaticon.com/512/2456/2456349.png" width="85%">
					</div>
					<div class="col-8">
						<table class="table table-hover">
							<tbody>
								<tr>
									<td rowspan="6" style="border-spacing: 0px; border-style: none; padding: 0px; margin: 0px"></td>
								</tr>
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
					</div>
				</div>
			</div>

			<script>
				let passwordTd = window.document.getElementById("userpassword");
				let password = window.document.getElementById("userpassword").innerText;

				console.log(password);
				console.log(password.length);

				let str = "";

				for (let i = 6; i < password.length; i++) {
					if (i < 9) {
						str += password.charAt(i);
					} else {
						str += "*";
					}
				}
				passwordTd.innerText = str;
			</script>

			<div class="d-flex flex-column">
				<div class="col-12">
					<table class="table m-0">
						<thead class="thead-light">
							<th colspan="3" style="font-size: medium;">병원 정보</th>
						</thead>
					</table>
				</div>
				<div class="d-flex align-items-center">
					<div class="col-4 mr-0">
						<img src="https://cdn-icons-png.flaticon.com/512/1907/1907396.png" width="60%" >
					</div>
					<div class="col-8">
						<table class="table table-hover">
							<tbody>
								<tr>
									<td rowspan="5" style="border-spacing: 0px; border-style: none; padding: 0px; margin: 0px"></td>
								</tr>
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
	</div>

<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>

	
</div>



