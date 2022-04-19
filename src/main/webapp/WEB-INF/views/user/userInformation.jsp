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
		<table class="table table-hover ">
			<thead class="thead-light">
				<th colspan="2" style="font-size: medium;">회원 정보</th>
			</thead>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>abcabc123</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>***********</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>김강윤</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>abcabc123@naver.com</td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td>010-1111-1111</td>
				</tr>
			</tbody>
		</table>

		<table class="table table-hover">
			<thead class="thead-light">
				<th colspan="2" style="font-size: medium;">병원 정보</th>
			</thead>
			<tbody>
				<tr>
					<td>병원 이름</td>
					<td>강윤치과</td>
				</tr>
				<tr>
					<td>병원 위치</td>
					<td>서울시 강서구 마곡중앙12로 3</td>
				</tr>
				<tr>
					<td>병원 전화번호</td>
					<td>02-2222-2222</td>
				</tr>

			</tbody>
		</table>

	</div>
</div>
</div>
</div>

<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>